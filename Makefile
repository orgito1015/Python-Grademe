# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Seraph919 <Seraph919@outlook.fr>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 01:05:24 by jcluzet           #+#    #+#              #
#    Updated: 2025/04/9 10:30:46 by Seraph919         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@bash .system/launch.sh all

re: clean
	@bash .system/launch.sh

gradejustinstall:
	@bash .system/launch.sh gradejustinstall

grade: clean
	@bash .system/launch.sh grade

clean:
	@rm -rf .system/a.out
	@rm -rf .system/a.out.dSYM

fclean:
	@rm .system/a.out

help:
	@echo "\x1B[37mType \x1B[32m> make \x1B[37mto start the exam"
