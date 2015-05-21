/*
 * Webscraper for "My Meal Manager"
 *
 * CS 130, Spring 2015
 *
 * Authors:
 *   Mark Matney
 *   Ken Ohhashi
 *
 * Usage:
 *   1) compile: bash$> javac RecipeSQLGen.java
 *   2) run:     bash$> java Main recipes database nextrecipeid
 * 
 * Input:
 *   1) recipes: a text file containing a variable-length list of
 *      '\n'-delimited recipe names. The file must end with an empty line!
 *   2) database: name of the database to use
 *   3) nextrecipeid: the **next** recipe id to use in the auto-increment field in Recipes
 *
 * Output: prints to stdout a SQL query that inserts recipe information into a
 *         database. The output can then be redirected to a file with >, or piped to
 *         other utilities, such as mysql, with |.
 *
 *         $> java Main recipes [DATABASE] [NEXTRECIPEID] | mysql -h localhost -u [USER] -p[PASS]
 */

import java.io.*;
import java.util.*;
import java.net.*;
import java.lang.Object;
import org.jsoup.Jsoup;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

class Main
{
  public static void main(String[] argv) throws Exception
  {
    int i, n, listsize = 0, garbageflag = 0;
    char c;

    String query = "USE " + argv[1] + ";\n\n", subquery, recipe = "";
    ArrayList<String> recipes = new ArrayList<String>();    
    FileInputStream f;
    int recipeid;
    if (argv.length == 3)
    {
      recipeid = Integer.valueOf(argv[2]);
    }
    else
    {
      recipeid = 1;
    }

    // Parse the file given by argv[0], and store in ArrayList recipes.
    try {
      // parse recipes file

      f = new FileInputStream(argv[0]);
      while ((i = f.read()) != -1)
      {
        // f.read() returns an int, so cast to char
        c = (char) i;

        // If end of line, append String recipe to ArrayList recipes.
        if (c == '\n')
        {
          // At the beginning of the file, there are three garbage bytes. Not sure why.
          // This flag omits them from our final list.
          if (garbageflag == 0)
          {
            garbageflag = 1;
          }
          else
          {
            recipes.add(recipe);
            listsize++;
          }
          recipe = "";
        }
        else
        {
          recipe += c;
        } 
      }
      f.close();
    }
    catch (Exception e) {
      throw e;
    }

    // Iterate over the elements of ArrayList (may want to replace with loop to exploit parallelism).
    // However, with iterator, can safely traverse list without knowing length. Good API.
    Iterator<String> it = recipes.iterator();
    while (it.hasNext())
    {
      recipe = it.next();

      AllRecipesRecipe arr = new AllRecipesRecipe(recipe);
      subquery = arr.generateQuery(recipeid);
      recipeid++;
      query += subquery + "\n\n";
    }

    System.out.println(query);
  }
}

abstract class Recipe
{
  // members
  protected String searchedname;
  protected String name;
  protected String url;
  protected String image;
  protected String time;
  protected ArrayList<Ingredient> ingredients;
  protected ArrayList<String> instructions;
  protected Document dom;

  // functions

  public Recipe(String n)
  {
    searchedname = n;
  }

  // converts INSTRUCTIONS TO STRING!!
  public String instructionsToString()
  {  
    String ret = "";//"Recipe:\n\turl: " + url + "\n\tingreds: " + ingredients.toString() + "\n\tinsns: \n";
    Iterator<String> it = instructions.iterator();
    int i = 0;
    while (it.hasNext())
    {
      ret += it.next() + " ";
      i++;
    }
    return ret;
  }

  final String generateQuery(int id) throws IOException, Exception
  {
    try {
      createDOM();
      parseDOM();
      return convertDataToQuery(id);
    }
    catch (Exception e) { // cannot generate recipe for some reason (no search results, etc.)
      // System.out.println(name + e);
      return "";
    }
  }

  abstract void createDOM() throws IOException;
  abstract void getName();
  abstract void getImage();
  abstract void getTime();
  abstract void getIngredients();
  abstract void getInstructions();

  final void parseDOM()
  {
    getName();
    getImage();
    getTime();
    getIngredients();
    getInstructions();
  }

  final String convertDataToQuery(int id)
  {
    //String result = new StringBuilder(1024).append("INSERT INTO Recipes VALUES (").append(id).append(",").append(name+",othershit)").toString();
    //String result = new StringBuilder(1024).append("INSERT INTO Recipes VALUES (").append(id).append(",").append(name).append(","+url).toString();

    // store the entire query (recipe table insert + ingredient table insert) in string
    String query = "INSERT INTO Recipes (RecipeName, URL, Image, TotalCookingTime, Instructions) VALUES (\n\t'" + name + "',\n\t'" + url + "',\n\t'" + image + "',\n\t'" + time + "',\n\t'" + this.instructionsToString() + "'\n);\n";
    // iterate over ingredients and append to query
    Iterator<Ingredient> it = ingredients.iterator();
    while (it.hasNext())
    {
      Ingredient i = it.next();
      query += "INSERT INTO Ingredients VALUES (\n\t" + id + ",\n\t'" + i.name() + "',\n\t" + i.qty() + ",\n\t'" + i.units() + "'\n);\n";
    }
    //return query + "\n";
    return query.replaceAll("[^\\x00-\\x7F]", "") + "\n";// also need to remove such things as &amp;
  }
}

class AllRecipesRecipe extends Recipe
{
  public AllRecipesRecipe(String n)
  {
    super(n);
  }

  public void createDOM() throws IOException
  {  
    String searchurl = "http://allrecipes.com/search/default.aspx?wt=" + searchedname.replaceAll(" ", "%20").replaceAll("&", "%26").replaceAll("\n", "");

    Document doc1 = Jsoup.connect(searchurl).get(); // Java representation of DOM that our class methods will parse

    Elements links = doc1.select("a.title");
    String recipeurl = "";
    for (Element link : links)
    {
      // Extract innner html from elements containing ingredient name and amount
      //doc = Jsoup.connect(link.attr("abs:href")).get();
      //recipeurl = doc.location();
      recipeurl = link.attr("abs:href");
    }
    url = recipeurl; 
    // System.out.println(url);
    dom = Jsoup.connect(recipeurl).get(); // Java representation of DOM that our class methods will parse

  }
  public void getName()
  {
    name = dom.select("#itemTitle").html();
  }

  public void getImage()
  {
    // get image
    String imgurl = dom.select("img#imgPhoto").attr("src");
    // TODO: replace with storing binary image file instead
    image = imgurl;
  }

  public void getTime()
  {
    String t = "";
    String[] timetitle = dom.select("#pnlReadyInTime").attr("title").split(" ");

    int i = 0;
    while (i < timetitle.length)
    {
      // check for index out of bounds
      if (timetitle[i].toLowerCase().compareTo("hour") == 0 || timetitle[i].toLowerCase().compareTo("hours") == 0)
      {
        if (timetitle[i-1].length() == 1)
        {
          t += "0";
        }
        t += timetitle[i-1] + ":";
        break;
      }
      i++;
    }
    if (t.length() == 0)
    {
      t += "00:";
      i = 0;
    }

    while (i < timetitle.length)
    {
      // check for index out of bounds
      if (timetitle[i].toLowerCase().compareTo("minute") == 0 || timetitle[i].toLowerCase().compareTo("minutes") == 0)
      {
        if (timetitle[i-1].length() == 1)
        {
          t += "0";
        }
        t += timetitle[i-1] + ":00";
        break;
      }
      i++;
    }
    if (t.length() == 3)
    {
      t += "00:00";
    }
    time = t;    
  }

  public void getIngredients()
  {
    Ingredient i;
    String n, qs, u, amt;
    Float qf;
    ArrayList<Ingredient> is = new ArrayList<Ingredient>();

      // In the allrecipes recipe pages, the ingredients are located inside <p class="fl-ing">
    Elements ps = dom.select("p.fl-ing");
    for (Element p : ps)
    {
      // Extract innner html from elements containing ingredient name and amount
      n = p.select(".ingredient-name").html();
      // TODO: May want to further process name?
      amt = p.select(".ingredient-amount").html();

      // Split amount into quantity (numerical) and units (alpabetical)
      // All characters that are not letters (i.e., digits, spaces, and /) belong to quantity
      // e.g. "1 1/4"
      int j;
      for (j = 0; j < amt.length() && !Character.isLetter(amt.charAt(j)); j++)
      {
        if (amt.charAt(j) == '(')
        {
          while (amt.charAt(j) != ')')
          {
            j++;
          }
        }
      }
 
      // TODO: if there is something in parenthesis, that is the units! FIX

      // TODO: does this ever happen when amt.length() != 0 ?
      // System.out.println("**: " + j);
      if (j == 0) // the first character of amt is a letter, e.g. "salt and pepper to taste"
      {
        qs = "";
        qf = new Float(0); // should do something better than this eventually
        u = "unit";
      }
      else if (j != amt.length()) // there are units, e.g. "5 tablespoons" or "1 cup"
      {
        j--;
        if (amt.contains("("))
        {
          qs = amt.substring(0, amt.indexOf('(') - 1);
        }
        else
        {
          qs = amt.substring(0, j);
        }
        qf = IngredientAmount.toFloat(qs);
 
        // Remaining characters represent belong to units, e.g. "tablespoon"
        u = amt.substring(j + 1);

        // singularize units (remove 's' from the end)
        if (u.length() > 0 && u.charAt(u.length() - 1) == 's')
        {
          u = u.substring(0, u.length() - 1);
        }
      }
      else // no units, e.g. "1 onion"
      {
        if (amt.contains("("))
        {
          qs = amt.substring(0, amt.indexOf('(') - 1);
        }
        else
        {
          qs = amt;
        }
        qf = IngredientAmount.toFloat(qs);
        u = "unit";
      }

      i = new Ingredient(n, qs, qf, u);
      is.add(i);
    }
    ingredients = is;
  }

  public void getInstructions()
  {
    // get instructions
    ArrayList<String> insns = new ArrayList<String>();
    String insn;

    // Instructions are inside an <ol> immediately following <div id="msgDirections">
    Elements ol = dom.select("div#msgDirections + ol");
    Elements lis = ol.select("li");
    for (Element li : lis)
    {
      insns.add(li.select("span").html());;
    }
    instructions = insns;
  }

}

class Ingredient
{
  public String name;
  public String quantity; // for display only

  public Float qty;
  // ** use numerical representation to do reduction calculations

  public String units;

  public Ingredient(String n, String qs, Float qf, String u)
  {
    name = n;

    // TODO: convert q to Number, so that we can calculate recipe reductions
    // for example
    // 1/3 -> 0.33
    // 1 1/4 -> 1.25
    // 2 -> 2.0
    // However, may still want to store the string version for easy display
    // (1/3 looks better than 0.33)
    quantity = qs;
    qty = qf;
    units = u;
  }

  public String name()
  {
    return name;
  }

  public String quantity()
  {
    return quantity;
  }

  public String qty()
  {
    if (qty == 0)
      return "NULL";
    else
      return qty.toString();
  }

  public String units()
  {
    return units;
  }
}

class IngredientAmount
{
  public static Float toFloat(String str)
  {
    int i;

    // remove parenthesized crap
    
    if (str.contains("(") && str.contains(")"))
    {
      i = str.indexOf('(');
      return toFloat(str.substring(0, i-1));
    }
    else if (str.contains(" "))
    {
      i = str.indexOf(' ');
      return toFloat(str.substring(0, i)) + toFloat(str.substring(i+1, str.length()));
    }
    else if (str.contains("/"))
    {
      i = str.indexOf('/');
      return toFloat(str.substring(0, i)) / toFloat(str.substring(i+1, str.length()));
    }
    else
    {
      // return floating point value of string that contains an int
      return Float.parseFloat(str);
    }
  }
}
