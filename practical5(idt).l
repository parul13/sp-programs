%{
	#include<stdio.h>
	int idt=0;
%}

knostar [^*]*
pstar \*+
nostarfwdslash [^*/]

%%
\"([\\\"]|[^"])*\"  {;}
"/*"{knostar}{pstar}({nostarfwdslash}{knostar}{pstar})*"/"  {;}
(\/\/.*)  {;}
and|auto|bitand|bitor|bool|break|case|catch|char|class|const|constexpr|const_cast  ;
continue|default|delete|do|double|else|enum|explicit|export  ;
extern|false|float|for|friend|goto|if|int|long|mutable|namespace|new|noexcept|not|nullptr  ;
operator|or|private|protected|public|register|requires|return|short|signed  ;
sizeof|static|static_cast|struct|switch|template|this|thread_local|throw|true|try  ;
typedef|typeid|typename|union|unsigned|using|virtual|void|volatile|while|xor   ;
[a-zA-Z_][a-zA-Z_0-9]*  {idt++; printf(yytext); printf("\n");}
. {;}
\n {;}
%%

int main()
{
	yyin=fopen("prog5.txt", "r");
	yylex();
	printf("There are %d number of identifiers.", idt);
	return 0;
}

int yywrap()
{
	return 1;
}



