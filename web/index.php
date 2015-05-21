<!DOCTYPE html>
<html lang="en">

<head>
	<title>My Meal Manager</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
	<link href="css/index.css" rel="stylesheet">
	<link href="css/animate-custom.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<div class="container-fluid" id="hero-page">
			<h1>MMM...</h1>
			<h2>My Meal Manager</h2>
			<button class="btn btn-primary" onclick="popup();">Get started</button>
		</div>
            <div id="getstarted" <?php if ($_GET["loginFailed"] || $_GET["registerFailed"]) echo "style='visibility:visible;'"; ?>>
                <a class="hiddenanchor" id="toregister"></a>
                <a class="hiddenanchor" id="tologin"></a>
                <div id="wrapper">
                    <div id="login" class="animate form">
                    	<span id="errormsg1">
                 			<?php if ($_GET["loginFailed"]){
                 				echo '<div class="alert alert-danger" role="alert">';
                 				echo "Not a valid user. Please check password or register.";
                 				echo '</div>';
                 			} else if ($_GET["registerFailed"]){
                 				echo '<div class="alert alert-danger" role="alert">';
                 				echo "Username is in use. Please log in.";
                 				echo '</div>';
                 			}
                 			?>
                 		</span> 
                        <form name="loginForm" action="login.php" method="post"> 
                            <h3>Log in</h3> 
							<input class="form-control" type="Email" name="username" placeholder="Email address" required>
							<input class="form-control" type="password" name="password" placeholder="Password" required>
							<button type="submit" name="submit" class="btn btn-success">Log in</button>
                            <p class="change_link">
								Don't have an account?
								<a href="#toregister" class="to_register">Sign up</a>
							</p>
                        </form>
                    </div>

                    <div id="register" class="animate form">
                    	<span id="errormsg2">
                 		</span>                   	
                        <form name="registerForm" action="register.php" method="post" onsubmit="return validateRegister();"> 
                            <h3> Sign up </h3> 
							<input class="form-control" type="Email" name="username" placeholder="Email address" required>
							<input class="form-control" type="password" name="password1" placeholder="Password" required>
							<input class="form-control" type="password" name="password2" placeholder="Confirm password" required>
							<button type="submit" name="submit" class="btn btn-success">Sign up</button>
                            <p class="change_link">  
								Already have an account?
								<a href="#tologin" class="to_register">Log in</a>
							</p>
                        </form>
                    </div>
					
                </div>
            </div> 
	</div>
</body>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui-1.11.4/jquery-ui.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	document.addEventListener("keypress", escape, false);
	function escape(e) {
		var keyCode = e.keyCode;
		if (keyCode == 27) {
			var popup = document.getElementById('getstarted');
			popup.style.visibility = "hidden";
		}
	}
	function popup() {
		var popup = document.getElementById('getstarted');
		popup.style.visibility = "visible";
	}
	function validateRegister() {
		var pw1 = document.forms["registerForm"]["password1"].value;
		var pw2 = document.forms["registerForm"]["password2"].value;
		if (pw1 != pw2) {
			var error = document.getElementById('errormsg2');
			var div = document.createElement('div');
			div.className = "alert alert-danger";
			div.role = "alert";
			div.innerHTML = "Passwords do not match.";
			error.appendChild(div);
			return false;
		}
	}
    </script>
</html>