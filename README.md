# CS130
My Meal Manager

The application combines a grocery list, an inventory tracker, and a recipe book. It is meant to combine all aspects of making meals into a single app and tracking your current inventory for future meals. The basic features specifically include a grocery list, an inventory tracker, a search function, a recipe book, and a user profile.

Authors:
  Sandra da Silva, 
  Michael Dang, 
  Albert Huang, 
  Mark Matney, 
  Ken Ohhashi, 
  Jessica Pham. 

Spring 2015, UCLA

Our website uses a LAMP (Linux, Apache, MySql, PHP) based web structure. Set up your machine following the instructions of any of the links below:
MAC: jason.pureconcepts.net/2014/11/install-apache-php-mysql-mac-os-x-yosemite/
Ubuntu: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu
Windows: http://www.ultraedit.com/support/tutorials_power_tips/uestudio/local_php_mysql_dev_environment.html

Once your environment has been set up, copy all the files in the GitHub into your Web Document Root folder or the folder that your local server serves (differs depending on the system).

Set Up Database:
Download MySql and make sure that MySql server is running
Create a database called CS130.
As the root user, create a user "cs130" with password "test" and grant the new user with all privileges. This allows the files to access and modify the database.
Build the table schema with the createTables.sql script in the "database" folder, and now your database is complete!

To access the website, replace "user" with your system username
URL: http://localhost/~user/web/ 