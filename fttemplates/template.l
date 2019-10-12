/* Declarations */
DIG [0-9]
LETTER [a-zA-Z]
NUM {DIG}{DIG}*
ID {LETTER}+
%%

ID  {fprintf(yyout,"Found id: %s\n",yytext);}

%%
/* run with lex this-file.l and gcc lex.yy.c -ll -o some-output-filename*/

int main(void)
{
    printf("Starting lexer\n");
    yylex(); // run lexer
    return 0;
}
