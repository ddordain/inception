#!/bin/bash

# Wait for 5 seconds
sleep 5

# Change the current directory to /var/www/html
cd /var/www/html

# Download the latest WordPress files
wp core download --allow-root

# Copy the wp-config.php file to the /var/www/html directory
cp /wp-config.php /var/www/html/

# Install WordPress using the wp-cli command
# The installation uses the values of the $HODO, $WP_USER, $WP_PASS, and $USR_PWD environment variables
wp core install --allow-root --url=$HODO --title=Inception --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=info@example.com

# Create a user named "jacques" with the email address "jacques@example.com" and the password specified in the $USR_PWD environment variable
# The user is given the "author" role
wp user create --allow-root jacques jacques@example.com --user_pass=$USR_PWD --role=author

# Create the /run/php directory
mkdir /run/php

# Change the current directory to the previous directory
cd -

# Start the PHP-FPM 7.3 service
php-fpm7.3 -F
