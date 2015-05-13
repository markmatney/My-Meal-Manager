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
 *   2) run:     bash$> java Main recipes
 * 
 * Input:
 *   1) recipes: a text file containing a variable-length list of
 *      '\n'-delimited recipe names. The file must end with an empty line!
 *   2) other options......
 *
 * Output: prints to stdout a SQL query that inserts recipe information into a
 *         database. The output can then be redirected to a file with >, or piped to
 *         other utilities, such as mysql, with |.
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

    String query = "", subquery, recipe = "";
    ArrayList<String> recipes = new ArrayList<String>();    
    FileInputStream f;

    // Parse the file given by argv[0], and store in ArrayList recipes.
    try {
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
      subquery = arr.generateQuery();
      query += subquery + "\n\n";
    }

    System.out.println("** in main: \n" + query);
  }
}

abstract class Recipe
{
  // members
  protected String name;
  protected String url;
  // image??
  //
  protected Document dom;
  protected String time;
  protected ArrayList<Ingredient> ingredients;
  protected ArrayList<String> instructions;

  // functions

  public Recipe(String n)
  {
    name = n;
  }

  public String toString()
  {  
    String ret = "Recipe:\n\turl: " + url + "\n\tingreds: " + ingredients.toString() + "\n\tinsns: \n";
    Iterator<String> it = instructions.iterator();
    int i = 0;
    while (it.hasNext())
    {
      ret += "\t\t" + i + ": " + it.next() + "\n";
      i++;
    }
    return ret;
  }

  final String generateQuery() throws IOException, Exception
  {
    try {
      createDOM();
      parseDOM();
      return convertDataToQuery();
    }
    catch (Exception e) { // cannot generate recipe for some reason (no search results, etc.)
      return "";
    }
  }

  abstract void createDOM() throws IOException;
  abstract void getIngredients();
  abstract void getInstructions();
  abstract void getTime();

  final void parseDOM()
  {
    getIngredients();
    getInstructions();
    getTime();
  }

  final String convertDataToQuery()
  {
    // fucked up part
    String id = "6", time = "40";

    // not sure why java is concatenating these incorrectly
    System.out.println("** in method: Recipe.convertDataToQuery() **");
    return "INSERT INTO Recipes VALUES (" + id + "," + name + ",'" + url + "')";
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
    String searchurl = "http://allrecipes.com/search/default.aspx?wt=" + name.replaceAll(" ", "%20").replaceAll("&", "%26").replaceAll("\n", "");

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
    System.out.println(url);
    dom = Jsoup.connect(recipeurl).get(); // Java representation of DOM that our class methods will parse
  }

  public void getIngredients()
  {
    Ingredient i;

    // TODO: write a regex to extract site name from url.
    // e.g. http://allrecipes.com/recipe/mouses-macaroni-and-cheese/ -> allrecipes.com

    String n, q, u, amt, site = "some regex";
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
      for (j = 0; j < amt.length() && !Character.isLetter(amt.charAt(j)); j++) {}
 
      // TODO: if there is something in parenthesis, that is the units! FIX

      // TODO: does this ever happen when amt.length() != 0 ?
      if (j == 0) // e.g. "salt and pepper to taste"
      {
        q = ""; // should do something better than this eventually
        u = "";
      }
      else
      {
        if (j != amt.length()) // there are units
        {
          j--;  
          q = amt.substring(0, j);
 
          // Remaining characters represent belong to units, e.g. "tablespoon"
          u = amt.substring(j + 1);

          // singularize units (remove 's' from the end)
          if (u.length() > 0 && u.charAt(u.length() - 1) == 's')
          {
            u = u.substring(0, u.length() - 1);
          }
        }
        else // no units
        {
          q = amt;
          u = "";
        }
      }
      i = new Ingredient(n, q, u);
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

  public void getTime()
  {
    // set time to the total cook time (in minutes)
  }
}

class Ingredient
{
  public String name;
  public String quantity; // for display only

  // public Number qty
  // ** use numerical representation to do reduction calculations

  public String units;

  public Ingredient(String n, String q, String u)
  {
    name = n;

    // TODO: convert q to Number, so that we can calculate recipe reductions
    // for example
    // 1/3 -> 0.33
    // 1 1/4 -> 1.25
    // 2 -> 2.0
    // However, may still want to store the string version for easy display
    // (1/3 looks better than 0.33)
    quantity = q;
    units = u;
  }

  public String toString()
  {
    return quantity + ":" + units + ":" + name;
  }
}
