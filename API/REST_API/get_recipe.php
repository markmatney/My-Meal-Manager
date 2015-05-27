<?php
	include realpath(dirname(__FILE__) . "/" . "func.php");
	$api = new databaseAPI;

	$recipe_name = $_GET["recipe_name"];

	echo $api->getRecipe($recipe_name);

?>
