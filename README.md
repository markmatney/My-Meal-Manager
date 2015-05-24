# My Meal Manager  
  
The application combines a grocery list, an inventory tracker, and a recipe  
book. It is meant to combine all aspects of making meals into a single app and  
tracking your current inventory for future meals. The basic features  
specifically include a grocery list, an inventory tracker, a search function, a  
recipe book, and a user profile.  
  
### Authors:  
Sandra da Silva, Michael Dang, Albert Huang, Mark Matney, Ken Ohhashi, Jessica Pham.
  
Spring 2015, UCLA  
  
## Setup  
  
Our website uses a LAMP (Linux, Apache, MySql, PHP) based web structure.  
    
1) Set up your machine following the instructions of any of the links below:   
  
MAC: jason.pureconcepts.net/2014/11/install-apache-php-mysql-mac-os-x-yosemite/   
Ubuntu: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu   
Windows: http://www.ultraedit.com/support/tutorials_power_tips/uestudio/local_php_mysql_dev_environment.html   
  
2) Once your environment has been set up, copy all the files in the GitHub into   
your Web Document Root folder or the folder that your local server serves   
(differs depending on the system).  
  
3) Download MySQL and login as root (make sure that MySQL Server is running):  
  
    $ mysql --user=root root  
  
4) Create a user "cs130" with password "test" and grant the  
new user with all privileges. This allows the files to access and modify the   
database.  
  
    mysql> CREATE USER 'cs130'@'localhost' IDENTIFIED BY 'test';  
    mysql> GRANT ALL PRIVILEGES ON *.* TO 'cs130'@'localhost';  
    mysql> exit  
  
5) Login as the new user and create a new database:  
  
    $ mysql -h localhost -u cs130 -ptest  

    mysql> CREATE DATABASE CS130;  
  
6) Build the table schema with the createTables.sql script in the "database"   
folder.  
  
    mysql> SOURCE createTables.sql;  
    mysql> exit  
  
7) To initialize it with recipe data, compile and run the web scraper code in   
the "webscraper" folder:  
  
    $ cd webscraper  
    $ javac RecipeSQLGen.java  
    $ java Main recipes CS130 | mysql -h localhost -u cs130 -ptest  
  
8) To access the website, replace "user" with your system username:  
  
    $ google-chrome http://localhost/~user/web/   
    $ firefox http://localhost/~user/web/  
  
