<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();

    $uid = $_SESSION["uid"];
    $name = $_GET["name"];
    $quantity = $_GET["qty"];
    $units = $_GET["units"];
    
    if ($_GET["list"] == 'inventory') {
        $api->removeFromInventory($uid, $name, $quantity, $units);
    } else {
        $api->removeFromGrocery($uid, $name, $quantity, $units);
    }
    header("Location: lists.php");
?>