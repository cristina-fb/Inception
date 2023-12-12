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

DBV = '/home/crisfern/data/DB' 

WPV = '/home/crisfern/data/WP'

$(NAME): all

all:
	mkdir -p $(DBV) $(WPV)
	sudo docker compose -f $(COMPOSE) up -d

clean:
	sudo docker compose -f $(COMPOSE) down

fclean: clean
	sudo docker system prune -a -f
	sudo docker volume rm -f srcs_WP srcs_DB
	sudo rm -rf $(WPV) $(DBV)

re: fclean all

.PHONY: all clean fclean re
