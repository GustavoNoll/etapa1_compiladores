#include <stdio.h>


// Variável estática para rastrear o número da linha
static int line_number = 1;

// Implementação da função para obter o número da linha
int get_line_number(void) {
    return line_number;
}

// Função para incrementar o número da linha
void increment_line_number(void) {
    line_number++;
}