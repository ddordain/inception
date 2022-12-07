all:
	mkdir -p /home/ddordain/data
	mkdir -p /home/ddordain/data
	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean:
	sudo rm -rf /home/ddordain/data/wordpress
	sudo rm -rf /home/ddordain/data/mariadb
	sudo rm -rf /home/ddordain/data/
	@docker stop $$(docker ps -qa) || true
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q) || true

re: fclean all

.PHONY: all clean fclean re