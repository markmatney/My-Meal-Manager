package MyMealManager;

import java.util.*;
import java.lang.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RecipeSearcher{
	public static ArrayList<Integer> getRids(Ingredient[] ingredients){	
		//get all rids that use one+ of the ingredients
		String queryBase = "SELECT Recipe FROM Ingredients WHERE IngredientName LIKE '";
		int ingredLen = ingredients.length;
		ArrayList<int[]>/*<ResultSet>*/ ingredMatches = 
                                              new ArrayList<int[]>();
		Connection conn;

		//create connection to database
		try {
                     conn = DbManager.getConnection(true);

		for (int i = 0; i < ingredLen; i++){
			ResultSet rs = 
			conn.createStatement().executeQuery(queryBase + ingredients[i].getIngredName() + "'");
			if (rs != null && rs.last()){
				int rsCount = rs.getRow();
				rs.beforeFirst();
				int[] rsArr = new int[rsCount];
				int arrPos = 0; 
				while(rs.next()){
		                      rsArr[arrPos] = rs.getInt("Recipe"); 
				      arrPos++;
				}
				ingredMatches.add(rsArr);
			}
		}
		conn.close(); }//close connection
		catch (SQLException ex){System.out.println(ex);}
		//sort ingredMatches to get rids of recipes that include ALL
		//of the ingredients that were searched for
		if (ingredMatches.size() == ingredients.length){ //check for non-empty list
			ArrayList<Integer> ridsWithAllIngred = 
				new ArrayList<Integer>(); 
			int[] firstArr = ingredMatches.get(0);
			int firstArrLen = firstArr.length;
			boolean ridInAll = false;
			for (int i = 0; i < firstArrLen; i++){
				//check all other arrays for rid.
				//Don't add rid if any array doesn't have it
				int ridToCheck = firstArr[i];
				for (int j = 0; j < ingredMatches.size(); j++){
					int[] arrToCheck = ingredMatches.get(j);
					int arrToCheckLen = arrToCheck.length;
					for (int k = 0; k < arrToCheckLen; k++){
						if (arrToCheck[k] == ridToCheck)
							ridInAll = true;
					}			
					if (!ridInAll)
						break; //rid missing from an arr
				}
				if (ridInAll)
					ridsWithAllIngred.add(ridToCheck);
				ridInAll = false;
			}
			return ridsWithAllIngred;
		}
		return null; //no matches found!
	}
	public static Recipe[] getMatchingRecipes(ArrayList<Integer> rids){
		if (rids == null){
			System.out.println("No matching recipes found!");
			return null;
		}
		int ridLen = rids.size();
		ArrayList<ResultSet> recipeMatches = new ArrayList<ResultSet>();
		String queryBase = "SELECT * FROM Recipes WHERE RecipeID=";
		Connection conn;

		//create connection to database
		try {
                     conn = DbManager.getConnection(true);

		if (ridLen == 1 && rids.get(0) == -1){ //means ret all recipes
				ResultSet rs = 
			conn.createStatement().executeQuery("SELECT * FROM Recipes");
			if (rs != null && rs.last()){
				int rsCount = rs.getRow();
				rs.beforeFirst();
				Recipe[] recipes = new Recipe[rsCount];
				int arrPos = 0; 
				while(rs.next()){
		                      recipes[arrPos] = new Recipe(rs.getString("RecipeName"), rs.getInt("RecipeID"), rs.getString("Instructions"), rs.getTime("TotalCookingTime").getHours(), rs.getTime("TotalCookingTime").getMinutes());
 
				      arrPos++;
				}
				conn.close();
				return recipes;
			}
			//if get to next 2 lines, no recipes in db or 
			//something went wrong
			conn.close();
			return null;
		}

		//for normal recipe matching (specific set, not all rids)
		else{
		for (int i = 0; i < ridLen; i++){
			ResultSet rs = 
			conn.createStatement().executeQuery(queryBase + 
				Integer.toString(rids.get(i)));
			if (rs != null)
	                       recipeMatches.add(rs);
		}
		
		//initialize recipe array
		int matchLen = recipeMatches.size();
		Recipe[] recipes = new Recipe[matchLen];
		//put results into recipe arraylist
		for (int i = 0; i < matchLen; i++){
			ResultSet rs = recipeMatches.get(i);
			if (rs != null && rs.next()){
				recipes[i] = new Recipe(rs.getString("RecipeName"), rs.getInt("RecipeID"), rs.getString("Instructions"), rs.getTime("TotalCookingTime").getHours(), rs.getTime("TotalCookingTime").getMinutes());
			}
		}
		conn.close();//close connection
		return recipes;
		}
		}
		catch (SQLException ex){System.out.println(ex);}
		return null;
	}
	public static Recipe[] sortByMissingIngred(int userid, Recipe[] recipes){
		int recipesLen = recipes.length;
		Connection conn;
		//create connection to database
		try {
                     conn = DbManager.getConnection(true);
			for (int i = 0; i < recipesLen; i++){
				ResultSet rs = 
				conn.createStatement().executeQuery("SELECT COUNT(*) AS numMissing FROM Ingredients i WHERE i.Recipe=" + recipes[i].getRecipeId() + " AND i.IngredientName NOT IN (SELECT Inventory.IngredientName FROM Inventory WHERE UserID=" + userid + ") AND i.IngredientName NOT IN (SELECT GroceryList.IngredientName FROM GroceryList WHERE UserID=" + userid + ")");
				if (rs != null && rs.next())
                                    recipes[i].setMissingIngreds(rs.getInt("numMissing"));
			}
		}
		catch (SQLException ex){System.out.println(ex);}	
		Arrays.sort(recipes);
		return recipes;
	}
	public static Recipe[] executeSearch(int userid, Ingredient[] ingredients){

		Recipe[] recipes;
		if (ingredients.length > 0){
			ArrayList<Integer> rids = getRids(ingredients);
			recipes = getMatchingRecipes(rids);
		}
		else{ //handle case of no input ingreds
			ArrayList<Integer> ridsWithAllIngred = 
				new ArrayList<Integer>(); 
			ridsWithAllIngred.add(-1); //assume normal rids are +
			recipes = getMatchingRecipes(ridsWithAllIngred);
		}
		return sortByMissingIngred(userid, recipes);
	}

}
