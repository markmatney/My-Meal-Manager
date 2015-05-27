<?php
	include realpath(dirname(__FILE__) . "/" . "func.php");
	$api = new databaseAPI;

	$name = $_POST["username"];
	$pw1 = $_POST["password"];
	// checks if the username is in use
 	if ($api->checkIfUserExists($name)) {
		echo json_encode(array("code" => 1));
 	} else {
 		@$api->addUser($name, $pw1);
 		echo json_encode(array("code" => 0, "id" => $api->getUserID($name)));
 	}
?>
