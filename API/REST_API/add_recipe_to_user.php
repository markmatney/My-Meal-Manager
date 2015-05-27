<?php
	include realpath(dirname(__FILE__) . "/" . "func.php");
	$api = new databaseAPI;

	$id = $_POST["id"];
	$recipe = $_POST["recipe"];

	$api->addRecipeToUser($recipe, $id);
	echo json_encode(array('code'=>0));
?>
