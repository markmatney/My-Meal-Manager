<?php
	include realpath(dirname(__FILE__) . "/" . "../API/func.php");
	$api = new databaseAPI;

	if (isset($_POST['submit'])) { 
		$name = $_POST['username'];
		$pw1 = $_POST['password1'];
		$pw2 = $_POST['password2'];
		if (!$name | !$pw1 | !$pw2 ) {
 		die('You did not complete all of the required fields');
 		}

 		if ($pw1 != $pw2) {
			die('Your passwords did not match. ');
 		}

		// checks if the username is in use
	 	if ($api->checkIfValidUser($name, $pw1)) {
	 		die('Username already in use');
			header("Location: index.php");
	 	} else {
	 		$api->addUser($name, $pw1);
	 		session_start();
			$_SESSION["uid"] = $api->getUserID($name);
			header("Location: lists.php");
	 	}
	}
?>