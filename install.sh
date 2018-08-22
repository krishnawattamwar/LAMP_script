#!/bin/bash

#Instructions to use this script 
#
#chmod +x SCRIPTNAME.sh
#
#sudo ./SCRIPTNAME.sh


echo "###################################################################################"
echo "Please be Patient: Installation will start now....... It may take some time :)"
echo "###################################################################################"


#PHP7 PPA
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:ondrej/php


#Update the repositories

sudo apt-get update


#Apache, Php, MySQL and required packages installation

sudo apt-get -y install apache2 php5.6 php7.2-cli php7.2-curl php7.2-mbstring php7.2-xml php7.2-zip php7.2-mysql php7.2-gd mysql-client

#The following commands set the MySQL root password to pass@123 when you install the mysql-server package.

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password pass@123'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password pass@123'
sudo apt-get -y install mysql-server

#Restart all the installed services to verify that everything is installed properly

echo -e "\n"

service apache2 restart && service mysql restart > /dev/null

echo -e "\n"

php -v

if [ $? -ne 0 ]; then
   echo "Please Check the Install Services, There is some $(tput bold)$(tput setaf 1)Problem$(tput sgr0)"
else
   echo "Installed Services run $(tput bold)$(tput setaf 2)Sucessfully$(tput sgr0)"
fi

echo -e "\n"
