%{

#include<stdio.h>
int num_lines=0;
int num_chars=0;

%}

%%

[\t]  {num_chars++;}
[\n]  {num_lines++; num_chars++;}
[a-zA-Z]+  {num_chars+=yyleng;}
. {num_chars++;}

%%

int main()
{
	yyin=fopen("test.txt","r");
	yylex();
	printf("\nThere are %d number of lines \nThere are %d number of characters,",num_lines,num_chars);
    
	return 0;
}

int yywrap()
{

	return 1;
	
}

