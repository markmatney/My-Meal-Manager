package MyMealManager;

import java.io.*;

public class searchMain{
	public static void main(String[] args) throws Exception{
		Ingredient[] testList = new Ingredient[args.length];
		for (int k = 0; k < args.length; k++){
			testList[k] = new Ingredient(args[k]);
		}
		
		Recipe[] results = RecipeSearcher.executeSearch(testList);
		for (int i = 0; i < results.length; i++){
			System.out.println(results[i].getRecipeName());
		}
	}
}
