# Use the official Debian Buster image as the base image
FROM debian:buster

# Install the nginx web server and openssl package
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    apt-get install openssl

# Generate an SSL certificate and key using the openssl command.
# The certificate and key are generated with the specified subject information
# and are saved to the /etc/ssl/private/nginx.key and /etc/ssl/certs/nginx.crt files, respectively.
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=Student/CN=ddordain.42.fr/emailAddress=ddordain@student.42.fr"

# Copy the default.conf file to the /etc/nginx/conf.d/nginx.conf file
COPY ./default.conf /etc/nginx/conf.d/nginx.conf

# Run the nginx web server with the "daemon off;" option, which allows the container to be run in the foreground
CMD ["nginx", "-g", "daemon off;"]
