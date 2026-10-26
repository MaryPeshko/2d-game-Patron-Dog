# ft_printf: Reimplementation of printf in C

A custom implementation of the C `printf` function, built as a static library.

This project demonstrates variadic functions, format parsing, low-level output handling, and clean Makefile-based builds.

Completed at 42 Berlin (Jan-Feb 2024) as part of the core C curriculum.

## Supported conversions

This implementation supports the following conversion specifiers:

- `%c`: character
- `%s`: string
- `%p`: pointer address (`0x...`, or `(nil)` for null)
- `%d`: signed decimal integer
- `%i`: signed decimal integer
- `%u`: unsigned decimal integer
- `%x`: hexadecimal (lowercase)
- `%X`: hexadecimal (uppercase)
- `%%`: a literal percent sign

## What this project contains

Output artifact:

- `libftprintf.a` (static library)

## Build with Makefile

- `make` or `make all`: build `libftprintf.a`
- `make clean`: remove object files
- `make fclean`: remove object files and `libftprintf.a`
- `make re`: full rebuild (`fclean` + `all`)

## Prerequisites

### Operating system

This library can be compiled on Linux and macOS.

### Required tools/packages

- A C compiler supporting C code used in 42 projects (`cc`, `gcc`, or `clang`)
- `make`
- `ar` (GNU binutils on Linux, or BSD ar on macOS)
- Standard C development headers/toolchain

## How to use it in another project as a custom library

One common 42 workflow is to add this repository as a `ft_printf/` directory inside another project and call its Makefile from your main Makefile.

Example variables in your project Makefile:

```makefile
FT_PRINTF = ft_printf
LIB_PRINTF = $(FT_PRINTF)/libftprintf.a
```

Build ft_printf from your project:

```makefile
$(LIB_PRINTF):
	@make -C $(FT_PRINTF)
```

Link your project with ft_printf:

```makefile
$(NAME): $(OBJ) $(LIB_PRINTF)
	$(CC) $(CFLAGS) $(OBJ) $(LIB_PRINTF) -o $(NAME)
```

(c) Maryna Peshko
