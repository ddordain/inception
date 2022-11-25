#!/bin/bash

if [ ! -d "/var/lib/mysql/wordpress_data" ]; then
# echo "before dir does not exist"

service mysql start
sleep 1

mysql -u root <<END
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON wordpress_data.* TO '$DB_USER'@'%';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
END

service mysql stop 
sleep 1

else
echo "DB exits"
fi

mysqld_safe