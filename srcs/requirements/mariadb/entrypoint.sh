#!/bin/bash

# Check if the /var/lib/mysql/wordpress_data directory exists
if [ ! -d "/var/lib/mysql/wordpress_data" ]; then
    # Start the MySQL service
    service mysql start

    # Wait for the service to start
    sleep 1

    # Connect to MySQL as the root user and run the following commands:
    # - Create a database with the name specified in the $DB_NAME environment variable
    # - Create a user with the name specified in the $DB_USER environment variable and the password specified in the $DB_PASS environment variable
    # - Grant all privileges on the wordpress_data database to the user
    # - Set the password for the root user to the password specified in the $DB_PASS_ROOT environment variable
    mysql -u root <<END
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON wordpress_data.* TO '$DB_USER'@'%';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
END

    # Stop the MySQL service
    service mysql stop

    # Wait for the service to stop
    sleep 1
else
    # If the /var/lib/mysql/wordpress_data directory exists, print a message
    echo "DB exits"
fi

# Start the mysqld_safe service
mysqld_safe
