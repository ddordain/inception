# Use the official Debian Buster image as the base image
FROM debian:buster

# Copy the wp-config.php file to the root directory of the image
COPY ./wp-config.php /

# Update the package index and install the PHP 7.3, MySQL, and wget packages
RUN apt-get update -y
RUN apt-get install -y  php7.3 php-mysqli php-fpm mariadb-client wget

# Download the wp-cli.phar file from GitHub
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make the wp-cli.phar file executable
RUN chmod +x wp-cli.phar

# Move the wp-cli.phar file to the /usr/local/bin directory and rename it to "wp"
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy the www.conf file to the /etc/php/7.3/fpm/pool.d directory
COPY ./www.conf /etc/php/7.3/fpm/pool.d

# Copy the entrypoint.sh script to the root directory of the image and make it executable
COPY ./entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

# Set the entrypoint of the container to the entrypoint.sh script
ENTRYPOINT ./entrypoint.sh
