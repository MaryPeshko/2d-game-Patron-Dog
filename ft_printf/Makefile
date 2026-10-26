NAME = libftprintf.a

SRCDIR = src
INCDIR = include
SRC =	$(addprefix $(SRCDIR)/, \
		ft_printf.c ft_numbers.c ft_words.c \
)
OBJ = $(SRC:$(SRCDIR)/%.c=obj/%.o)
CC	= cc
RM	= rm -rf
CFLAGS	= -Wall -Wextra -Werror -I$(INCDIR)

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

obj/%.o: $(SRCDIR)/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	@echo "Cleaning up obj files..."
	$(RM) obj/

fclean: clean
	@echo "Cleaning up obj and archive files..."
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
