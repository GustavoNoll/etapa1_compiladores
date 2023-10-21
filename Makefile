CC=gcc
FX=flex
CFLAGS=-I.

all: lex.yy.c
	$(CC) -o main main.c lex.yy.c functions.c

scan:
	$(FX) scanner.l

