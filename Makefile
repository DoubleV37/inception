up:
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

fclean: down
	docker system prune -af --volumes
	sudo rm -rf ~/data/db/* ~/data/wordpress/*

re: down up

fre: fclean up

.PHONY: up down fclean re fre
