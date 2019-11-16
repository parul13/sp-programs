%{
  #include "y.tab.h"
  #include<stdlib.h>
  #include<stdio.h>
%}



%%
[0-9]+ {
	yylval = atoi(yytext);
	return DIGIT;
  }
[a-z]+ {return VAR;}

[a-z0-9]+ {
return VAR;
}

"+"  return *yytext;
"-"  return *yytext;
"%"  return *yytext;
"*"  return *yytext;
"/"  return *yytext;
[\n]  return NEWLINE;

%%
int yywrap()
{
return 1;
}
	


