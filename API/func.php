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
	      $user = "cs130";
		  $pw = "test";
		  $db = "CS130";
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
	Returns the UserID if username exists otherwise
	outputs error message.
	*/
	function getUserID($name){
	     $id =  mysql_fetch_assoc(@mysql_query("SELECT UserID FROM UserUNandID WHERE '$name' = UserName"));
	     $userid = $id['UserID'];
		  if($userid == 0)
		    { print "User doesn't exist!";
			 exit(1);}
		  else
	         return $userid;
	}
	
	
	/* addUser
	
	Takes username,password and adds to user list
	Outputs error if username already exists
	*/
	function addUser($name,$pw){
	    if(($name != NULL) && ($pw != NULL)){
              $count = @mysql_query("SELECT COUNT(*) as count FROM UserUNandID  WHERE ('$name' = UserName)");
		  $countdata = mysql_fetch_assoc($count);
		  if($countdata['count'] >= 1){
		         print "User already exsists!";
               exit(1);
				}
          else
		  {   
              @mysql_query("INSERT INTO UserUNandID VALUES	(0,'$name','$pw')");
          }			  
		}		
	}
	
	/* checkIfValudUser
	
	Takes in username,password and returns true if correct match,
	false otherwise.
	*/
	function checkIfValidUser($name,$pw){
	    if(($name != NULL) && ($pw != NULL)){
              $count = @mysql_query("SELECT COUNT(*) as count FROM UserUNandID  WHERE ('$name' = UserName)");
		  $countdata = mysql_fetch_assoc($count);
		  if($countdata['count'] <= 0){
		         return false;
		  }
          else
		  {   
              $userinfo = @mysql_query("SELECT * FROM UserUNandID  WHERE ('$name' = UserName)");
			  $userdata = mysql_fetch_assoc($userinfo);
			  $pwinfo = $userdata['Password'];
			  if($pw == $pwinfo)
			     return true;
			  else return false;
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

	Takes as input a UserId and returns a JSON array in the format:
	
	[["<Quantity1>", "<Units1>", "<IngredientName1>"],
	["<Quantity2>", "<Units2>", "<IngredientName2>"],
	....]
	*/
	function getInventory($userid){
		$invenlist = @mysql_query("SELECT * FROM Inventory WHERE UserID = '$userid' ");
		$array = array();
		$i = 0;
		while($row = @mysql_fetch_assoc($invenlist)) 
		{
		   $name=$row['IngredientName'];
		   $qty = $row['Quantity'];
		   $unit = $row['Units'];
		     $array2 = array($qty,$unit,$name);
			$array[$i] = $array2;
			$i = $i+1;
			
				
		}
	return json_encode($array);
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

	Takes as input a UserId and returns a JSON array in the format:
	[["<Quantity1>", "<Units1>", "<IngredientName1>"],
	 ["<Quantity2>", "<Units2>", "<IngredientName2>"],
	....]
	*/
	function getGrocery($userid){
		$list = @mysql_query("SELECT * FROM GroceryList WHERE UserID = '$userid' ");
		$array = array();
		$i = 0;
		while($row = @mysql_fetch_assoc($list)) 
		{
			 $name=$row['IngredientName'];
		   $qty = $row['Quantity'];
		   $unit = $row['Units'];
		     $array2 = array($qty,$unit,$name);
			$array[$i] = $array2;
			$i = $i+1;
			
		}
			return json_encode($array);
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
	function addRecipe($name,$url,$time,$instructions){
	   @mysql_query("INSERT INTO Recipes VALUES (0,'$name','$url',NULL, '$time', '$instructions')");
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
	
	Takes as input a Recipe name and outputs a JSON array of the
	Recipe's ingredients in the format:
	[["<Quantity1>", "<Units1>", "<IngredientName1>"],
	 ["<Quantity2>", "<Units2>", "<IngredientName2>"],
	....]
	*/
	function getRecipeIngredients($recipe){
	   $recipeid = $this->getRecipeID($recipe);
	    $array = array();
		$i = 0;
	       $list = @mysql_query("SELECT * FROM Ingredients WHERE Recipe = '$recipeid'");
		   while($row = @mysql_fetch_assoc($list)) 
		   {   
		   $name=$row['IngredientName'];
		   $qty = $row['Quantity'];
		   $unit = $row['Units'];
		     $array2 = array($qty,$unit,$name);
			$array[$i] = $array2;
			$i = $i+1;
			
		   }	
		return $array;
	}

	/* getRecipe

	Takes as input a Recipe name and outputs a JSON array of
	the Recipe in the format:
	["<RecipeName>" ,"<URL>" ,"<Image>","<TotalCookingTime>",
	[["<Quantity1>", "<Units1>", "<IngredientName1>"],
	 ["<Quantity2>", "<Units2>", "<IngredientName2>"],
	....], 
	"<Instructions>"]
	*/
	function getRecipe($recipe){
	        $recipeid = $this->getRecipeID($recipe);
		     $list = mysql_fetch_assoc(@mysql_query("SELECT * FROM Recipes WHERE RecipeID = '$recipeid'"));
			 
			 $name =$list['RecipeName'];
			 $url= $list['URL'] ;
		     $img = $list['Image'];
		     $time = $list['TotalCookingTime']  ;
			//$ingredients = "";
		     $ingredients = $this->getRecipeIngredients($recipe);
		     $instructions = $list['Instructions'];
			 $array = array($name,$url,$img,$time,$ingredients,$instructions);
			 return json_encode($array);
	    
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
	associated RecipeList in the  JSON array format:
	["<RecipeName1>","<RecipeName2>",...]
	*/
	function getUserRecipes($userid){
	   $list = @mysql_query("SELECT * FROM UserRecipes WHERE UserID = '$userid' ");
	  $array = array();
		$i = 0;
	  while($row = @mysql_fetch_assoc($list)) 
	   {   
		   $recipeid = $row['RecipeID'];
		   $recipename = mysql_fetch_assoc(@mysql_query("SELECT RecipeName FROM Recipes WHERE '$recipeid' = RecipeID"));
		   $name =  $recipename['RecipeName'] ;	
		   $array[$i] = $name ;
		   	$i = $i+1;
	   }
	   return json_encode($array);
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
	/*searchRecipes 

	Returns all recipe names that use all input ingredients, 
	sorted by number of ingreds the recipe requires that aren't in 
	the given user's inventory or grocery list

	Input format: (int userid, String[] ingredients) 
	Ouput format: 
	<RecipeName1><br>
	<RecipeName2><br> ...

	*/
	function searchRecipes($input){
		$execstring = 'java -cp .:mysql-connector-java-5.1.35-bin.jar MyMealManager.searchMain '; 
       		 foreach ($input as $i){
			$execstring .= $i;
			$execstring .= ' ';
		}
		$output = shell_exec($execstring);
		echo $output;
	}
}
?>