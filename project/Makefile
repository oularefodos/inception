all:
	@bash srcs/requirements/wordpress/tools/makeDir.sh
	@docker-compose -f srcs/docker-compose.yml  up --build -d

build:
	@bash srcs/requirements/wordpress/tools/makeDir.sh
	@docker-compose -f srcs/docker-compose.yml up -d  --build

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: down
	@docker system prune -a

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

re: fclean all
.PHONY	: all build down re clean fclean
