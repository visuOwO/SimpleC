%{
	#include "AST/AST.h"
	#include <cstdio>
	#include <cstdlib>
	#include <string>
	#include <iostream>
	#include <vector>

	int yyerror(char *s);
	extern int yylex();
	int yywrap() { return 1; }
%}

%union {
	Program *program;
	std::vector<ASTNode*> *declList, *stmtList, *arrayDim;
	Decl *decl;
	Stmt *stmt;
	Expr *expr, *l_expr, *identExpr, *binaryExpr;
	std::vector<int> *arrayDecl;
	std::string *ident;
	int intVal;
	double doubleVal;
}

%token INT DOUBLE RETURN IF ELSE WHILE FOR
%token ADD MINUS TIMES DIVIDE MOD ASSIGN
%token ADDASSIGN MINUSASSIGN TIMESASSIGN DIVIDEASSIGN MODASSIGN
%token LESSEQUAL GREATER LESS GREATEREQUAL EQUAL NOTEQUAL
%token LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK SEMICOLON
%token <intVal> INTCONST
%token <doubleVal> DOUBLECONST
%token <ident> IDENT

%type <program> program
%type <decl> decl
%type <declList> declList
%type <stmt> stmt ifStmt forStmt whileStmt
%type <stmtList> stmtList
%type <expr> expr l_expr binaryExpr
%type <arrayDecl> arrayDecl
%type <arrayDim> arrayDim


%right ASSIGN ADDASSIGN MINUSASSIGN TIMESASSIGN DIVIDEASSIGN MODASSIGN
%left EQUAL NOTEQUAL
%left LESSEQUAL GREATER LESS GREATEREQUAL
%left ADD MINUS
%left TIMES DIVIDE MOD
%left ELSE

%%

program : INT IDENT LPAREN RPAREN LBRACE declList stmtList RBRACE
            {
            	$$ = new Program($2, Types::INT, $6, $7);
            }
          | DOUBLE IDENT LPAREN RPAREN LBRACE declList stmtList RBRACE
	    	{
	    		$$ = new Program($2, Types::DOUBLE, $6, $7);
	    	}
;
declList : /* empty list */ { $$ = new std::vector<ASTNode*>(); }
           | decl declList {
           		$2->push_back($1);
           		$$ = $2;
           }
;
decl : INT IDENT arrayDecl SEMICOLON { $$ = new Decl($2, Types::INT, $3); }
       | DOUBLE IDENT arrayDecl SEMICOLON { $$ = new Decl($2, Types::DOUBLE, $3);}
;
arrayDecl : /* empty list */ { $$ = new std::vector<int>(); }
            | LBRACK INTCONST RBRACK arrayDecl { $4->push_back($2); $$ = $4; }
;
stmtList : /* empty list */ { $$ = new std::vector<ASTNode*>(); }
           | stmt stmtList  { $2->push_back($1); $$ = $2; }
;
stmt : expr SEMICOLON { $$ = new ExprStmt($1); }
       | RETURN expr SEMICOLON { $$ = new ReturnStmt($2); }
       | LBRACE stmtList RBRACE { $$ = new BlockStmt($2); }
       | ifStmt { $$ = $1; }
       | SEMICOLON { $$ = new EmptyStmt(); }
       | forStmt { $$ = $1; }
         | whileStmt { $$ = $1; }
;

ifStmt : IF LPAREN expr RPAREN stmt
         { $$ = new IfStmt($3, $5, nullptr); }
       | IF LPAREN expr RPAREN stmt ELSE stmt
         { $$ = new IfStmt($3, $5, $7); }

expr : INTCONST { $$ = new IntConstExpr($1); }
       | DOUBLECONST { $$ = new DoubleConstExpr($1); }
       | l_expr { $$ = $1; }
       | LPAREN expr RPAREN { $$ = $2; }
       | binaryExpr { $$ = $1; }
;

l_expr : IDENT { $$ = new IdentExpr($1); }
         | IDENT arrayDim { $$ = new ArrayExpr($1, $2); }
;
arrayDim : LBRACK expr RBRACK { $$ = new std::vector<ASTNode*>(); $$->push_back($2); }
           | LBRACK expr RBRACK arrayDim { $4->push_back($2); $$ = $4; }
;


binaryExpr : expr ADD expr { $$ = new BinaryExpr($1, BinaryExpr::ADD, $3); }
             | expr TIMES expr { $$ = new BinaryExpr($1, BinaryExpr::TIMES, $3); }
             | expr ASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr::ASSIGN, $3); }
             | expr MINUS expr  { $$ = new BinaryExpr($1, BinaryExpr::MINUS, $3); }
             | expr DIVIDE expr  { $$ = new BinaryExpr($1, BinaryExpr::DIVIDE, $3); }
             | expr MOD expr { $$ = new BinaryExpr($1, BinaryExpr::MOD, $3); }
             | expr ADDASSIGN expr  { $$ = new BinaryExpr($1, BinaryExpr::ADDASSIGN, $3); }
             | expr MINUSASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr::MINUSASSIGN, $3); }
             | expr TIMESASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr::TIMESASSIGN, $3); }
             | expr DIVIDEASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr::DIVIDEASSIGN, $3); }
             | expr MODASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr::MODASSIGN, $3); }
		     | expr LESSEQUAL expr { $$ = new BinaryExpr($1, BinaryExpr::LESSEQUAL, $3); }
                | expr GREATER expr { $$ = new BinaryExpr($1, BinaryExpr::GREATER, $3); }
                | expr LESS expr { $$ = new BinaryExpr($1, BinaryExpr::LESS, $3); }
                | expr GREATEREQUAL expr { $$ = new BinaryExpr($1, BinaryExpr::GREATEREQUAL, $3); }
                | expr EQUAL expr { $$ = new BinaryExpr($1, BinaryExpr::EQUAL, $3); }
                | expr NOTEQUAL expr { $$ = new BinaryExpr($1, BinaryExpr::NOTEQUAL, $3); }
;

whileStmt : WHILE LPAREN expr RPAREN stmt
	   { $$ = new WhileStmt($3, $5); }
;
forStmt : FOR LPAREN expr SEMICOLON expr SEMICOLON expr RPAREN stmt
		{ $$ = new ForStmt($3, $5, $7, $9); }
;

%%

int yyerror(char *s) {
    printf("Error: %s", s);
    return 0;
}

int main(int argc, char **argv) {
    yyparse();
    return 0;
}
