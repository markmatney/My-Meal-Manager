package MyMealManager;

import java.io.*;
import java.lang.Integer;

public class searchMain{
	public static void main(String[] args) throws Exception{
		if (args.length == 0){
			System.out.println("Error - please supply userid to search");
			System.exit(0);
		}

		Ingredient[] testList = new Ingredient[args.length - 1];
		for (int k = 1; k < args.length; k++){
			testList[k-1] = new Ingredient(args[k]);
		}

		Recipe[] results = RecipeSearcher.executeSearch(Integer.parseInt(args[0]), testList);
		if (results != null){
			for (int i = 0; i < results.length; i++){
				System.out.println(results[i].getRecipeName());
			}
		}
	}
}
