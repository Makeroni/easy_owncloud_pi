EASY OWNCLOUD PI
=================

Create your Ownclod with a bash script.

Log in your Raspberry Pi and start the script:

````
git clone https://github.com/Makeroni/easy_owncloud_pi.git && cd easy_owncloud_pi
chmod +x easy_owncloud.sh
./easy_owncloud.sh
````

The script will do all the magic to install Owncloud in your RPi, you will be ask to enter your apache2 webserver directory and the path where you want to place your owncloud folder:

If your webserver document are placed in /var/www/webserver and you have an external disk at /media/Seagate, then you can place the path this way:

````
Type your apache2 web directory and press [ENTER]:
/var/www/webserver
Type the path where you wan to place your shared data and press [ENTER]:
/media/Seagate
````