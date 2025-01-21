%{
#include <stdio.h>
int token_count = 0; // Counter for the number of tokens
%}
%%
[0-9]+[.][0-9]+ {printf("%s is a floating number\n",yytext);
token_count++;}
int|float|char|double|void {printf("%s is a datatype\n",yytext);
token_count++;}
[0-9]+ {printf("%s is an integer number\n",yytext);
token_count++;}
[a-z]+[()] {printf("%s is a function\n",yytext);
token_count++;}
[a-z]+ {printf("%s is an identifier\n",yytext);
token_count++;}
[+=*/-] {printf("%s is an operator\n",yytext);
token_count++;}
, {printf("%s is a spearator\n",yytext);
token_count++;}
; {printf("%s is a delimeter\n",yytext);
token_count++;}

[#][a-z\.h]+ {printf("%s is a preprocessor\n",yytext);
token_count++;}
%%

int yywrap(void)
{
	return 1;
}

int main()
{
	//reads input from a file named test.c rather than terminal
	freopen("test.c","r",stdin);
		yylex();
		printf("\nTotal number of tokens: %d\n", token_count); // Print the total count
		return 0;
}
