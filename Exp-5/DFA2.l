



%{
#include <stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN DEAD;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Rejected: Not Accepted\n");}

<A>a BEGIN A;
<A>b BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Rejected: Not Accepted\n");}

<B>a BEGIN A;
<B>b BEGIN DEAD;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Accepted\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Rejected: Invalid Input\n");}

%%

int yywrap()
{
    return 1;
}  

int main()
{
   printf("Enter String\n");
   yylex();
   return 0;
}

#include <stdio.h>
#include <stdbool.h>
bool dfa_accepts_ab(char *input) 
{
    int state = 0;  
    while (*input) 
    {
        switch (state) 
        {
           case 0:
                if (*input == 'a') 
                {
                    state = 1;  
                }
                else 
                {
                    state = 0; 
                }
                break;
            case 1:
                if (*input == 'b') 
                {
                    state = 2;  
                } 
                else 
                {
                    state = 0;
                }
                break;
            case 2:
                state = 0; 
                break;
            default:
                state = 0; 
                break;
        }
        input++;
    }
    return state == 2;
}
int main() 
{
    char input[100];
    printf("Enter a string: ");
    scanf("%s", input);
    if (dfa_accepts_ab(input)) 
    {
        printf("The string is accepted by the DFA (it is 'ab').\n");
    }
     else 
     {
        printf("The string is rejected by the DFA.\n");
    }
    return 0;

 } 
