%{
	#include "AST/AST.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <ctype.h>

	int yyerror(char *s);
	int yylex();
%}

%union {
	Program *program;
	LinkedList<Decl> *declList;
	Decl *decl;
	LinkedList<Stmt> *stmtList;
	Stmt *stmt;
	LinkedList<Expr> *exprList;
	Expr *expr;
	LinkedList<Integer> *arrayDecl;
	LinkedList<Expr> *arrayDim;
	BinaryExpr *binaryExpr;
	ForStmt *forStmt;
	WhileStmt *whileStmt;
	LExpr *l_expr;
}

%token INT DOUBLE RETURN IF ELSE WHILE FOR
%token PLUS MINUS MUL DIV MOD ASSIGN
%token PLUSASSIGN MINUSASSIGN MULASSIGN DIVASSIGN MODASSIGN
%token LT GT LE GE EQ NE
%token INTCONST DOUBLECONST
%token LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK SEMICOLON

%type <program> program
%type <decl> declList decl
%type <stmt> stmtList stmt
%type <expr> expr l_expr arrayDim binaryExpr
%type <ident> IDENT

%%

program : INT IDENT LPAREN RPAREN LBRACE declList stmtList RBRACE
            {
            	$$ = new Program($2, Types.INT, $6, $7);
            }
          | DOUBLE IDENT LPAREN RPAREN LBRACE declList stmtList RBRACE
	    	{
	    		$$ = new Program($2, Types.DOUBLE, $6, $7);
	    	}
;
declList : /* empty list */ { $$ = new LinkedList<Decl>(); }
           | decl declList {
           		$2.add(0, $1);
           		$$ = $2;
           }
;
decl : INT IDENT arrayDecl SEMICOLON { $$ = new Decl($2, Types.INT, $3); }
       | DOUBLE IDENT arrayDecl SEMICOLON { $$ = new Decl($2, Types.DOUBLE, $3);}
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
       | IF LPAREN expr RPAREN stmt
         { $$ = new IfStmt($3, $5, null); }
       | IF LPAREN expr RPAREN stmt ELSE stmt
         { $$ = new IfStmt($3, $5, $7); }
       | SEMICOLON { $$ = new EmptyStmt(); }
       | forStmt { $$ = $1; }
         | whileStmt { $$ = $1; }
;
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



