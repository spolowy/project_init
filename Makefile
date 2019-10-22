
############################## BIN #############################################

NAME = __PROJECT_NAME__

SRC = __PROJECT_NAME__.c

CC = clang

SRCDIR = src

OBJDIR = objs

OBJ = $(addprefix ${OBJDIR}/, $(SRC:.c=.o))

DEP = $(addprefix ${OBJDIR}/, $(SRC:.c=.d))

CFLAGS = -Wall -Wextra -Werror -fsanitize=address,undefined -g -MMD

LDFLAGS = -Ilibft/include/ -Iinclude/

LIB = -Llibft/ -lft

EXT = libft/libft.a

############################## COLORS ##########################################

BY = "\033[33;1m"
BR = "\033[31;1m"
BG = "\033[32;1m"
BB = "\033[34;1m"
BM = "\033[35;1m"
BC = "\033[36;1m"
Y = "\033[33m"
R = "\033[31m"
G = "\033[32m"
B = "\033[34m"
M = "\033[35m"
C = "\033[36m"
WT = "\033[37;1m"
W = "\033[0m""\033[32;1m"
WR = "\033[0m""\033[31;5m"
WY = "\033[0m""\033[33;5m"
X = "\033[0m"
UP = "\033[A"
CUT = "\033[K"

############################## RULES ###########################################

all: art ${NAME}

libft/%:
	@[[ -d libft ]] || (echo ${M}Cloning"   "[libft]...${X} && git clone https://github.com/spolowy/libft &>/dev/null)
	@make -C libft

${NAME}: ${OBJ}
	@echo ${B}Compiling [${NAME}]...${X}
	@${CC} ${CFLAGS} ${LDFLAGS} ${LIB} -o $@ ${OBJ}
	@echo ${G}Success"   "[${NAME}]${X}

${OBJDIR}/%.o: ${SRCDIR}/%.c ${EXT}
	@echo ${Y}Compiling [$@]...${X}
	@/bin/mkdir -p ${OBJDIR}
	@${CC} ${CFLAGS} ${LDFLAGS} -c -o $@ $<
	@printf ${UP}${CUT}

############################## GENERAL #########################################

clean:
	@echo ${R}Cleaning"  "[libft objs]...${X}
	@make -C libft/ clean
	@echo ${R}Cleaning"  "[objs]...${X}
	@/bin/rm -Rf ${OBJDIR}

fclean: clean
	@make -C libft/ fclean
	@echo ${R}Cleaning"  "[${NAME}]...${X}
	@/bin/rm -f ${NAME}
	@/bin/rm -Rf ${NAME}.dSYM

test: libft/libft.a
	@${CC} -g ${LDFLAGS} -fsanitize=address,undefined ${LIB} \
	-I. -o ${NAME} $(addprefix src/, ${SRC})

re: fclean all

############################## DECORATION ######################################

art:
	@echo ${WY}
	@echo "__INSERT_ASCII_ART__"
	@echo ${X}

.PHONY: all clean fclean re art

-include ${DEP}
