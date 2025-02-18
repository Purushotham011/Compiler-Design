%{
#include<stdio.h>
int state = 0;
%}

%%
a {
	if (state == 1)
		state = 2;
	else if (state == 2)
		state = 2;
	else if (state == 3)
		state = 2;
}

b {
	if (state == 1)
		state = 2;
	else if (state == 2)
		state = 3;
	else if (state == 3)
		state = 3;
}

[\t\n] {/* Ignore whitespace*/}

. {
	printf("Invalid Character\n");
	state = -1;
}
%%

int main(){
    printf("Enter a string: ");
    yylex();
    if(state==2){
        printf("The String ends with 'ab'.\n");
    }
    else{
        printf("he String does not end with 'ab'.\n");
    }
    return 0;
}

int yywrap(){
    return 1;
}
