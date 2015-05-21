<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();
    $uid = $_SESSION["uid"];
    //header("Location: lists.php");

    if (isset($_POST['submit-edit'])) {
        $ingredient = $_POST['ingredient-name'];
        $quantity = $_POST['quantity'];
        $units = $_POST['units'];
        $list = $_POST['list'];
        $old = $_POST['old-ingredient'];
        if ($list == 'inventory-item'){
            echo $uid.','.$old.','. $ingredient.','. $quantity.', '.$units.',' .$list;
            $api->updateInventory($uid, $old, $ingredient, $quantity, $units);
        }
        else if ($list == 'grocery-item'){
            echo $uid.','.$old.','. $ingredient.','. $quantity.', '.$units.',' .$list;
            $api->updateGrocery($uid, $old, $ingredient, $quantity, $units);
        }
    }
?>