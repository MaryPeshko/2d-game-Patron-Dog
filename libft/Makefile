# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpeshko <mpeshko@student.42berlin.de>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/21 22:18:51 by mpeshko           #+#    #+#              #
#    Updated: 2026/10/25 15:54:54 by mpeshko          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
SRCDIR = src

# addprefix prepends "src/" to each filename below (e.g. ft_atoi.c -> src/ft_atoi.c)
SRC =	$(addprefix $(SRCDIR)/, \
		ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
		ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c ft_memcmp.c ft_memcpy.c \
		ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
		ft_putstr_fd.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c \
		ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c \
		ft_strcmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c \
		ft_tolower.c ft_toupper.c ft_split.c ft_freestr.c \
		ft_lstadd_back.c ft_lstadd_front.c \
		ft_lstclear.c ft_lstdelone.c ft_lstiter.c \
		ft_lstlast.c ft_lstmap.c ft_lstnew.c \
	)

# Pattern substitution: convert src/name.c into obj/name.o for object targets
OBJ = $(SRC:$(SRCDIR)/%.c=obj/%.o)

# -I. adds the current directory to header search path (so #include "libft.h" works)
CFLAGS = -Wall -Wextra -Werror -I.

$(NAME): $(OBJ)
	# ar rcs creates/updates static library archive and writes object files into libft.a
	ar rcs $(NAME) $(OBJ)

all:	$(NAME)

obj/%.o: $(SRCDIR)/%.c
	@mkdir -p $(@D)
	@printf "$(BOLD)\rCompiling $(NAME): ["
	@printf "] "
	@$(CC) $(CFLAGS) -c -o $@ $<

clean:
	@echo "Cleaning up obj files..."
	rm -rf obj/

fclean: clean
	@echo "Cleaning up obj and archive files..."
	rm -rf $(NAME)
	
re:	fclean all

.PHONY:	all clean fclean re
