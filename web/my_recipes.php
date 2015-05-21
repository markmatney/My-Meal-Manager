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
                    while (($i <= $max) && ($i <= 9)) {
                        $recipe = json_decode($api->getRecipe($recipe_list[$i]));
                        echo '<div class="col-md-4 recipe-item">';
                        echo '<button class="popup_open" onclick="open_popup(this);">';
                        echo '<div class="image">';
                        echo '<div class="container-fluid">';
                        echo '<img src="'.$recipe_list[2].'" class="img-responsive"/>';
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
            <button class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>
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
        });
        function open_popup(element) {
            var recipe_name = element.getElementsByTagName("h2")[0].innerHTML;

            $.ajax({
              method: "POST",
              url: "recipe.php",
              dataType: "html",
              data: { recipe_name: recipe_name },
              success: function (html) {
                $('#recipe_popup').append(html);
                $('#recipe_popup').popup('show');
              }
            });
        }
        function close_popup() {
            $("#recipe_template").remove();
            $('#recipe_popup').popup('hide');
        }
    </script>
</body>

</html>
