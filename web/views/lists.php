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
                            'carrots' => array('text'=>'Carrots', 'quantity'=>'1', 'units'=>'sticks'),
                            'milk' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'kale' => array('text'=>'Kale', 'quantity'=>'3', 'units'=>'bunches'),
                            'a' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'b' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'c' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'd' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'e' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'f' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'g' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'h' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'i' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'j' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'k' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'l' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'm' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'n' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'o' => array('text'=>'Milk', 'quantity'=>'2', 'units'=>'gallons'),
                            'p' => array('text'=>'Tea', 'quantity'=>'2', 'units'=>'boxes')
                        );
                        foreach ($grocery_list as $item) {
                            echo "<li class='ui-state-default item edit-item'>";
                            echo "<label class='item-name'>{$item['text']}</label>";
                            echo "<label class='item-quantity'>{$item['quantity']}</label>";
                            echo "<label class='item-units'>{$item['units']}</label>";
                            echo "</li>";
                        }
                    ?>
                </ul>
                 <form class="add">
                    <input class="col-xs-4 add-item" type="text" name="ingredient-name" placeholder="Ingredient Name">
                    <input class="col-xs-3 add-item" type="text" name="quantity" placeholder="Quantity">
                    <input class="col-xs-2 add-item" type="text" name="units" placeholder="Units">
                    <button type="submit" class="btn btn-primary no-outline"><span class="glyphicon glyphicon-ok"></span></button>
                </form>
            </div>
            <div id="inventory">
                <h2>Inventory</h2><hr>
                <ul class="sortable">
                    <?php 
                        $inventory_list = array(
                            'onions' => array('text'=>'Onions', 'quantity'=>'1', 'units'=>'units'),
                            'garlic' => array('text'=>'Garlic', 'quantity'=>'2', 'units'=>'cloves ')
                        );
                        foreach ($inventory_list as $item) {
                            echo "<li class='ui-state-default item edit-item'>";
                            echo "<label class='item-name'>{$item['text']}</label>";
                            echo "<label class='item-quantity'>{$item['quantity']}</label>";
                            echo "<label class='item-units'>{$item['units']}</label>";
                            echo "</li>";
                        }
                    ?>
                </ul>
                <form class="add">
                    <input class="col-xs-4 add-item" type="text" name="ingredient-name" placeholder="Ingredient Name">
                    <input class="col-xs-3 add-item" type="text" name="quantity" placeholder="Quantity">
                    <input class="col-xs-2 add-item" type="text" name="units" placeholder="Units">
                    <button type="submit" class="btn btn-primary no-outline"><span class="glyphicon glyphicon-ok"></span></button>
                </form>
            </div>
            <div id="item-edit-popup">
                <form>
                    <div class="form-group">
                        <label for="ingredient-name">Ingredient Name</label>
                        <input type="text" class="form-control" id="ingredient-name" placeholder="Enter Ingredient Name">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="text" class="form-control" id="quantity" placeholder="Enter Quantity">
                    </div>
                    <div class="form-group">
                        <label for="units">Units</label>
                        <input type="text" class="form-control" id="units" placeholder="Enter Units">
                    </div>
                    <button type="submit" class="btn btn-primary no-outline"><span class="glyphicon glyphicon-ok"></span></button>
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

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    $(document).ready(function () {
      $('div#lists').find('ul.sortable').sortable({
        connectWith: 'ul.sortable',
        placeholder: 'sortable-placeholder',
        opacity: 0.7
        });
    });

    document.addEventListener("keypress", escape, false);
    function escape(e) {
        var keyCode = e.keyCode;
        if (keyCode == 27) {
            var popup = document.getElementById('item-edit-popup');
            popup.style.display = "none";
        }
    }
    function popup() {
        var popup = document.getElementById('item-edit-popup');
        popup.style.display = "block";
    }

    $(".edit-item").hover(
      function() {
        $( this ).append( $( "<div id='edit' class='btn-group'><button type='button' class='edit-btn dropdown-toggle' data-toggle='dropdown'><span class='glyphicon glyphicon-pencil edit'></span></button><ul class='dropdown-menu pull-right'><li><a href='#' onclick='popup();'>Edit Item</a></li><li><a href='#'>Delete Item</a></li></ul></div>" ) );
      }, function() {
        $( this ).find( "#edit" ).remove();
      }
    );

    $(".edit-item").click(function(e) {
        
    });

    </script>



</body>

</html>
