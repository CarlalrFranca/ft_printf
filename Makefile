# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cleticia <cleticia@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/19 13:30:34 by cleticia          #+#    #+#              #
#    Updated: 2022/09/18 07:07:40 by cleticia         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = printf.a

CC = gcc

RM = rm -rf

FLAGS = -Wall -Wextra -Werror

SRC = src/ft_printf.c\
	src/ft_int_conv.c\
	src/ft_str_conv.c\
	src/ft_char_conv.c\
	src/ft_hexa_conv.c\

OBJS = $(SRC:.c=.o)

LFT = libft.a

LIB = ./libft/

all: $(NAME)

$(NAME): $(LIB) $(OBJS)
	@make -C $(LIB) $(LFT)
	@cp -r $(LIB)$(LFT) .
	@mv $(LFT) $(NAME)
	@ar -rcs $(NAME) $(OBJS)
	@echo Ready!

.c.o:
	@$(CC) -g $(FLAGS) -c $< -o $@

clean:
	@make -s $@ -C ./libft
	@$(RM) $(OBJS)
	@echo "Clean done!"

fclean: clean
	@$(RM) $(NAME) $(OBJS) $(LFT)

re: fclean all

.PHONY: all clean fclean re