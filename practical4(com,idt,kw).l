%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int kw=0;
int in=0;
int fl=0;
int idt=0;
int opr=0;
int slc=0;
int mlc=0;
%}
knostar [^*]*
pstar \*+
nostarfwdslash [^*/]



%%
\"([\\\"]|[^"])*\"  {;}
#.*  ;  {;}
"/*"{knostar}{pstar}({nostarfwdslash}{knostar}{pstar})*"/"  {mlc++;}
(\/\/.*)  {slc++;}

[0-9]+ {in++; printf("\nIntegers are :%s",yytext);}

[0-9]*\.[0-9]+ {fl++; printf("\nFloats are :%s",yytext);}

and|auto|bitand|bitor|bool|break|case|catch|char|class|const|continue|default|delete|do|double|else|enum|explicit|export  {kw++; printf("\nKeyword: %s",yytext);}
extern|false|float|for|friend|goto|if|int|long|mutable|namespace|new|not|operator|or|private|protected|public|return|short|signed  {kw++; printf("\nKeyword: %s",yytext);}
sizeof|static|struct|switch|template|this|thread_local|throw|true|try|union|unsigned|using|virtual|void|volatile|while|xor   {kw++; printf("\nKeyword: %s",yytext);}

[a-zA-Z_][a-zA-Z_0-9]* {idt++; printf("\nIdentifiers are :%s",yytext);}

"+"|"-"|"*"|"%"|"/"|"++"|"--"|"="|"=="|"!="|"<"|">"|"<="|">="|"<=>"|"!"|"&&"|"||"|"~"|"&"|"|"|"^"|"<<"|">>"|"+="|"-="|"*="|"%="|"/="|"&="|"|="|"^="|"<<="|">>=" { opr++; printf("\noperators are:%s",yytext);} 
[\n] {;}
. ;
%%
int main()
{
	yyin=fopen("input.cpp","r");
	yylex();
	printf("\nThe number of keywords are: %d",kw);
	printf("\nThe number of integers are: %d",in);
	printf("\nThe number of floats are: %d",fl);
	printf("\nThe number of identifiers are: %d",idt);
	printf("\nThe number of operators are: %d",opr);
	printf("\nThe number of multiline comments are: %d",mlc);
	printf("\nThe number of singleline comments are: %d",slc);
	return 0;
}
yywrap()
{
	return 1;
}
