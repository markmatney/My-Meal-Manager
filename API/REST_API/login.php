<?php
	include realpath(dirname(__FILE__) . "/" . "func.php");
	$api = new databaseAPI;

	$name = $_POST['username'];
	$pw = $_POST['password'];

	// checks if the username is in use
 	if ($api->checkIfValidUser($name, $pw)) {
 		echo json_encode(array("code" => 0, "id" => $api->getUserID($name)));
 	} else {
 		echo json_encode(array("code" => 1));
 	}
?>