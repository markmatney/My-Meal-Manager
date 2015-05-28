<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();
    $uid = $_SESSION["uid"];

    header('Location: my_recipes.php');

    if (isset($_POST['submit-cook'])) {
        $ingredients = $_POST["ingredient-name"];
        $quantity = $_POST["quantity"];
        $units = $_POST["units"];

        foreach ($_POST['select-ingredient'] as $selected) {
            $i = $selected;
            $api->removeFromInventory($uid, $ingredients[$i], $quantity[$i], $units[$i]);
        }
    } else if (isset($_POST['submit-add-to-grocery'])) {
        $recipe_name = $_POST['recipe_name'];
        $api->addRecipeToGrocery($recipe_name, $uid);
    }

?>
