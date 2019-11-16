%{

#include<stdio.h>

%}

%%
[a-z] {
 		char string=yytext[0];
		printf("%c",97+(string-97+3)%26);
	  }
[A-Z] {
		char string=yytext[0];
		printf("%c",65+(string-65+3)%26);
      }
%%

int main()
   {
	   printf("Enter your string\n");
	   yylex();
	   return 0;
   }
yywrap()
{
	return 1;
	
}

