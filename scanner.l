%{ 
    #include "tokens.h"


%}

%option noyywrap

%%
oi printf("voce\n");

int {return TK_PR_INT;}
float {return TK_PR_FLOAT;}
bool {return TK_PR_BOOL;}
if {return TK_PR_IF;}
else {return TK_PR_ELSE;}
while {return TK_PR_WHILE;}
return {return TK_PR_RETURN;}

[a-z_][a-zA-z_0-9]* {return TK_IDENTIFICADOR;}
.* {return TK_ERRO;}
%%