#!/bin/bash

echo ""
echo "Installing packages..."
#sudo apt-get update && sudo apt-get install -y apache2 php5 php5-json php5-gd php5-sqlite curl libcurl3 libcurl3-dev php5-curl php5-common php-xml-parser

echo "Type your apache2 web directory and press [ENTER]:" && read dir_owncloud
echo "Type the path where you wan to place your shared data and press [ENTER]:" && read media_path

echo "Downloading and uncompressing owncloud..."
URL_OWNCLOUD="https://raw.githubusercontent.com/Makeroni/easy_owncloud_pi/master/owncloud-8.2.1.tar.bz2"
cd /tmp && wget $URL_OWNCLOUD && tar xvf owncloud-8.2.1.tar.bz2 

if [ ! -d "$media_path/owncloud" ]; then
    sudo mkdir "$media_path/owncloud"
fi;

if [ ! -d "$media_path/owncloud/data" ]; then
    sudo mkdir $media_path/owncloud/data
fi;

sudo chown -R www-data:www-data $media_path/owncloud/data

echo "Copying owncloud to apache web server..."

sudo cp -r /tmp/owncloud $dir_owncloud
#sudo rm -rf /tmp/owncloud

echo "Setting permissions..."

sudo chown -R www-data:www-data $dir_owncloud/owncloud
sudo chown -R www-data:www-data $media_path/owncloud

echo "Reloading web server..."
sudo service apache2 restart

echo ""
echo "Congratulations!! You have finished configure your owncloud!!"
echo "Open your browser and point to: http://YOUR_RASPBERRY_IP/owncloud"
echo "Enjoy!"
echo ""

exit 0
