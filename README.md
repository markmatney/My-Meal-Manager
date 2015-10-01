# My Meal Manager  
  
The application combines a grocery list, an inventory tracker, and a recipe  
book. It is meant to combine all aspects of making meals into a single app and  
tracking your current inventory for future meals. The basic features  
specifically include a grocery list, an inventory tracker, a search function, a  
recipe book, and a user profile.  
  
### Authors:  
Sandra da Silva, Michael Dang, Albert Huang, Mark Matney, Ken Ohhashi, Jessica Pham.
  
_CS 130 @ UCLA, Spring 2015_
  
## Setup  
  
Our website uses a LAMP (Linux, Apache, MySql, PHP) based web structure.  
    
1) Set up your machine following the instructions of any of the links below:   
  
MAC: http://jason.pureconcepts.net/2014/11/install-apache-php-mysql-mac-os-x-yosemite/   
Ubuntu: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu   
Windows: http://www.ultraedit.com/support/tutorials_power_tips/uestudio/local_php_mysql_dev_environment.html

Download IntelliJ, the Android IDE:
    https://www.jetbrains.com/idea/download/

Download Community Edition Genymotion:
    https://www.genymotion.com/#!/download

Follow these steps on IntelliJ to get it set up with Genymotion:
    http://hexcoder.us/2013/08/10/genymotion-with-intellij/
  
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
  
    $ cd database
    $ mysql -h localhost -u cs130 -ptest  

    mysql> CREATE DATABASE CS130;  
  
6) Build the table schema and initialize the database with 'createTables.sql' and 'initializeDB.sql', both in the 'database'   
folder.  
  
    mysql> SOURCE createTables.sql;
    mysql> SOURCE initializeDB.sql;  
    mysql> exit  
    
7) To access the website, replace "user" with your system username:  
  
    $ google-chrome http://localhost/~user/web/   
    $ firefox http://localhost/~user/web/  
  
8) To build the Android application:

..*Open IntelliJ and select Import Project
..*Select the folder CS130/android/MMM
..*Select Create project from existing sources.
..*Continue hitting Next and complete the set up

..*On the top right of the IntelliJ window, select the drop down menu (to the left of the Play button) and select Edit Configurations...
..*Click the + button on the top left of the new pop up window and select Android Application.
..*Go to the right half of the screen.
..*Rename the Android Application to genymotion.
..*Scroll down and for the Target Device section, make sure that Show chooser dialog is selected.
..*Hit OK.
..*On the top right of the IntelliJ window again, open the same drop down menu and select genymotion.

..*Open Genymotion and select Add to add a new virtual machine.
..*Select Google Nexus 5 - 5.1.0 - API 22 - 1080x1920.
..*Continue hitting next until Genymotion begins creating the virtual machine.
..*Wait for the set up to complete.
..*Once completed, select the Google Nexus 5 machine and select Start.
..*Wait for the virtual machine to boot up.
..*Once the virtual machine has booted, make sure to unlock the emulator's screen by clicking on the screen and dragging up.

..*Return to IntelliJ and select the Play button on the top right corner of the window.
..*Wait for the project to build and for the chooser dialog to appear.
..*Select the emulator that you started up from Genymotion and hit ok.

..*The app should now be starting on the emulator.
