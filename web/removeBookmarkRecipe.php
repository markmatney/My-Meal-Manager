<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();

	if (isset($_POST['submit'])) { 
	    $uid = $_SESSION["uid"];
	    $name = $_POST["name"];

		$api->removeRecipeFromUser($name, $uid);
	}
	header("Location: my_recipes.php");
?>