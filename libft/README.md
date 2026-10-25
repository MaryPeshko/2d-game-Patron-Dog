# libft (bonus included)

## About this project

This is my first project as a student of 42 Berlin school. It was completed during December 2023 and January 2024.

Libft is a custom C library that reimplements a set of standard _libc_ functions and adds extra utility functions for strings, memory, file descriptors, and linked lists.

The goal of the project is to understand how low-level C functions work internally and to build a reusable library for future 42 projects.

## What this project contains

- Reimplemented libc-style functions (for example: `ft_strlen`, `ft_memcpy`, `ft_strncmp`, `ft_atoi`, `ft_strdup`, `ft_calloc`)
- Additional utility functions (for example: `ft_substr`, `ft_strjoin`, `ft_strtrim`, `ft_split`, `ft_itoa`)
- File descriptor output helpers (`ft_putchar_fd`, `ft_putstr_fd`, `ft_putendl_fd`, `ft_putnbr_fd`)
- Bonus linked-list functions (`ft_lstnew`, `ft_lstadd_front`, `ft_lstadd_back`, `ft_lstclear`, `ft_lstmap`, ...)

Output artifact:

- `libft.a` (static library)

## Prerequisites

### Operating system

This library can be compiled on Linux and macOS.

### Required tools/packages

- A C compiler supporting C code used in 42 projects (`cc`, `gcc`, or `clang`)
- `make`
- `ar` (GNU binutils on Linux, or BSD ar on macOS)
- Standard C development headers/toolchain

## Build with Makefile

- `make` or `make all`: build `libft.a`
- `make clean`: remove object files
- `make fclean`: remove object files and `libft.a`
- `make re`: full rebuild (`fclean` + `all`)

## How to use it in another project as a custom library

One common 42 workflow is to add this repository as a `libft/` directory inside another project and call its Makefile from your main Makefile.

Example variables in your project Makefile:

```makefile
LIBFT = libft
LIB = $(LIBFT)/libft.a
```

Build libft from your project:

```makefile
$(LIB):
	@make -C $(LIBFT)
```

Link your project with libft:

```makefile
$(NAME): $(OBJ) $(LIB)
	$(CC) $(CFLAGS) $(OBJ) $(LIB) -o $(NAME)
```

(c) Maryna Peshko
