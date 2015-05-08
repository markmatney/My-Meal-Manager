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
    <link href="css/explore.css" rel="stylesheet">

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

                <nav class="navbar navbar-default navbar-lower" role="navigation">
                  <div class="container">
                    <div class="collapse navbar-collapse collapse-buttons">
                      <form class="navbar-form" role="search">
                            <div id="custom-search-input">
                                <div class="input-group col-md-12">
                                    <input type="text" class="  search-query form-control" placeholder="Search" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-danger" type="button">
                                            <span class=" glyphicon glyphicon-search"></span>
                                        </button>
                                    </span>
                                </div>
                            </div>
                      </form>
                    </div>
                  </div>
                </nav>
            <div id="grid">
                <div class="row">
                    <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/0149359_Making-Taco_s4x3.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                     <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/ramen.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/sample.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/pinwheel-cookies-ck-1941056-x.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/BIG_TIMMY_BURGER-lg.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/cookies.jpeg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/how-to-grill-steak.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/sashimi-resized.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
                     <div class="col-md-4 recipe-item">
                        <a href="recipes.php">
                            <div class="image">
                                <div class="container-fluid">
                                <img src="/~jmpham/img/sample2.jpg" class="img-responsive"/>
                                </div>
                            </div>
                            <div class="description">
                                <h2>Dish</h2>
                            </div>
                        </a>
                    </div>
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

    </script>



</body>

</html>
