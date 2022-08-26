#!/bin/bash

# Some variables
APP_DIR=/app
ARCHIVES=$APP_DIR/temp

PMA=$ARCHIVES/phpMyAdmin-5.2.0-all-languages.tar.gz
WP=$ARCHIVES/wordpress-6.0.1.tar.gz

NGINX_DIR=/etc/nginx
SERVER_DIR=/srv/www/localhost

CONF=nginx.conf

# Create SSL cert
openssl req\
	-x509\
	-newkey rsa:4096\
	-sha256\
	-days 3650\
	-nodes\
	-out /etc/ssl/certs/localhost.crt\
	-keyout /etc/ssl/certs/localhost.key\
	-subj "/C=CH/ST=Lausanne/L=Renens/O=42/OU=42Lausanne/CN=localhost"\
	-addext "subjectAltName=DNS:localhost,IP:127.0.0.1"

# Configure DB
PASSWORD=password
service mysql start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE DATABASE phpmyadmin;"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$PASSWORD');"
mysql -e "GRANT ALL on wordpress.* TO 'wp_user'@'localhost' IDENTIFIED BY '$PASSWORD';"
mysql -e "GRANT ALL on phpmyadmin.* TO 'pma_user'@'localhost' IDENTIFIED BY '$PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"
mysql wordpress < $ARCHIVES/wordpress.sql

# Install wordpress
mkdir -p $SERVER_DIR/wordpress
tar -xf $WP --strip-components=1 -C $SERVER_DIR/wordpress
mv $ARCHIVES/wp-config.php $SERVER_DIR/wordpress/
chown -R www-data:www-data $SERVER_DIR/wordpress

# Install phpMyAdmin
# --strip-component renames the extracted file
mkdir -p $SERVER_DIR/phpmyadmin
tar -xvf $PMA --strip-components=1 -C $SERVER_DIR/phpmyadmin
mv $ARCHIVES/config.inc.php $SERVER_DIR/phpmyadmin/
chmod 660 $SERVER_DIR/phpmyadmin/config.inc.php
chown -R www-data:www-data $SERVER_DIR/phpmyadmin

# Nginx config
rm $NGINX_DIR/sites-enabled/default
mv $ARCHIVES/$CONF $NGINX_DIR/sites-available/
ln -s $NGINX_DIR/sites-available/$CONF $NGINX_DIR/sites-enabled/
