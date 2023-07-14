/*
Pablo Christianno Silva Guedes      200042416
*/

%{
#include <stdio.h>
int count = 0;
%}

delim [ \t\n]
brancos {delim}+
dataBissexto ((0[1-9]|[12][0-9])\/(02)\/(19(04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)|20(00|04|08|12|16|20)))
data (((0[1-9]|[12][0-9]|3[01])\/(01|03|05|07|08|10|12)\/(19[0-9]|20([01][0-9]|[2][0123])))|((0[1-9]|[12][0-9]|30)\/(04|06|09|11)\/(19[0-9]|20([01][0-9]|[2][0123])))|((0[1-9]|1[0-9]|2[0-8])\/(02)\/(19[0-9]|20([01][0-9]|2[0123]))))

/* read only one input file */
%option noyywrap 

%%

{brancos}   ;
{dataBissexto} {count++; printf("Cadeia reconhecida: %s\n", yytext); }
{data} {count++; printf("Cadeia reconhecida: %s\n", yytext);}
.   ;

%%

int main()
{
    yylex();
    printf("%d\n", count);
}

