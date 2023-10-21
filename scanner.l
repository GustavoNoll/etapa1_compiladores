%{ 
    #include "tokens.h"
    int num_linhas = 1;


%}
%option noyywrap

%%

"int" {return TK_PR_INT;}
"float" {return TK_PR_FLOAT;}
"bool" {return TK_PR_BOOL;}
"if" {return TK_PR_IF;}
"else" {return TK_PR_ELSE;}
"while" {return TK_PR_WHILE;}
"return" {return TK_PR_RETURN;}

"<=" { return TK_OC_LE; }
">=" { return TK_OC_GE; }
"==" { return TK_OC_EQ; }
"!=" { return TK_OC_NE; }
"&" { return TK_OC_AND; }
"|"  { return TK_OC_OR; }

"-"  { return (int) '-'; }
"!"  { return (int) '!'; }
"*" { return (int) '*'; }
"/"  { return (int) '/'; }
"%"  { return (int) '%'; }
"+" { return (int) '+'; }
"<"  { return (int) '<'; }
">"  { return (int) '>'; }
"{" { return (int) '{'; }
"}" { return (int) '}'; }
"(" { return (int) '('; }
")" { return (int) ')'; }
"=" { return (int) '='; }
","  { return (int) ','; }
";"  { return (int) ';'; }

"/"{2,}(.)*\n {printf("Comentario de linha\n\n");}

true {return TK_LIT_TRUE;}
false {return TK_LIT_FALSE;}

([0-9]+"."[0-9]*)|([0-9]*\.[0-9]+) {return TK_LIT_FLOAT;}
[0-9]+ {return TK_LIT_INT;}

[a-z_][a-zA-z_0-9]* {return TK_IDENTIFICADOR;}

.* {return TK_ERRO;}
%%
