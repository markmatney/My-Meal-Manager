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
    String query = "CREATE TABLE something something mysql\n", subquery, recipe = "", recipeurl;
    ArrayList<String> recipes = new ArrayList<String>();    
    FileInputStream f;

    // Parse the file given by argv[0], and store in ArrayList recipes.
    try {
      f = new FileInputStream(argv[0]);
      while ((i = f.read()) != -1)
      {
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

      // TODO: For each recipe, issue HTTP GET. Some sort of Google Search. Grab URL of recipe page.
      recipeurl = "http://allrecipes.com/recipe/mouses-macaroni-and-cheese/"; // For example, replace with appropriate implementation of search/URL scrape.

      // Recipe class parses the HTML and loads data into Recipe object
      Recipe r = new Recipe(recipeurl);

//      System.out.println(r.toString());

      // TODO: Iterate over this data structure and construct an SQL subquery (sql-ify)
      subquery = "INSERT into table blah blah blah" + r.url;

      // Append subquery to query.
      query += subquery + "\n";
    }
    System.out.println(query);
  }
}

class Recipe
{
  // source url, list of ingredients, instructions
  public String url;
  public ArrayList<Ingredient> ingredients;
  public ArrayList<String> instructions;

  // constructor
  public Recipe(String src) throws IOException
  {
    url = src;
    Document doc = Jsoup.connect(src).get(); // Java representation of DOM that our class methods will parse
    ingredients = getIngredients(src, doc);
    instructions = getInstructions(src, doc);
  }

  public String toString()
  {  
    return "Recipe:\n\turl: " + url + "\n\ting: " + ingredients.toString() + "\n\tins: " + instructions.toString() + "\n";
  }

  public ArrayList<Ingredient> getIngredients(String src, Document doc)
  {
    Ingredient i;

    // TODO: write a regex to extract site name from url.
    // e.g. http://allrecipes.com/recipe/mouses-macaroni-and-cheese/ -> allrecipes.com

    String n, q, u, site = "some regex";
    ArrayList<Ingredient> is = new ArrayList<Ingredient>();

    site = "allrecipes"; // delete after regex works
    
    if ("allrecipes" == site)
    {
      Elements ps = doc.select("p.fl-ing");
      for (Element p : ps)
      {
        n = p.select(".ingredient-name").html();
        u = p.select(".ingredient-amount").html();
        int j;
        for (j = 0; !Character.isLetter(u.charAt(j)) && j < u.length(); j++) {}
        j--;

        q = u.substring(0, j); // get numerical part
        u = u.substring(j + 1); // get alphabetical part

        // singularize units
        if (u.charAt(u.length() - 1) == 's')
        {
          u = u.substring(0, u.length() - 1);
        }          

        i = new Ingredient(n, q, u);
        is.add(i);
      }
    }
    // TODO: Enable scraping from other sites as well. Study source HTML and figure out how to parse.
    else if ("simplyrecipes" == site)
    {

    }
    else if ("tasteofhome" == site)
    {

    }
    else
    {
      // TODO: Decide what to do for this case.
      System.out.println("unknown site");
    }
    return is;
  }

  public ArrayList<String> getInstructions(String src, Document doc)
  {
    ArrayList<String> insns = new ArrayList<String>();
    String insn, site = "regex on src";
    site = "allrecipes";

    if ("allrecipes" == site)
    {
      Elements ol = doc.select("div#msgDirections + ol");
      Elements lis = ol.select("li");
      for (Element li : lis)
      {
        insns.add(li.select("span").html());;
      }
      
    }
    // TODO: Enable scraping from other sites.
    else if ("simplyrecipes" == site)
    {

    }
    else if ("tasteofhome" == site)
    {

    }
    else
    {
      // TODO: Decide what to do for this case.
      System.out.println("unknown site");
    }
    return insns;
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
