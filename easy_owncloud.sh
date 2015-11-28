#!/bin/bash
##############################
# ___    ,---.      ,--.-.,-.      ,----.                 _,.---._    .-._         .=-.-.           ,---.                    ,-,--.
# .-._ .'=.'\ .--.'  \    /==/- |\  \  ,-.--` , \  .-.,.---.   ,-.' , -  `. /==/ \  .-._ /==/_ / _.-.    .--.'  \        _..---.  ,-.'-  _\
# /==/ \|==|  |\==\-/\ \   |==|_ `/_ / |==|-  _.-` /==/  `   \ /==/_,  ,  - \|==|, \/ /, /==|, |.-,.'|    \==\-/\ \     .' .'.-. \/==/_ ,_.'
# |==|,|  / - |/==/-|_\ |  |==| ,   /  |==|   `.-.|==|-, .=., |==|   .=.     |==|-  \|  ||==|  |==|, |    /==/-|_\ |   /==/- '=' /\==\  \
# |==|  \/  , |\==\,   - \ |==|-  .|  /==/_ ,    /|==|   '='  /==|_ : ;=:  - |==| ,  | -||==|- |==|- |    \==\,   - \  |==|-,   '  \==\ -\
# |==|- ,   _ |/==/ -   ,| |==| _ , \ |==|    .-' |==|- ,   .'|==| , '='     |==| -   _ ||==| ,|==|, |    /==/ -   ,|  |==|  .=. \ _\==\ ,\
# |==| _ /\   /==/-  /\ - \/==/  '\  ||==|_  ,`-._|==|_  . ,'. \==\ -    ,_ /|==|  /\ , ||==|- |==|- `-._/==/-  /\ - \ /==/- '=' ,/==/\/ _ |
# /==/  / / , |==\ _.\=\.-'\==\ /\=\.'/==/ ,     //==/  /\ ,  ) '.='. -   .' /==/, | |- |/==/. /==/ - , ,|==\ _.\=\.-'|==|   -   /\==\ - , /
#`--`./  `--` `--`         `--`      `--`-----`` `--`-`--`--'    `--`--''   `--`./  `--``--`-``--`-----' `--`        `-._`.___,'  `--`---'
#
# Copyright 2015 MakeroniLabs
# Install Owncloud into Raspberry Pi with few touches
##############################

echo "Type your apache2 web directory and press [ENTER]: " && read dir_owncloud
echo "Type the path where you wan to place your shared data and press [ENTER]: " && read media_path

echo ""
echo "Installing packages..."
sudo apt-get update && sudo apt-get install -y apache2 php5 php5-json php5-gd php5-sqlite curl libcurl3 libcurl3-dev php5-curl php5-common php-xml-parser

echo ""

echo "Uncompressing owncloud..."
tar xvf owncloud-8.2.1.tar.bz2

if [ ! -d "$media_path/owncloud" ]; then
    sudo mkdir "$media_path/owncloud"
fi;

if [ ! -d "$media_path/owncloud/data" ]; then
    sudo mkdir "$media_path/owncloud/data"
fi;

echo "Copying owncloud to apache web server..."

sudo cp -r owncloud/ "$dir_owncloud"
sudo rm -rf owncloud/

echo "Setting permissions..."

sudo chown -R www-data:www-data "$dir_owncloud/owncloud"
sudo chown -R www-data:www-data "$media_path/owncloud"
sudo chown -R www-data:www-data "$media_path/owncloud/data"

echo "Reloading web server..."
sudo service apache2 restart

echo ""
echo "Congratulations!! You have finished configure your owncloud!!"
echo "Open your browser and point to: http://YOUR_RASPBERRY_IP/owncloud"
echo "Enjoy!"
echo ""

exit 0
