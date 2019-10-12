%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
%}
%union { // yyval can be a string or a integer, depending
    int integer;
}

%token <integer> NUM

%%

program:               {$$ = NULL;}
       | somethingElse {$$ = $1;}
;

somethingElse: NUM {$$ = $1;}
;

%%

int main(void) {
    return 0;
}
