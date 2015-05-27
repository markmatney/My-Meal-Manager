<?php
	include realpath(dirname(__FILE__) . "/" . "func.php");
	$api = new databaseAPI;

	$id = $_GET["id"];
	echo $api->getUserRecipes($id);

?>
