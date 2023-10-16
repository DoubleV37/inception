all: up

up:
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

stop:
	docker compose -f srcs/docker-compose.yml stop

fclean: down
	docker system prune -af --volumes
	sudo rm -rf ~/data/db/* ~/data/wordpress/*

rmv:
	sudo rm -rf ~/data/db/* ~/data/wordpress/*

re: stop up

fre: fclean up

rve: rmv up

.PHONY: up down fclean re fre all rve rmv stop
