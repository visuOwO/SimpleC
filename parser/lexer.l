%{
    #include <cstdio>
    #include <cstdlib>
    #include <string>
    #include <vector>
    #include "parser.hpp"
    #include "AST/AST.h"

    int symbol(char* name, int token) {
        printf("%s\n", name);
        return token;
    }
%}

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

"int"             { return symbol("int",         INT); }
"double"          { return symbol("double",      DOUBLE); }
"return"          { return symbol("return",      RETURN); }
"if"              { return symbol("if",          IF); }
"else"            { return symbol("else",        ELSE); }
"while"           { return symbol("while",       WHILE); }
"for"             { return symbol("for",         FOR); }

{IntLiteral}      { return symbol("Intconst", INTCONST, Integer.decode(yytext())); }
{DoubleLiteral}   { return symbol("Doubleconst", DOUBLECONST, Double.valueOf(yytext())); }

{Ident}           { return symbol("ID", IDENT, yytext()); }

";"               { return symbol(";",  SEMICOLON); }
"("               { return symbol("(",  LPAREN); }
")"               { return symbol(")",  RPAREN); }
"["               { return symbol("[",  LBRACK); }
"]"               { return symbol("]",  RBRACK); }
"{"               { return symbol("{",  LBRACE); }
"}"               { return symbol("}",  RBRACE); }


"="               { return symbol("=",  ASSIGN); }
"+"              { return symbol("+",  PLUS); }
"*"              { return symbol("*",  MUL); }
"-"              { return symbol("-",  MINUS); }
"/"              { return symbol("/",  DIV); }
"%"              { return symbol("%",  MOD); }
"+="              { return symbol("+=", PLUSASSIGN); }
"-="              { return symbol("-=", MINUSASSIGN); }
"*="              { return symbol("*=", MULASSIGN); }
"/="              { return symbol("/=", DIVASSIGN); }
"%="              { return symbol("%=", MODASSIGN); }


"<"             { return symbol("<",  LT); }
"<="            { return symbol("<=", LE); }
">"             { return symbol(">",  GT); }
">="            { return symbol(">=", GE); }
"=="            { return symbol("==", EQ); }
"!="            { return symbol("!=", NE); }


{comments}      { /* ignore comments */ }

{white_space}   { /* ignore white space */ }

%%