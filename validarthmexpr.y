%{
    #include<stdlib.h>
    #include<stdio.h>
%}

%token DIGIT VAR NEWLINE

%left '-' '+'  
%left '*' '/' '%' 


%%

start: expr NEWLINE { printf("VALID");
                   exit(1);}
	;

expr:  expr '+' expr  { $$=$1+$3;}
  | expr '-' expr     { $$=$1-$3;}
  | expr '*' expr     { $$=$1*$3;}
  | expr '/'expr      { $$=$1/$3;} 
  | expr '%'expr      { $$=$1%$3;} 
  | '(' expr ')'      { $$=$2;}   
  |'-'expr            { $$=-$1;} 
  | DIGIT             { $$=$1;}
  | VAR               {$$=$1;}
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

