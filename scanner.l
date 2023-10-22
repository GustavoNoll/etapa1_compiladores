%{ 
    #include "tokens.h"
    int profundidade_do_comentario = 0;
    int numero_de_linhas = 0;


%}

%option noyywrap
%x comentario

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
"/*" {profundidade_do_comentario += 1; BEGIN(comentario);}
<comentario>"/*" {profundidade_do_comentario += 1;}
<comentario>"*/" {profundidade_do_comentario -= 1;  
    if(profundidade_do_comentario == 0) {
        BEGIN(INITIAL);
    }
}
<comentario>\n {numero_de_linhas += 1;}
<comentario>. {}

true {return TK_LIT_TRUE;}
false {return TK_LIT_FALSE;}

([0-9]+"."[0-9]*)|([0-9]*\.[0-9]+) {return TK_LIT_FLOAT;}
[0-9]+ {return TK_LIT_INT;}

[a-z_][a-zA-z_0-9]* {return TK_IDENTIFICADOR;}

.* {return TK_ERRO;}
%%
