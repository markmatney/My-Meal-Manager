<?php
	include realpath(dirname(__FILE__) . "/" . "func.php");
	$api = new databaseAPI;

	$id = $_POST["id"];

	$ingredients = $_POST["ingredients"];
	$api->searchRecipes($id, $ingredients);

?>
