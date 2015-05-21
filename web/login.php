<?php
	include realpath(dirname(__FILE__) . "/" . "../API/func.php");
	$api = new databaseAPI;

	if (isset($_POST['submit'])) { 
		$name = $_POST['username'];
		$pw = $_POST['password'];

		// checks if the username is in use
	 	if ($api->checkIfValidUser($name, $pw)) {
	 		session_start();
			$_SESSION["uid"] = $api->getUserID($name);
			header("Location: lists.php");
	 	} else {
			die(header("location:index.php?loginFailed=true"));
	 	}
	}
?>