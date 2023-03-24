%{
    #include <cstdio>
    #include <cstdlib>
    #include <string>
    #include <vector>
    #include "AST/AST.h"
    #include "parser.hpp"

    int symbol(std::string name, int token);
    int convertToInt(char* s);
    double convertToDouble(char* s);
%}

%option noyywrap

nonDigit  [a-zA-Z_]
digit  [0-9]
identifier_nonDigit  {nonDigit}
Ident   {identifier_nonDigit}({identifier_nonDigit}|{digit})*

hexadecimalPrefix  0[xX]
nonZeroDigit  [1-9]
octalDigit  [0-7]
hexadecimalDigit  [0-9]|[a-fA-F]
unsignedSuffix  [uU]
longSuffix  [lL]
longLongSuffix  ll|LL
integerSuffix  ({unsignedSuffix}|{longSuffix}|{longLongSuffix}|{unsignedSuffix}{longSuffix}|{unsignedSuffix}{longLongSuffix}|{longSuffix}{unsignedSuffix}|{longLongSuffix}{unsignedSuffix})

hexadecimalConstant  {hexadecimalPrefix}{hexadecimalDigit}+
octalConstant  (0{octalDigit}*)
decimalConstant  ({nonZeroDigit}{digit}*)
integerConstant  ({decimalConstant}|{octalConstant}|{hexadecimalConstant}|{decimalConstant}{integerSuffix}|{octalConstant}{integerSuffix}|{hexadecimalConstant}{integerSuffix})
IntLiteral   {integerConstant}

floatingSuffix  [fFlL]

digitSequence  {digit}+


exponentPart  ([eEpP]{sign}?{digitSequence})

sign  [+-]

decimalFloatingConstant  ({fractionalConstant}{exponentPart}?{floatingSuffix}?|{digitSequence}{exponentPart}{floatingSuffix}?)

hexadecimalFloatingConstant  ({hexadecimalPrefix}{hexadecimalFractionalConstant}{binaryExponentPart}{floatingSuffix}?|{hexadecimalPrefix}{hexadecimalDigitSequence}{binaryExponentPart}{floatingSuffix}?)

fractionalConstant  ({digitSequence}?\.{digitSequence}|{digitSequence}\.)

hexadecimalFractionalConstant  ({hexadecimalDigitSequence}?\.{hexadecimalDigitSequence}|{hexadecimalDigitSequence}\.)

binaryExponentPart  ([pP]{sign}?{digitSequence})

hexadecimalDigitSequence  {hexadecimalDigit}+

DoubleLiteral  {decimalFloatingConstant}|{hexadecimalFloatingConstant}

new_line  (\r|\n|\r\n)
white_space  ({new_line}|[ \t\f])

comments  \/\/({new_line}|[^])*|\/\*([^*]|\*+[^*/])*\*+\/


%%

"int"             { return INT; }
"double"          { return DOUBLE; }
"return"          { return RETURN; }
"if"              { return IF; }
"else"            { return ELSE; }
"while"           { return WHILE; }
"for"             { return FOR; }

{IntLiteral}      { yylval.intVal = convertToInt(yytext); return INTCONST; }
{DoubleLiteral}   { yylval.doubleVal = convertToDouble(yytext); return DOUBLECONST; }

{Ident}           { yylval.ident = new std::string(yytext); return IDENT; }

";"               { return SEMICOLON; }
"("               { return LPAREN; }
")"               { return RPAREN; }
"["               { return LBRACK; }
"]"               { return RBRACK; }
"{"               { return LBRACE; }
"}"               { return RBRACE; }


"="               { return ASSIGN; }
"+"              { return ADD; }
"*"              { return TIMES; }
"-"              { return MINUS; }
"/"              { return DIVIDE; }
"%"              { return MOD; }
"+="              { return ADDASSIGN; }
"-="              { return MINUSASSIGN; }
"*="              { return TIMESASSIGN; }
"/="              { return DIVIDEASSIGN; }
"%="              { return MODASSIGN; }


"<"             { return symbol("<",  LESS); }
"<="            { return symbol("<=", LESSEQUAL); }
">"             { return symbol(">",  GREATER); }
">="            { return symbol(">=", GREATEREQUAL); }
"=="            { return symbol("==", EQUAL); }
"!="            { return symbol("!=", NOTEQUAL); }


{comments}      { /* ignore comments */ }

{white_space}   { /* ignore white space */ }

%%

int symbol(std::string name, int token) {
    std::cout << name << std::endl;
    return token;
}

int convertToInt(char* s) {
    std::string str(s);
    return std::stoi(str);
}

double convertToDouble(char* s) {
    std::string str(s);
    return std::stod(str);
}
