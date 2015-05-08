package MyMealManager;

import java.io.*;

public class testSearch{
	public static void main(String[] args) throws Exception{
		Ingredient eggs = new Ingredient("egg");
		Ingredient banana = new Ingredient("banana");
		Ingredient[] testList = new Ingredient[2];
		testList[0] = eggs;
		testList[1] = banana;
		Recipe[] results = RecipeSearcher.executeSearch(testList);
		for (int i = 0; i < results.length; i++){
			System.out.println(results[i].getRecipeName());
		}
		System.out.println("fin");
	}
}
