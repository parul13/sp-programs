%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int length=0;
char *str=0;
int flag=1;

%}

%%
[a-zA-Z]+ {
	 if(length<yyleng)
 	{
 		length =yyleng;
 		if(str!=0) free(str);
 		str = malloc(yyleng+1);
 		strcpy(str,yytext);
	 }
	 
}

[\n] {	
	if(flag) flag=0;
	else exit(0);
	printf("\n the length of maximum string is %d",length);
	printf("\n the string of maximum length is %s",str);
}

. { }
 
 
%%

int main()
{
	printf("enter string: \n");
	yylex();

	return 0;
}

int yywrap()
{
	return 1;
}

