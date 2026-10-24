# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpeshko <mpeshko@student.42berlin.de>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/27 15:32:51 by mpeshko           #+#    #+#              #
#    Updated: 2026/10/24 19:20:12 by mpeshko          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = 		so_long

SRC	 = 		src/so_long.c \
			src/map_check.c \
			src/map_check2.c \
			src/minilibx.c \
			src/img_tools.c \
			src/print_error.c \
			src/validate_path.c \
			src/utils.c \
			src/map.c \
			src/ft_init_values.c \
			src/hook.c \
			src/hook_door.c
OBJ =		$(SRC:src/%.c=obj/%.o)
HDRS = 		src/so_long.h

LIBFT = 	libft
LIB = 		$(LIBFT)/libft.a
GNL := 		get_next_line/*c
PRINTF = 	ft_printf/libftprintf.a

MLX_PATH = 	mlx/
MLX_REPO = 	https://github.com/42Paris/minilibx-linux.git
MLX_LIB_A = 	$(MLX_PATH)libmlx.a
MLX_LIB_UNAME = $(MLX_PATH)libmlx_$(shell uname).a
MLX_LIBS = 	$(MLX_LIB_A) $(MLX_LIB_UNAME)
MLX_FLAGS = -Lmlx -lmlx -L/usr/lib/X11 -lXext -lX11

CC =		cc
CFLAGS = 	-Wall -Wextra -Werror

all: $(NAME)
	@echo "\033[32mSUCCESS!\033[0m"

deps:
	sudo apt-get update
	sudo apt-get install -y gcc make git xorg libxext-dev libbsd-dev

# If mlx exists, try to build it locally.
# If it is missing, clone it first.
# If the build artifacts are still missing after that, stop with a clear error.
$(MLX_LIB_A) $(MLX_LIB_UNAME):
	@if [ -d "$(MLX_PATH)" ] && [ -f "$(MLX_PATH)configure" ]; then \
		$(MAKE) -C "$(MLX_PATH)" do_configure; \
	elif [ ! -d "$(MLX_PATH)" ]; then \
		git clone "$(MLX_REPO)" "$(MLX_PATH)"; \
		$(MAKE) -C "$(MLX_PATH)" do_configure; \
	else \
		echo "MiniLibX is present but incomplete. Please run 'make -C mlx clean' or remove the folder and retry."; \
		exit 1; \
	fi

$(NAME): $(OBJ) $(MLX_LIBS)
	@make -C $(LIBFT)
	@make -C ft_printf/
	$(CC) -g $(CFLAGS) $(OBJ) $(LIB) $(GNL) $(PRINTF) $(MLX_FLAGS) -o $(NAME)

obj/%.o: src/%.c $(HDRS)
	@mkdir -p $(@D)
	@printf "$(BOLD)\rCompiling $(NAME): ["
	@printf "] "
	@$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf obj/
	rm -rf $(LIBFT)/*.o
	rm -rf ft_printf/sources/*.o
	rm -rf $(MLX_PATH)obj

fclean: clean
	rm -f $(NAME)
	rm -f $(LIBFT)/libft.a
	rm -f ft_printf/libftprintf.a
	rm -f $(MLX_LIB_A) $(MLX_LIB_UNAME)

re: fclean all

.PHONY: all clean fclean re deps