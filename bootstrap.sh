#!/usr/bin/env bash

#
# load settings file
#
. /vagrant/settings.sh

debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password $mysql_root_password"
debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password $mysql_root_password"

# default packages (php, mysql, nginx, etc), are preinstalled in the base box
# update anyway, and also make sure php-mbstring is installed
# we'll move this into the base box next update 

apt-get update
apt-get upgrade
apt-get install php-mbstring php7.0-mbstring php5.5-mbstring php5.6-mbstring -y

echo "**** add byobu config"
. /vagrant/configs/byobu.sh

echo "**** Moving nginx config files into place…"
. /vagrant/nginx/nginx.sh

echo "**** mysql config…"
mv /etc/mysql/my.cnf /etc/mysql/my.cnf.default
cp /vagrant/mysql/my.cnf /etc/mysql/my.cnf

echo "**** Set PHP to ${php_version} and copy config files"
. /vagrant/php/php.sh


echo "Starting services…"
service nginx restart
service php5.5-fpm stop
service php5.6-fpm stop
service php7.0-fpm stop

service php${php_version}-fpm restart
service mysql restart


# WP-CLI
. /vagrant/wp/wp-cli.sh

# Create database
. /vagrant/mysql/create_database.sh

# Install WP
. /vagrant/wp/install-wp.sh

# Import database
. /vagrant/mysql/import_database.sh
