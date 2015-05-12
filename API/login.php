<html>
<body>

<?php
require($DOCUMENT_ROOT . "./index.html");
include 'func.php';
?>

<?php
  
   $api = new databaseAPI;
   $name = $_GET["name"];
   $pw = $_GET["pw"];
   //$api->addUser($name,$pw);
   if( $api->checkIfValidUser($name,$pw))
   {  echo "valid";
	 	 $user = $api->getUserID($name);
		 echo $user;}
	 else
	   echo "invalid";


?>





<form action="./login.php" method="GET"> 
   
     username:
	<input type="text" name="name" maxlength="50" width="100">
	</br>pawssord:
	<input type="text" name="pw" maxlength="50" width="100">
    </br>
	<input type="submit" value="login!"/>
	
</form>
<hr/>
</body>
</html> 