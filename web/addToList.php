<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();
    $uid = $_SESSION["uid"];

    if (isset($_POST['submit1'])) {
        $ingredient = $_POST['ingredient-name'];
        $quantity = $_POST['quantity'];
        $units = $_POST['units'];
        $api->addToGrocery($uid, $ingredient, $quantity, $units);
    } else if (isset($_POST['submit2'])) {
        $ingredient = $_POST['ingredient-name'];
        $quantity = $_POST['quantity'];
        $units = $_POST['units'];
        $api->addToInventory($uid, $ingredient, $quantity, $units);
    }
    header("Location: lists.php");
?>