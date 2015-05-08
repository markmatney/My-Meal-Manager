<html>
<body>

<?php
require($DOCUMENT_ROOT . "./index.html");
include 'func.php';
?>

<?php
  
   $api = new databaseAPI;
   $name = $_GET["name"];
   $qty = $_GET["qty"];
   $units = $_GET["units"];
    $name2 = $_GET["name2"];

   $qty2 = $_GET["qty2"];
   $units2 = $_GET["units2"];
   $name =  mysql_real_escape_string($name);
  
  $api->addToInventory(1,$name,$qty,$units);

  $api->removeFromInventory(1,$name2,$qty2,$units2);
  $invenlist = @mysql_query("SELECT * FROM Inventory");
  $name=NULL;
  $name2=NULL;
?>
<hr/>
        Your Ingredients:</br>
	 
	    <?php
		  
			$api->getInventory(1);
			
	    ?>
	    </select>
	  
</form>
<hr/>




<form action="./showinventory.php" method="GET"> 
   
	Add Ingredient:
	<input type="text" name="name" maxlength="50" width="100">
	</br>Quantity:
	<input type="text" name="qty" maxlength="50" width="100">
	</br>Units:
	<input type="text" name="units" maxlength="50" width="100">
	<input type="submit" value="Add!"/>
	</br></br>Remove Ingredient:
	<input type="text" name="name2" maxlength="50" width="100">
	</br>Quantity:
	<input type="text" name="qty2" maxlength="50" width="100">
	</br>Units:
	<input type="text" name="units2" maxlength="50" width="100">
	<input type="submit" value="Remove!"/>
</form>
<hr/>
</body>
</html> 