%{
#include<stdio.h>
int num_chars=0;
int num_lines=0;
int num_words=0;
int num_space=0;
%}

%%
[\t] {num_chars++; num_space++;}
[\n] {num_lines++; num_chars++;}
[a-zA-Z]+ {num_words++;num_chars+=yyleng;}
. {num_chars++;}
%%

int main() {
	yyin=fopen("prog6.txt","r");
	yylex();
	printf("\nnumber of charcters are %d \nnumber of lines are %d \nnumber of words are %d \nnumber of space are %d",num_chars,num_lines,num_words,num_space);
	return 0;
   }
yywrap() 
 {
 	return 1;
 }  
