NAME=main
OBJFILES=$(NAME).cpp bubble_sort.cpp
CC=gcc
CFLAGS= -g -fsanitize=address -Wall -Wextra -Wno-unused-variable

$(NAME): $(OBJFILES)
	$(CC) $(CFLAGS) $(OBJFILES) -o $@ -pthread