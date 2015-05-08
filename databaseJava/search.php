<?php
/*searchRecipes 

Takes a space separated list of ingredients as input and prints out 
all recipe names that use all those ingredients, sorted by number of ingreds 
the recipe requires that aren't in the user inventory or grocery list
*/
function searchRecipes($ingredients){
	$output = shell_exec('java -cp .:mysql-connector-java-5.1.35-bin.jar MyMealManager.searchMain ' + $ingredients);
	echo $output;
}


?>
