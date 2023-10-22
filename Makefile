CC=gcc
FX=flex
CFLAGS=-I.

all: lex.yy.c
	$(FX) scanner.l
	$(CC) -o main main.c lex.yy.c functions.c