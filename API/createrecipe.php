<html>
<body>


<?php
require($DOCUMENT_ROOT . "./index.html");
include 'func.php';
?>

<?php
   $api = new databaseAPI;
   /*$name = $_GET["name"];
   $url = $_GET["url"];
   $time = $_GET["time"];
   $instruction = $_GET["instruction"];*/
   $name = 11;
   $url = "url1";
   $time = "1";
   $instruction = "instruction1";
   $id = $name;
   $api->addRecipe($id,$name,$url,$time,$instruction);
   $api->addIngredientToRecipe($name, 1, 1, 1);
   $api->addIngredientToRecipe($name, 2, 1, 1);
   /*$api->addIngredientToRecipe($name,5, 1, 1);*/
    $api->getRecipe($name); //should be recipe1, url1,  , 1, 111, 112, instruction1
   $api->addrecipeToUser($name,$name);
     $api->addrecipeToUser(8,$name);
   $api->getUserRecipes($name); //should be $name,8
   $api->addRecipeToGrocery($name,1); // 111, 112 added to grocery list*/
   /*
    
   */
   ?>

<hr/>
        Recipe Maker</br>
<hr/>
<form action="./createrecipe.php" method="GET"> 
Recipe Name:
	<input type="text" name="name" maxlength="100" width="100">
	</br>URL:
	<input type="text" name="url" maxlength="100" width="100">
	</br>Cooking Time:
	<input type="text" name="time" maxlength="25" width="100">

	</br>Instructions:</br>

	<textarea rows="8" cols="50" name="instruction">
    </textarea>
	</br>
	<input type="submit" value="Make Recipe!"/>
</body>
</html> 