package MyMealManager;

import java.util.*;
import java.io.*;

public class Ingredient{
	private String ingredName;
	private int recipeId = -1;  //placeholder - val if hasn't been set
	private float quantity = -1;  //ditto
	private String units;
	public Ingredient(String ingredName){ //for basic recipe searching
		this.ingredName = ingredName;
	}
	public Ingredient(String ingredName, int quantity, String units){
		//for searching recipes with given quantity of ingredients
		this.ingredName = ingredName;
		this.quantity = quantity;
		this.units = units;
	}
	//can set everything except ingredName after creation. name should 
	//stay the same
	public void setQuantity(float quantity){
		this.quantity = quantity;
	}
	public void setUnits(String units){
		this.units = units;
	}
	public void setRecipeId(int recipeId){
		this.recipeId = recipeId;
	}
	public String getIngredName(){
		return ingredName;
	}
	public int getRecipeId(){
		return recipeId;
	}
	public float getQuantity(){
		return quantity;
	}
	public String getUnits(){
		return units;
	}
}
