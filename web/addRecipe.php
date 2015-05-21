<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();

	if (isset($_POST['submit-edit'])) { 
	    $uid = $_SESSION["uid"];
	    $name = $_POST["name"];
	    $url = 'user-added';
	    $img = $_POST["img"];
	    $time = $_POST["time"];
	    $instructions = $_POST["instructions"];
	    $ingredients = $_POST["ingredient-name"];
	    $quantity = $_POST["quantity"];
	    $units = $_POST["units"];

		$api->addRecipe($name,$url,$img,$time,$instructions);

		for ($i=0; $i < sizeof($ingredients); $i++) {
			$api->addIngredientToRecipe($name, $ingredients[$i], $quantity[$i], $units[$i]);
		}

		$api->addRecipeToUser($name, $uid);
	}
	header("Location: my_recipes.php");
?>