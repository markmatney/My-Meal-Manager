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
    <link href="css/lists.css" rel="stylesheet">

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
                        'add' => array('text'=>'Add Ingredient', 'url'=>'#'),
                        'remove' => array('text'=>'Remove All', 'url'=>'#')
                    );
                    generateNavBar($navbar, 'My Lists');
                ?>
            </div>
        </nav>
        <!-- end Navbar -->

        <!-- Page Content -->
        <div id="lists" class="container-fluid">
            <div id="grocery-list">
                <h2>Grocery List</h2><hr>
                <ul class="sortable">
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
                            echo "<li class='ui-state-default item'>";
                            echo "<input type='checkbox' name='ingredient' value='{$item['text']}'><label>{$item['text']}</label>";
                            echo "</li>";
                        }
                    ?>
                </ul>
            </div>
            <div id="inventory">
                <h2>Inventory</h2><hr>
                <ul class="sortable">
                    <?php 
                        $inventory_list = array(
                            'onions' => array('text'=>'Onions', 'url'=>'lists.php'),
                            'garlic' => array('text'=>'Garlic', 'url'=>'recipes.php')
                        );
                        foreach ($inventory_list as $item) {
                            echo "<li class='ui-state-default item'>";
                            echo "<input type='checkbox' name='ingredient' value='{$item['text']}'><label>{$item['text']}</label>";
                            echo "</li>";
                        }
                    ?>
                </ul>
            </div>
            </div>
        </div>
        <!-- end PageContent -->

    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui-1.11.4/jquery-ui.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    $(document).ready(function () {
      $('div#lists').find('ul.sortable').sortable({
        connectWith: 'ul.sortable',
        placeholder: 'sortable-placeholder'
            });
    });
    </script>



</body>

</html>
