# INCEPTION

# 1. Docker Compose

This Docker Compose file defines a network called localhost and two volumes: wordpress_dir and mariadb_dir. The localhost network allows the three services, mariadb, wordpress, and nginx, to communicate with each other. The wordpress_dir and mariadb_dir volumes are used to persist data for the wordpress and mariadb services, respectively.

The mariadb service uses the ./requirements/mariadb directory as the build context to create a MariaDB Docker container. This container uses the mariadb_dir volume to store MariaDB data, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The env_file property specifies that the container should use the .env file to load environment variables.

The wordpress service uses the ./requirements/wordpress directory as the build context to create a WordPress Docker container. This container uses the wordpress_dir volume to store WordPress files, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The env_file property specifies that the container should use the .env file to load environment variables. Additionally, the depends_on property specifies that the wordpress service depends on the mariadb service, so the mariadb service will be started before the wordpress service.

The nginx service uses the ./requirements/nginx directory as the build context to create an nginx Docker container. This container uses the wordpress_dir volume to store nginx files, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The ports property maps port 443 on the host machine to port 443 on the container, so any traffic sent to port 443 on the host machine will be forwarded to the nginx container. The depends_on property specifies that the nginx service depends on the wordpress service, so the wordpress service will be started before the nginx service.

# 2. NGINX

NGINX is a web server that is often used to serve dynamic content from websites and applications. It is known for its high performance and ability to handle many concurrent connections. NGINX can also be used as a load balancer to distribute incoming traffic across multiple backend servers. In addition to its web server capabilities, NGINX can also be used as a reverse proxy, which means that it can receive requests from clients and forward them to other servers for further handling. This makes it a popular choice for use in web application architectures.


# 3. MARIADB

MariaDB is a fork of the popular MySQL database management system. It was created as a community-driven alternative to MySQL, and is considered to be a drop-in replacement for MySQL, meaning that it can be used in place of MySQL in most cases without any changes to the application or system. MariaDB includes many of the same features as MySQL, including the ability to store and manage large amounts of data, support for multiple storage engines, and support for SQL, the standard language for accessing and manipulating relational databases. MariaDB is often used in web applications and other systems that require a reliable and high-performance database management system.

# 4. WORDPRESS

WordPress is a content management system (CMS) that is used to create and manage websites. It is open-source software, which means that it is freely available for anyone to use and modify. WordPress is known for its ease of use and flexibility, and it is used by millions of websites around the world. It provides a user-friendly interface for creating and managing content, including pages, posts, and media files. WordPress also has a large ecosystem of plugins and themes that can be used to extend its functionality and customize the appearance of a website. It is often used for blogging and other types of websites that require frequent updates and user-generated content.

# And all together ?

This code defines a Docker Compose file with three services: mariadb, wordpress, and nginx. The mariadb service uses the ./requirements/mariadb directory as the build context to create a MariaDB Docker container. This container uses the mariadb_dir volume to store MariaDB data, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The env_file property specifies that the container should use the .env file to load environment variables.

The wordpress service uses the ./requirements/wordpress directory as the build context to create a WordPress Docker container. This container uses the wordpress_dir volume to store WordPress files, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The env_file property specifies that the container should use the .env file to load environment variables. Additionally, the depends_on property specifies that the wordpress service depends on the mariadb service, so the mariadb service will be started before the wordpress service.

The nginx service uses the ./requirements/nginx directory as the build context to create an nginx Docker container. This container uses the wordpress_dir volume to store nginx files, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The ports property maps port 443 on the host machine to port 443 on the container, so any traffic sent to port 443 on the host machine will be forwarded to the nginx container. The depends_on property specifies that the nginx service depends on the wordpress service, so the wordpress service will be started before the nginx service.

