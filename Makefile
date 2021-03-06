
      #########.
     ########",#:
   #########',##".
  ## ## ## .##',##.
   ## ## ## # ##",#.
    ## ## ## ## ##'
     ## ## ## :##
      ## ## ## #

NAME		:= libfts.a

SRC			:=	ft_bzero.s		\
				ft_strcat.s		\
				ft_isalpha.s	\
				ft_isdigit.s	\
				ft_isalnum.s	\
				ft_isascii.s	\
				ft_isprint.s	\
				ft_toupper.s	\
				ft_tolower.s	\
				ft_puts.s		\
				ft_strlen.s		\
				ft_memset.s		\
				ft_memcpy.s		\
				ft_strdup.s		\

SRC			:= $(addprefix src/, $(SRC))
OBJ			:= $(SRC:src/%.s=%.o)

# Colors
NO_COLOR	:= \x1b[0m
GREEN		:= \x1b[32;01m
RED			:= \x1b[31;01m
YELLOW		:= \x1b[33;01m
GRAY		:= \x1b[30;01m


.PHONY: all re clean fclean

all: $(NAME)

$(NAME): $(OBJ)
	@printf "$(GRAY)Creating $(RED)$(NAME) $(NO_COLOR)"
	@ar rcs $(NAME) $(OBJ)
	@if [ -a $(NAME) ] ; \
	then \
		printf "\e[31G$(GREEN)✓$(NO_COLOR)\n" ; \
	fi;

%.o: src/%.s
	@printf "$(GRAY)Compiling $(GREEN)$(<:src/%.s=%) $(NO_COLOR)"
	@nasm -f macho64 $< -o $@
	@if [ -a $(<) ] ; \
	then \
		printf "\e[31G$(GREEN)✓$(NO_COLOR)\n" ; \
	fi;

clean:
	@printf "$(GRAY)Removing objects$(NO_COLOR)"
	@rm -f $(OBJ)
	@printf "\e[31G$(GREEN)✓$(NO_COLOR)\n"

fclean: clean
	@printf "$(GRAY)Removing library$(NO_COLOR)"
	@rm -f $(NAME)
	@printf "\e[31G$(GREEN)✓$(NO_COLOR)\n"

re: fclean all
