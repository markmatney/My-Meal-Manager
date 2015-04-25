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

class Main
{
  public static void main(String[] argv) throws Exception
  {
    int i, n, listsize = 0, garbageflag = 0;
    char c;
    String query = "", recipe = "";
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
      System.out.println(recipe); // REMOVE THIS LINE

      // For each recipe, issue HTTP GET. Some sort of Google Search.
      // Grab HTML of recipe page.
      // Parse the HTML, loading the relevant recipe information into a data structure
      // Iterate over this data structure and construct an SQL subquery (sql-ify)
      // Append subquery to query.
    }
  }
}
