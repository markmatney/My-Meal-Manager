package MyMealManager;

import java.util.*;
import java.io.*;

public class Recipe implements Comparable<Recipe>{
	private String recipeName;
	private int recipeId;
	private String instructions;
	//together, cookHours and cookMinutes cover total cooking time
	private int cookHours;
	private int cookMinutes;
	
	private int missingIngreds; //num of ingreds need to buy or add to
				    //grocery list before user can make
	//add support for images?

	public Recipe(String recipeName, int recipeId, String instructions, int cookHours, int cookMinutes){
		this.recipeName = recipeName;
		this.recipeId = recipeId;
		this.instructions = instructions;
		this.cookHours = cookHours;
		this.cookMinutes = cookMinutes;	
	}
	//nothing should change about recipe after creation -> no setters

	public String getRecipeName(){
		return recipeName;
	}
	public int getRecipeId(){
		return recipeId;
	}
	public String getInstructions(){
		return instructions;
	}
	public int getCookHours(){
		return cookHours;
	}
	public int getCookMinutes(){
		return cookMinutes;
	}
	public int getMissingIngreds(){
		return missingIngreds;
	}
	public void setMissingIngreds(int missingIngreds){
		this.missingIngreds = missingIngreds;
	}

	//function for sorting recipes by num of missing ingredients
	public int compareTo(Recipe recipeToCompare){
               return this.missingIngreds - recipeToCompare.getMissingIngreds();
	}

}
