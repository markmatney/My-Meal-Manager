<?php
    include realpath(dirname(__FILE__) . "/" . "../API/func.php");
    $api = new databaseAPI;
    session_start();
    $uid = $_SESSION["uid"];
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Meal Manager</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/menu.css" rel="stylesheet">
    <link href="css/recipes.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <?php include 'sidebar.php'; ?>
        </div>
        <!-- end Sidebar -->
        <!-- Navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">';
                    <a href='#' class='navbar-brand'>My Recipes</a>
                </div>
            </div>
        </nav>
        <!-- end Navbar -->

        <!-- Page Content -->
        <div id="bookmarked" class="container-fluid">
            <?php
                $recipe_list = json_decode($api->getUserRecipes($uid));
                $max = sizeof($recipe_list);
                if ($max != 0) {
                    $i = 0;
                    while (($i < $max) && ($i <= 9)) {
                        $recipe = json_decode($api->getRecipe($recipe_list[$i]));
                        echo '<div class="col-md-4 recipe-item">';
                        echo '<button class="popup_open" onclick="open_popup(this);">';
                        echo '<div class="image">';
                        echo '<div class="container-fluid">';
                        echo '<img src="'.$recipe[2].'" class="img-responsive"/>';
                        echo '</div></div>';
                        echo '<div class="description">';
                        echo '<h2>'.$recipe[0].'</h2>';
                        echo '</div></button></div>';
                        $i++;
                    }
                } else {
                    echo '<div class="alert alert-danger" role="alert">';
                    echo "There are no recipes bookmarked. Please add a recipe or explore some recipes.";
                    echo '</div>';
                }
            ?>
        </div>
            <div id="recipe_popup">
            </div>
        <div id="add_content">
            <button class="btn btn-default" id="add_button"><span class="glyphicon glyphicon-plus"></span></button>
            <div id="add_recipe_popup">
                <form action="addRecipe.php" method="POST">
                    <div class="form-group">
                        <label for="name">Recipe Name</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Enter Recipe Name">
                    </div>
                    <div class="form-group">
                        <label for="img">Image</label>
                        <input type="text" class="form-control" name="img" id="img" placeholder="Enter Image URL">
                    </div>
                    <div class="form-group">
                        <label for="time">Time</label>
                        <input type="text" class="form-control" name="time" id="time" placeholder="hh:MM:ss">
                    </div>
                    <div class="form-group">
                        <label for="ingredient">Ingredients</label></br>
                        <div id="add-ingredient">
                            <input class="col-xs-4" type="text" name="ingredient-name[]" placeholder="Ingredient Name">
                            <input class="col-xs-3" type="text" name="quantity[]" placeholder="Quantity">
                            <input class="col-xs-2" type="text" name="units[]" placeholder="Units">
                        </div>
                        <button type="button" onclick="addIngredient();" class="btn btn-primary no-outline" id="add_ingredient"><span class="glyphicon glyphicon-plus"></span></button></br>
                    </div>
                    <div class="form-group" style="clear:both;">
                        <label for="instructions">Instructions</label>
                        <textarea class="form-control" rows="5" name="instructions" id="instructions" placeholder="Enter Instructions"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary no-outline" name="submit-edit"><span class="glyphicon glyphicon-ok"></span></button>
                </form>
            </div>
        </div>
        <!-- end PageContent -->
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui-1.11.4/jquery-ui.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Include jQuery Popup JS -->
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/jquery.popupoverlay.js"></script>

    <!-- Menu Toggle Script -->
    <script>
        $(document).ready(function() {
            // Initialize the plugin
            $('#my_popup').popup();
            $('#add_recipe_popup').popup();
        });
        function open_popup(element) {
            var recipe_name = element.getElementsByTagName("h2")[0].innerHTML;

            $.ajax({
              method: "GET",
              url: "recipe.php",
              dataType: "html",
              data: { recipe_name: recipe_name, root_page: 'my_recipes' },
              success: function (html) {
                $('#recipe_popup').empty();
                $('#recipe_popup').append(html);
                $('#recipe_popup').popup('show');
              }
            });
        }
        function close_popup() {
            $("#recipe_template").remove();
            $('#recipe_popup').popup('hide');
        }
        $("#add_button").click(function () {
            $('#add_recipe_popup').popup('show');
        });
        function addIngredient() {
            var name = document.createElement('input');
            name.className = "col-xs-4";
            name.type = "text";
            name.name = "ingredient-name[]";
            name.placeholder = "Ingredient Name";

            var quantity = document.createElement('input');
            quantity.className = "col-xs-3";
            quantity.type = "text";
            quantity.name = "quantity[]";
            quantity.placeholder = "Quantity";

            var units = document.createElement('input');
            units.className = "col-xs-2";
            units.type = "text";
            units.name = "units[]";
            units.placeholder = "Units";

            var parent = document.getElementById('add-ingredient');
            parent.appendChild(name);
            parent.appendChild(quantity);
            parent.appendChild(units);
        };
    </script>
</body>

</html>
