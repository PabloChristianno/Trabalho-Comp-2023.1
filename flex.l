%{
#include <iostream>
using std::cout;
int count = 0;
%}

delim [ \t\n]
brancos {delim}+
digito [0-9]
dataBissexto ((0[1-9]|[12]{digito})\/(02)\/(19(04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)|20(00|04|08|12|16|20)))
data (((0[1-9]|[12]{digito}|3[01])\/(01|03|05|07|08|10|12)\/(19{digito}{digito}|20([01]{digito}|[2][0123])))|((0[1-9]|[12]{digito}|30)\/(04|06|09|11)\/(19{digito}{digito}|20([01]{digito}|[2][0123])))|((0[1-9]|1{digito}|2[0-8])\/(02)\/(19{digito}{digito}|20([01]{digito}|2[0123]))))

/* read only one input file */
%option noyywrap 

%%

{brancos}   ;
{dataBissexto} {count++; }
{data} {count++; }
.   ;

%%

int main()
{
    yyFlexLexer lexer;
    lexer.yylex();
    printf("%d\n", count);
}
