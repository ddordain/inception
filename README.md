# INCEPTION

## 1. Docke Compose

```C
This Docker Compose file defines a network called localhost and two volumes: wordpress_dir and mariadb_dir. The localhost network allows the three services, mariadb, wordpress, and nginx, to communicate with each other. The wordpress_dir and mariadb_dir volumes are used to persist data for the wordpress and mariadb services, respectively.

The mariadb service uses the ./requirements/mariadb directory as the build context to create a MariaDB Docker container. This container uses the mariadb_dir volume to store MariaDB data, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The env_file property specifies that the container should use the .env file to load environment variables.

The wordpress service uses the ./requirements/wordpress directory as the build context to create a WordPress Docker container. This container uses the wordpress_dir volume to store WordPress files, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The env_file property specifies that the container should use the .env file to load environment variables. Additionally, the depends_on property specifies that the wordpress service depends on the mariadb service, so the mariadb service will be started before the wordpress service.

The nginx service uses the ./requirements/nginx directory as the build context to create an nginx Docker container. This container uses the wordpress_dir volume to store nginx files, and it is connected to the localhost network. The restart property is set to always, so the container will automatically restart if it stops or crashes. The ports property maps port 443 on the host machine to port 443 on the container, so any traffic sent to port 443 on the host machine will be forwarded to the nginx container. The depends_on property specifies that the nginx service depends on the wordpress service, so the wordpress service will be started before the nginx service.
```
