<?php
/*
todo:

how to handle recipeid uniqueness
time for recipe, change to minutes

*/
class databaseAPI {
    private $db_connection;
    
    /* Constructor - open db_connection */
    function __construct(){
	      $host = "localhost";
	      $user = "cs143";
		  $pw = "";
		  $db = "CS143";
         $this->db_connection = mysql_connect($host, $user,$pw);
         mysql_select_db($db, $this->db_connection);
         if(!$this->db_connection)
         {
           $errmsg = mysql_error($this->db_connection);
           print "Connection failed: $errmsg <br />";
           exit(1);
         }
    }
 
    /* getUserID
	
	Takes username and converts it to ID
	*/
	function getUserID($name){
	     $id =  mysql_fetch_assoc(@mysql_query("SELECT UserID FROM UserUNandID WHERE '$name' = UserName"));
	     $userid = $id['UserD'];
		  if($userid == 0)
		     print "User doesn't exist!";
		  else
	         return $userid;
	}
	
	/* addUser
	
	Takes username,password and adds to user list
	*/
	function addUser($name,$pw){
	    if(($name != NULL) && ($pw != NULL)){
              $count = @mysql_query("SELECT COUNT(*) as count FROM UserUNandID  WHERE ('$name' = UserName)");
		  $countdata = mysql_fetch_assoc($count);
		  if($countdata['count'] >= 1){
		         print "User already exsists!";
                return;
				}
          else
		  {   
		       $id = generateid();
              @mysql_query("INSERT INTO UserUNandID VALUES	('$id','$name','$pw')");
          }			  
		}		
	}
	
	/*  addToInventory

	Takes as input a UserId, ingredient name, quantity, and units
	and adds the ingredient to the corresponding User's InventoryList.
	If ingredient already exists it will increment the quantity by the given amount.
	*/
	function addToInventory($userid, $ingredient, $qty, $units){
	   if(($userid != NULL) &&($ingredient != NULL) && ($qty != NULL)&& ($units != NULL))
	   { 
	      if($qty <= 0)
		     return;
		  $count = @mysql_query("SELECT COUNT(*) as count FROM Inventory WHERE (UserID = '$userid' 
		                         AND IngredientName = '$ingredient'  AND Units ='$units')");
		  $countdata = mysql_fetch_assoc($count);
		  if($countdata['count'] >= 1)
			 @mysql_query("UPDATE Inventory SET Quantity = Quantity + '$qty' WHERE (UserID ='$userid' 
			               AND IngredientName = '$ingredient'  AND Units ='$units')");
		  else
		     @mysql_query("INSERT INTO Inventory VALUES ('$userid','$ingredient','$qty','$units')");
		}
	}

	/*  removeFromInventory

	Takes as input a UserId, ingredient name, quantity, and units
	and removes or decrements the given amount of ingredients 
	from the corresponding User's InventoryList.
	*/
	function removeFromInventory($userid, $ingredient, $qty, $units){
		 if((userid != NULL) && ($ingredient != NULL) && ($qty != NULL)&& ($units != NULL))
		 { 
		   if($qty <= 0)
		     return;
		   $amt = mysql_query("SELECT Quantity as Quantity FROM Inventory WHERE (UserID = '$userid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		   $amtdata = mysql_fetch_assoc($amt);
           if($amtdata['Quantity'] > $qty)
			 @mysql_query("UPDATE Inventory SET Quantity = Quantity - '$qty' WHERE (UserID = '$userid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		   else
		     @mysql_query("DELETE FROM Inventory WHERE (UserID = '$userid' AND IngredientName = '$ingredient' AND Units ='$units')");
	     }
	}

	/* getInventory

	Takes as input a UserId and prints out
	all items in the corresponding InventoryList in the format:
	<Quantity> <Units> <IngredientName> <br>
	*/
	function getInventory($userid){
		$invenlist = @mysql_query("SELECT * FROM Inventory WHERE UserID = '$userid' ");
		while($row = @mysql_fetch_assoc($invenlist)) 
		{
					print $row['Quantity']  . " " .  $row['Units'] . " " .  $row['IngredientName'] . '<br>' ;
		}
	}

	/*  addToGrocery
	 
	Takes as input a UserId, ingredient name, quantity, and units
	and adds the ingredient to the corresponding User's GroceryList.
	If ingredient already exists it will increment the quantity by the given amount.
	*/
	function addToGrocery($userid, $ingredient, $qty, $units){
	   if(($userid != NULL) &&($ingredient != NULL) && ($qty != NULL)&& ($units != NULL))
	   {  
	        if($qty <= 0)
		     return;
		  $count=  @mysql_query("SELECT COUNT(*) as count FROM GroceryList WHERE (UserID = '$userid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		  $countdata = mysql_fetch_assoc($count);
		  if($countdata['count'] >= 1)
			  @mysql_query("UPDATE GroceryList SET Quantity = Quantity + '$qty' WHERE (UserID ='$userid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		  else
		      @mysql_query("INSERT INTO GroceryList VALUES ('$userid','$ingredient','$qty','$units')");
		}
	}

	/*  removeFromGrocery
	
	Takes as input a UserId, ingredient name, quantity, and units
	and removes or decrements the given amount of ingredients 
	from the corresponding User's GroceryList.
	*/
	function removeFromGrocery($userid, $ingredient, $qty, $units){
		if((userid != NULL) && ($ingredient != NULL) && ($qty != NULL)&& ($units != NULL))
		{ 
		  if($qty <= 0)
		     return;
		   $amt =  @mysql_query("SELECT Quantity as Quantity FROM GroceryList WHERE (UserID = '$userid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		   $amtdata = mysql_fetch_assoc($amt);
		   if($amtdata['Quantity'] > $qty)
			  @mysql_query("UPDATE GroceryList SET Quantity = Quantity - '$qty' WHERE (UserID = '$userid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		   else
		      @mysql_query("DELETE FROM GroceryList WHERE (UserID = '$userid' AND IngredientName = '$ingredient' AND Units ='$units')");
		}
	}

	/* getGrocery

	Takes as input a UserId and prints out
	all items in the corresponding GroceryList in the format:
	<Quantity> <Units> <IngredientName> <br>
	*/
	function getGrocery($userid){
		$list = @mysql_query("SELECT * FROM GroceryList WHERE UserID = '$userid' ");
		while($row = @mysql_fetch_assoc($list)) 
		{
			print $row['Quantity']  . " " .  $row['Units'] . " " .  $row['IngredientName'] . '<br>' ;
		}
	}
    
	/* getRecipeID
	
	Takes recipe name and converts it to ID
	*/
	function getRecipeID($recipe){
	     $id =  mysql_fetch_assoc(@mysql_query("SELECT RecipeID FROM Recipes WHERE '$recipe' = RecipeName"));
	     $recipeid = $id['RecipeID'];
		  if($recipeid == 0)
		     print "Recipe doesn't exist!";
		  else
	         return $recipeid;
	}
	
	/* addRecipe

	Takes as input a name, url, image, cooking time(minutes), instructions and
	adds the recipe to the list of recipes. 
	*/
	function addRecipe($id, $name,$url,$time,$instructions){
	   @mysql_query("INSERT INTO Recipes VALUES ('$id','$name','$url',NULL, '$time', '$instructions')");
	}
	 
	/* addIngredientToRecipe

	Takes as input a recipe name, ingredient name, quantity, units
	and adds them to the ingredients table for that recipe.
	*/
	function addIngredientToRecipe($recipe, $ingredient, $qty, $units){
	   $recipeid = $this->getRecipeID($recipe);
	   if(($recipeid != NULL) && ($ingredient != NULL) && ($qty != NULL)&& ($units != NULL))
		{ 
		  if($qty <= 0)
		     return;
		   $count = @mysql_query("SELECT COUNT(*) as count FROM Ingredients WHERE (Recipe = '$recipeid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		   $countdata = mysql_fetch_assoc($count);
		   if($countdata['count'] >= 1)
		     @mysql_query("UPDATE Ingredients SET Quantity = Quantity + '$qty' WHERE (Recipe = '$recipeid' AND IngredientName = '$ingredient'  AND Units ='$units')");
		   else
		     @mysql_query("INSERT INTO Ingredients VALUES ('$recipeid','$ingredient','$qty','$units')");
	     }
	}

	/* getRecipeIngredients
	
	Takes as input a Recipe name and outputs the
	Recipe's ingredients in the format:
	<Quantity1> <Units1> <IngredientName1> <br>
	<Quantity2> <Units2> <IngredientName2> <br>
	...
	*/
	function getRecipeIngredients($recipe){
	   $recipeid = $this->getRecipeID($recipe);
	   {  
	       $list = @mysql_query("SELECT * FROM Ingredients WHERE Recipe = '$recipeid'");
		   while($row = @mysql_fetch_assoc($list)) 
		   {  
			  print $row['Quantity']  . " " .  $row['Units'] . " " .  $row['IngredientName'] . '<br>' ;
		   }	
		}
	}

	/* getRecipe

	Takes as input a Recipe name and outputs
	the Recipe in the format:
	<RecipeName> <br>
	<URL> <br>
	<Image> <br>
	<TotalCookingTime> <br>
	<Quantity1> <Units1> <IngredientName1> <br>
	<Quantity2> <Units2> <IngredientName2> <br>
	...
	<Instructions> <br>
	*/
	function getRecipe($recipe){
	        $recipeid = $this->getRecipeID($recipe);
		     $list = mysql_fetch_assoc(@mysql_query("SELECT * FROM Recipes WHERE RecipeID = '$recipeid'"));
			 print $list['RecipeName'] . '<br>' ;
			 print $list['URL'] . '<br>' ;
		     print $list['Image'] . '<br>' ;
		     print $list['TotalCookingTime'] . '<br>' ;
		     $this->getRecipeIngredients($recipe);
		     print $list['Instructions'] . '<br>' ;
	    
	}
	
	/*  addRecipeToUser

	Takes as input a UserId and Recipe Name and adds the recipe
	to the user's saved RecipeList.
	*/
	function addRecipeToUser($recipe,$userid){
	 if(($recipe != NULL) && ($userid != NULL))
		{ 
	     $recipeid = $this->getRecipeID($recipe);
		 $count = @mysql_query("SELECT COUNT(*) as count FROM UserRecipes WHERE (RecipeID = '$recipeid' AND UserID ='$userid')");
		   $countdata = mysql_fetch_assoc($count);
		   if($countdata['count'] >= 1)
		     return;
		   else
		    @mysql_query("INSERT INTO UserRecipes Values('$userid','$recipeid')");
		  }
	}

	/* getUserRecipes

	Takes as input a UserID and outputs the
	associated RecipeList in the format:
	<RecipeName> <br>
	*/
	function getUserRecipes($userid){
	   $list = @mysql_query("SELECT * FROM UserRecipes WHERE UserID = '$userid' ");
	   while($row = @mysql_fetch_assoc($list)) 
	   {   
		   $recipeid = $row['RecipeID'];
		   $recipename = mysql_fetch_assoc(@mysql_query("SELECT RecipeName FROM Recipes WHERE '$recipeid' = RecipeID"));
		   print  $recipename['RecipeName'] . '<br>' ;	
	   }
	}



	/* addRecipeToGrocery
	
	Takes as input a recipe name and UserID and adds all the
	recipe's ingredients to the User's GroceryList.
	*/
	function addRecipeToGrocery($recipe, $userid){
	     $recipeid = $this->getRecipeID($recipe);
		 {
		     $list = @mysql_query("SELECT * FROM Ingredients WHERE Recipe = '$recipeid'");
		     while($row = @mysql_fetch_assoc($list)) 
		     {  
			    $this->addToGrocery($userid,$row['IngredientName'],$row['Quantity'], $row['Units']);
		     }	
		}
	}
}
?>