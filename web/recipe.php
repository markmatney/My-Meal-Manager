<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();
    $uid = $_SESSION["uid"];
    $recipe_name = $_GET['recipe_name'];
    $root_page = $_GET['root_page'];
    $recipe_list = json_decode($api->getRecipe($recipe_name));
    $img = $recipe_list[2];
    $time = $recipe_list[3];
    $ingr = $recipe_list[4];
    $instr = $recipe_list[5];

    $inventory_list = json_decode($api->getInventory($uid));

    echo '<span id="recipe_template">';
    echo '<h2>'.$recipe_name.'</h2>';
    echo '<div id="image">';
    echo '<div class="container-fluid">';
    echo '<img src="'.$img.'" class="img-responsive"/>';
    echo '</div></div>';

    echo '<form action="useRecipe.php" method="POST">';
    echo '<input type="hidden" name="recipe_name" value="'.$recipe_name.'">';
    echo '<div id="ingredients">';
    echo '<div class="row">';
    echo '<h3>Ingredients</h3>';

    $count = 0;
    foreach ($ingr as $item) {
        echo '<div class="form-group ingredient-item">';
        echo '<label class="sr-only" for="ingredient-name">{$item[2]}</label>';

        // check off ingredients that are already in inventory
        if ($api->checkInventory($uid, $item[2])) {
            echo '<input type="checkbox" name="select-ingredient[]" onchange="select_ingredient(this);" data-group="group_'.$count.'"  value="'.$count.'" checked/>';
            echo '<input class="col-md-6 group_'.$count.'" type="text" name="ingredient-name[]" value="'.$item[2].'" />';
            echo '<input class="col-md-2 group_'.$count.'" type="text" name="quantity[]" value="'.$item[0].'" />';
            echo '<input class="col-md-3 group_'.$count.'" type="text" name="units[]" value="'.$item[1].'" />';
            if (!$api->checkQuantity($uid, $api->getRecipeID($recipe_name), $item[2])) {
                echo '<div class="alert alert-danger col-md-11" role="alert">';
                echo 'Not enough '.$item[2].'.';
                echo '</div>';
            }
        }
        else {
            echo '<input type="checkbox" name="select-ingredient[]" onchange="select_ingredient(this);" data-group="group_'.$count.'" value="'.$count.'"/>';
            echo '<input class="col-md-6 group_'.$count.'" type="text" name="ingredient-name[]" value="'.$item[2].'" disabled/>';
            echo '<input class="col-md-2 group_'.$count.'" type="text" name="quantity[]" value="'.$item[0].'" disabled/>';
            echo '<input class="col-md-3 group_'.$count.'" type="text" name="units[]" value="'.$item[1].'" disabled/>';  
        }
        echo '</div>';
        $count++;
    }
    echo '<span id="add-ingredient" data-count='.$count.'>';
    echo '</span>';
    echo '<button type="button" onclick="addIngredient();" class="btn btn-primary no-outline" id="add_ingredient"><span class="glyphicon glyphicon-plus"></span></button></br>';
    echo '</div></div>';

    echo '<div id="instr" style="clear:both;">';
    echo '<ol>';
    echo '<p>Cooking Time: '.$time.'</p>';
    echo $instr;
    echo '</ol></div>';

    echo '<button type="submit" name="submit-cook" class="btn btn-success submit-btn">Cook</button>';
    echo '<button type="submit" name="submit-add-to-grocery" class="btn btn-danger submit-btn">Buy Missing</button>';
    echo '</form>';

    if ($root_page == "explore") {
        echo '<form action="bookmarkRecipe.php" method="POST">';
        echo '<input type="hidden" name="name" value="'.$recipe_name.'">';
        echo '<button type="submit" id="bookmark_recipe" name="submit" class="btn btn-primary submit-btn">Bookmark</button>';
        echo '</form>';   
    }
    echo '<button id="close_popup" class="btn btn-default" onclick="close_popup();"><span class="glyphicon glyphicon-remove"></span></button>';
    echo '</span>';
?>
