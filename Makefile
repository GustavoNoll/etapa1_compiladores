# Makefile para compilar o analisador léxico

# Compilador a ser usado
CC = gcc

# Opções de compilação
CFLAGS = -Wall -Wextra

# Nome do executável
EXECUTABLE = etapa1

# Listagem de arquivos fonte
SOURCES = scanner.l main.c functions.c

# Objetos gerados
OBJECTS = lex.yy.c main.o functions.o

# Alvo padrão
all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(EXECUTABLE) $(OBJECTS)

lex.yy.c: scanner.l
	flex scanner.l

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

clean:
	rm -f $(OBJECTS) $(EXECUTABLE) lex.yy.c
