# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: crisfern <crisfern@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 16:59:51 by crisfern          #+#    #+#              #
#    Updated: 2023/11/13 17:18:36 by crisfern         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE = srcs/docker-compose.yml

NAME = Inception
	
$(NAME): all

all:
	sudo docker compose -f $(COMPOSE) up -d

clean:
	sudo docker compose -f $(COMPOSE) down

fclean: clean
	sudo docker system prune -a -f
	sudo docker volume rm srcs_WP srcs_DB

re: fclean all

.PHONY: all clean fclean re
