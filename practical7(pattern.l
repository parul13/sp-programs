%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int count=0;
int i;
int j;
char *str=0;
%}

%%
[a-zA-Z]* {
	count=yyleng;
	if(str!=0) free(str);
	str=malloc(yyleng+1);
	strcpy(str,yytext);
	printf("\nPattern is:\n");
	
	for(i=count;i>=0;i--)
	{
		for(j=0;j<i;j++)
		{
			printf("%c",str[j]);
	    }
	printf("\n");
	}
}
. ;
%%
main()
{
	printf("\nEnter string");
	yylex();
	return 0;
}
yywrap()
{
	return 1;
	 }     
