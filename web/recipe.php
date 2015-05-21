<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();
    $uid = $_SESSION["uid"];
    $recipe_name = $_POST['recipe_name'];
    //$recipe_list = json_decode($api->getRecipe($recipe_name));
    //$img = $recipe_list[2];
    //$time = $recipe_list[3];
    //$ingr = $recipe_list[4];
    //$instr = $recipe_list[5];

    echo '<span id="recipe_template">';
    echo '<h2>{$recipe_name}</h2>';
    echo '<div id="image">';
    echo '<div class="container-fluid">';
    //echo '<img src="{$img}" class="img-responsive"/>';
    echo '</div></div>';

    echo '<div id="ingredients">';
    echo '<div class="row">';
    echo '<h3>Ingredients</h3>';
    /*foreach ($ingr as $item) {
        echo "<div class='col-md-6'>";
        echo "<label class='item-name'>{$item[2]}</label>";
        echo "<label class='item-quantity'>{$item[0]}</label>";
        echo "<label class='item-units'>{$item[1]}</label>";
        echo "</div>";
    }*/
    echo '</div></div>';

    echo '<div id="instr">';
    echo '<ol>';
    //echo $instr;
    echo '</ol></div>';

    echo '<button class="btn btn-default" onclick="close_popup();">Close</button>';
    echo '</span>';
?>
