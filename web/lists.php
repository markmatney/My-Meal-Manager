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
            <div id="grocery">
                <h2>Grocery List</h2><hr>
                <ul class="sortable" id="grocery-list">
                    <?php 
                        $grocery_list = json_decode($api->getGrocery($uid));
                        foreach ($grocery_list as $item) {
                            echo "<li class='ui-state-default item edit-item'>";
                            echo "<label class='item-name'>{$item[2]}</label>";
                            echo "<label class='item-quantity'>{$item[0]}</label>";
                            echo "<label class='item-units'>{$item[1]}</label>";

                            echo "<div style='visibility:hidden;' class='btn-group edit'>";
                            echo "<button type='button' class='edit-btn dropdown-toggle' data-toggle='dropdown'>";
                            echo "<span class='glyphicon glyphicon-pencil edit'></span></button>";
                            echo "<ul class='dropdown-menu pull-right'>";
                            echo "<li><a href='#' onclick='popup();'>Edit Item</a></li>";
                            echo "<li><a href='removeIngredient.php?list=grocery&name=$item[2]&qty=$item[0]&units=$item[1]'>Delete Item</a></li>";
                            echo "</ul></div>";

                            echo "</li>";
                        }
                    ?>
                </ul>
                 <form class="add" action="addToList.php" method="post">
                    <input class="col-xs-4 add-item" type="text" name="ingredient-name" placeholder="Ingredient Name">
                    <input class="col-xs-3 add-item" type="text" name="quantity" placeholder="Quantity">
                    <input class="col-xs-2 add-item" type="text" name="units" placeholder="Units">
                    <button type="submit" name="submit1" class="btn btn-primary no-outline"><span class="glyphicon glyphicon-ok"></span></button>
                </form>
            </div>
            <div id="inventory">
                <h2>Inventory</h2><hr>
                <ul class="sortable" id="inventory-list">
                    <?php 
                        $inventory_list = json_decode($api->getInventory($uid));
                        foreach ($inventory_list as $item) {
                            echo "<li class='ui-state-default item edit-item'>";
                            echo "<label class='item-name'>{$item[2]}</label>";
                            echo "<label class='item-quantity'>{$item[0]}</label>";
                            echo "<label class='item-units'>{$item[1]}</label>";

                            echo "<div style='visibility:hidden;' class='btn-group edit'>";
                            echo "<button type='button' class='edit-btn dropdown-toggle' data-toggle='dropdown'>";
                            echo "<span class='glyphicon glyphicon-pencil edit'></span></button>";
                            echo "<ul class='dropdown-menu pull-right'>";
                            echo "<li><a href='#' onclick='popup();'>Edit Item</a></li>";
                            echo "<li><a href='removeIngredient.php?list=inventory&name=$item[2]&qty=$item[0]&units=$item[1]'>Delete Item</a></li>";
                            echo "</ul></div>";
                            echo "</li>";
                        }
                    ?>
                </ul>
                <form class="add" action="addToList.php" method="post">
                    <input class="col-xs-4 add-item" type="text" name="ingredient-name" placeholder="Ingredient Name">
                    <input class="col-xs-3 add-item" type="text" name="quantity" placeholder="Quantity">
                    <input class="col-xs-2 add-item" type="text" name="units" placeholder="Units">
                    <button type="submit" name="submit2" class="btn btn-primary no-outline"><span class="glyphicon glyphicon-ok"></span></button>
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
        remove: function(event,ui) {
            var list1 = $( this ).attr('id');
            var name = ui.item.find('.item-name');
            var qty = ui.item.find('.item-quantity');     
            var units = ui.item.find('.item-units');

            $.ajax({
              method: "POST",
              url: "transferIngredient.php",
              dataType: "json",
              data: { list: list1, name: name[0].innerHTML, qty: qty[0].innerHTML, units: units[0].innerHTML}
            });
        },
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
        var edit_btn = $( this ).find(".edit");
        for (var i=0; i < edit_btn.length; i++) {
            edit_btn[i].style.visibility = "visible";
        }
      }, function() {
        var edit_btn = $( this ).find(".edit");
        for (var i=0; i < edit_btn.length; i++) {
            edit_btn[i].style.visibility = "hidden";
        }
      }
    );



    </script>



</body>

</html>
