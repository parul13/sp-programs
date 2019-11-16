%{
      #include<stdlib.h>
        #include<stdio.h>
%}

%token A B NEWLINE

%%

start: expr NEWLINE { printf("Accepted");
                      exit(1);}
	;

expr: A A A A A A A A A A E B                       
  ;
E: A E
  |
  ;  


%%

int yyerror(char const *s)
{
    printf("yyerror  %s\n",s);
    return 1;
}
int main()
{
  yyparse();
  return 1;
}

