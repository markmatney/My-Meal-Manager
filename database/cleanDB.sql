/*
 * cleanDB.sql
 *
 * Drops the CS130 database, then create a new (empty) database of the same name.
 *
 * Usage:  mysql> SOURCE cleanDB.sql;
 *
 * Author: Mark Matney
 */

DROP DATABASE CS130;
CREATE DATABASE CS130;

USE CS130;

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

CREATE TABLE UserUNandID(
	UserID INT NOT NULL AUTO_INCREMENT,
	UserName VARCHAR(100) NOT NULL,
	Password VARCHAR(100) NOT NULL,
	PRIMARY KEY(UserID),
	UNIQUE(UserName)
);

CREATE TABLE UserRecipes(
	UserID INT NOT NULL,
	RecipeID INT NOT NULL,
	FOREIGN KEY(UserID) REFERENCES UserUNandID(UserID),
	FOREIGN KEY(RecipeID) REFERENCES Recipes(RecipeID)
);

CREATE TABLE Inventory(
	UserID INT NOT NULL,
	IngredientName VARCHAR(100) NOT NULL,
	Quantity FLOAT,
	Units VARCHAR(100),
	FOREIGN KEY(UserID) REFERENCES UserUNandID(UserID)
);

CREATE TABLE GroceryList(
	UserID INT NOT NULL,
	IngredientName VARCHAR(100) NOT NULL,
	Quantity FLOAT,
	Units VARCHAR(100),
	FOREIGN KEY(UserID) REFERENCES UserUNandID(UserID)
);
