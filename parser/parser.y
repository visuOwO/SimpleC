%{
	#include "AST/Program.h"
	#include "AST/Expr.h"
	#include <cstdio>
	#include <cstdlib>
	#include <string>
	#include <iostream>
	#include <vector>

	int yyerror(char *s);
	int yylex();
%}

%union {
	Program *program;
	std::vector<Decl> *declList;
	Decl *decl;
	std::vector<Stmt> *stmtList;
	Stmt *stmt;
	Expr *expr, *l_expr, *identExpr, *binaryExpr;
	std::vector<int> *arrayDecl;
	std::vector<Expr> *arrayDim;
	std::string *ident;
	int intconst;
	double doubleconst;
}

%token INT DOUBLE RETURN IF ELSE WHILE FOR
%token PLUS MINUS MUL DIV MOD ASSIGN
%token PLUSASSIGN MINUSASSIGN MULASSIGN DIVASSIGN MODASSIGN
%token LT GT LE GE EQ NE
%token LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK SEMICOLON
%token <intconst> INTCONST
%token <doubleconst> DOUBLECONST
%token <ident> IDENT

%type <program> program
%type <decl> decl
%type <declList> declList
%type <stmt> stmt ifStmt forStmt whileStmt
%type <stmtList> stmtList
%type <expr> expr l_expr binaryExpr
%type <arrayDecl> arrayDecl
%type <arrayDim> arrayDim


%right ASSIGN PLUSASSIGN MINUSASSIGN MULASSIGN DIVASSIGN MODASSIGN
%left EQ NE
%left LT GT LE GE
%left PLUS MINUS
%left MUL DIV MOD
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
declList : /* empty list */ { $$ = new LinkedList<Decl>(); }
           | decl declList {
           		$2.add(0, $1);
           		$$ = $2;
           }
;
decl : INT IDENT arrayDecl SEMICOLON { $$ = new Decl($2, Types::INT, $3); }
       | DOUBLE IDENT arrayDecl SEMICOLON { $$ = new Decl($2, Types::DOUBLE, $3);}
;
arrayDecl : /* empty list */ { $$ = new LinkedList<Integer>(); }
            | LBRACK INTCONST RBRACK arrayDecl { $4.add(0, $2); $$ = $4; }
;
stmtList : /* empty list */ { $$ = new LinkedList<Stmt>(); }
           | stmt stmtList  { $2.add(0,$1); $$ = $2; }
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
         { $$ = new IfStmt($3, $5, null); }
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
arrayDim : LBRACK expr RBRACK { $$ = new LinkedList<Expr>(); $$.add(0, $2); }
           | LBRACK expr RBRACK arrayDim { $4.add(0, $2); $$ = $4; }
;


binaryExpr : expr PLUS expr { $$ = new BinaryExpr($1, BinaryExpr.PLUS, $3); }
             | expr MUL expr { $$ = new BinaryExpr($1, BinaryExpr.MUL, $3); }
             | expr ASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr.ASSIGN, $3); }
             | expr MINUS expr  { $$ = new BinaryExpr($1, BinaryExpr.MINUS, $3); }
             | expr DIV expr  { $$ = new BinaryExpr($1, BinaryExpr.DIV, $3); }
             | expr MOD expr { $$ = new BinaryExpr($1, BinaryExpr.MOD, $3); }
             | expr PLUSASSIGN expr  { $$ = new BinaryExpr($1, BinaryExpr.PLUSASSIGN, $3); }
             | expr MINUSASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr.MINUSASSIGN, $3); }
             | expr MULASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr.MULASSIGN, $3); }
             | expr DIVASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr.DIVASSIGN, $3); }
             | expr MODASSIGN expr { $$ = new BinaryExpr($1, BinaryExpr.MODASSIGN, $3); }
		     | expr LT expr { $$ = new BinaryExpr($1, BinaryExpr.LT, $3); }
                | expr GT expr { $$ = new BinaryExpr($1, BinaryExpr.GT, $3); }
                | expr LE expr { $$ = new BinaryExpr($1, BinaryExpr.LE, $3); }
                | expr GE expr { $$ = new BinaryExpr($1, BinaryExpr.GE, $3); }
                | expr EQ expr { $$ = new BinaryExpr($1, BinaryExpr.EQ, $3); }
                | expr NE expr { $$ = new BinaryExpr($1, BinaryExpr.NE, $3); }
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




