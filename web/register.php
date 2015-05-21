<?php
	include realpath(dirname(__FILE__) . "/" . "../API/func.php");
	$api = new databaseAPI;

	if (isset($_POST['submit'])) { 
		$name = $_POST['username'];
		$pw1 = $_POST['password1'];
		$pw2 = $_POST['password2'];

		// checks if the username is in use
	 	if ($api->checkIfValidUser($name, $pw1)) {
			die(header("location:index.php?registerFailed=true"));
	 	} else {
	 		$api->addUser($name, $pw1);
	 		session_start();
			$_SESSION["uid"] = $api->getUserID($name);
			header("Location: lists.php");
	 	}
	}
?>