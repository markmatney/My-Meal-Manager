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
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid">
                <?php include 'navbar.php'; 
                    $navbar = array(
                        'add' => array('text'=>'Add Missing', 'url'=>'#'),
                        'remove' => array('text'=>'Bookmark', 'url'=>'#')
                    );
                    generateNavBar($navbar, 'Recipes');
                ?>
            </div>
        </nav>
        <!-- end Navbar -->

        <!-- Page Content -->
        <div class="container-fluid">
            <h2>Dish</h2>
            <div id="image">
                <div class="container-fluid">
                <img src="/~jmpham/img/sample.jpg" class="img-responsive"/>
                </div>
            </div>
            <div id="ingredients">
                <div class="row">
                <h3>Ingredients</h3>
                    <?php 
                        $grocery_list = array(
                            'carrots' => array('text'=>'Carrots', 'url'=>'lists.php'),
                            'milk' => array('text'=>'Milk', 'url'=>'recipes.php'),
                            'kale' => array('text'=>'Kale', 'url'=>'#'),
                            'a' => array('text'=>'Milk', 'url'=>'recipes.php'),
                            'b' => array('text'=>'Milk', 'url'=>'recipes.php'),
                            'c' => array('text'=>'Milk', 'url'=>'recipes.php'),
                            'd' => array('text'=>'Milk', 'url'=>'recipes.php'),
                            'e' => array('text'=>'Milk', 'url'=>'recipes.php'),
                            'f' => array('text'=>'Milk', 'url'=>'recipes.php')
                        );
                        foreach ($grocery_list as $item) {
                            echo "<div class='col-md-6'>";
                            echo "<input type='checkbox' name='ingredient' value='{$item['text']}'><label>{$item['text']}</label>";
                            echo "</div>";
                        }
                    ?>
                </div>
            </div>
            <div id="directions">
                <ol>
                    <li>Heat oven to 350 degrees F.</li>
                    <li>Cook and stir bacon in large skillet on medium heat 10 min. or until crisp. Remove bacon from skillet with slotted spoon; drain on paper towels. Discard all but 2 Tbsp. drippings from skillet.</li>
                    <li>Add potatoes, mushrooms, peppers and onions to reserved drippings in skillet; cook 10 min. or until peppers and onions are crisp-tender, stirring occasionally. Stir in VELVEETA. Spoon into 13x9-inch baking dish sprayed with cooking spray.</li>
                    <li>Whisk eggs and sour cream in medium bowl until blended; stir in bacon. Pour over vegetable mixture.</li>    
                    <li>Bake 40 min. or until center is set and casserole is heated through.</li>
                </ol>
            </div>
        </div>
        <!-- end PageContent -->
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
