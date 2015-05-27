<?php
	include realpath(dirname(__FILE__) . "/" . "func.php");
	$api = new databaseAPI;

	$id = $_POST["id"];
	$ingredient_name = $_POST["name"];
	$quantity = $_POST["quantity"];
	$units = $_POST["units"];
	$api->addToInventory($id, $ingredient_name, $quantity, $units);
	echo json_encode(array('code' => 1))

?>
