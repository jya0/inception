# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jyao <jyao@student.42abudhabi.ae>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/23 09:11:20 by jyao              #+#    #+#              #
#    Updated: 2023/09/23 09:19:40 by jyao             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#-*- Makefile for ./srcs/docker-compose.yml -*-

#to specify the location of Docker-compose.yml file (-f)
COMPOSE_FILE	:=	-f ./srcs/Docker-compose.yml

#by default cause docker compose up
all: up

#depends on build then runs containers in detached mode (-d)
up: build
	docker compose $(COMPOSE_FILE) up -d

#builds our Dockerfiles into images first
build:
	docker compose $(COMPOSE_FILE) build

#don't ask for confirmation (-f) stop containers if running (-s) remove any anonymous volumes (-v)
clean: down
	docker compose $(COMPOSE_FILE) rm -f -s -v

#will remove containers and volumes automatically
down:
	docker compose $(COMPOSE_FILE) down

#remove the images (--rmi)
fclean: clean
	docker compose $(COMPOSE_FILE) down --rmi

re: fclean all

.PHONY: all up down clean fclean re