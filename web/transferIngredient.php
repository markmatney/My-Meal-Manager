<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();

    $uid = $_SESSION["uid"];
    $name = $_POST["name"];
    $quantity = $_POST["qty"];
    $units = $_POST["units"];
    
    if ($_POST["list"] == 'inventory-list') {
        $api->removeFromInventory($uid, $name, $quantity, $units);
        $api->addToGrocery($uid, $name, $quantity, $units);
    } else {
        $api->removeFromGrocery($uid, $name, $quantity, $units);
        $api->addToInventory($uid, $name, $quantity, $units);
    }

?>