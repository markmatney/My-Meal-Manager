/*
 * cleanRecipesAndIngredients.sql
 *
 * Drops the 'Recipes' and 'Ingredients' tables, and creates new (empty) ones in their place.
 *
 * Usage:  mysql> SOURCE cleanRecipesAndIngredients.sql;
 * 
 * Author: Mark Matney
 */

USE CS130;

DROP TABLE Recipes;
DROP TABLE Ingredients;

CREATE TABLE Recipes(
	RecipeID INT NOT NULL AUTO_INCREMENT,
	RecipeName VARCHAR(100) NOT NULL,
	URL VARCHAR(512) NOT NULL,
	Image VARCHAR(512) NOT NULL,
	TotalCookingTime TIME,
	Instructions VARCHAR(2500),
	PRIMARY KEY(RecipeID)
);

CREATE TABLE Ingredients(
	Recipe INT NOT NULL,
	IngredientName VARCHAR(100) NOT NULL,
	Quantity FLOAT,
	Units VARCHAR(100),
	FOREIGN KEY(Recipe) REFERENCES Recipes(RecipeID)
);
