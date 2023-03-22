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
	ASTNode *node;
	int op;
}

%type <node> program declList decl stmtList stmt expr l_expr arrayDim binaryExpr whileStmt forStmt

%right
%left


%%

program : INT IDENT:i LPAREN RPAREN LBRACE declList:dl stmtList:sl RBRACE
            {: RESULT = new Program(i, Types.INT, dl, sl); :}
          | DOUBLE IDENT:i LPAREN RPAREN LBRACE declList:dl stmtList:sl RBRACE
	    {: RESULT = new Program(i, Types.DOUBLE, dl, sl); :}
;
declList : /* empty list */ {: RESULT = new LinkedList<Decl>(); :}
           | decl:d declList:l {: l.add(0,d); RESULT = l; :}
;
decl : INT IDENT:i arrayDecl:a SEMICOLON {: RESULT = new Decl(i, Types.INT, a); :}
       | DOUBLE IDENT:i arrayDecl:a SEMICOLON {: RESULT = new Decl(i, Types. DOUBLE, a); :}
;
arrayDecl : /* empty list */ {: RESULT = new LinkedList<Integer>(); :}
            | LBRACK INTCONST:ic RBRACK arrayDecl:a {: a.add(0,ic); RESULT = a; :}
;
stmtList : /* empty list */ {: RESULT = new LinkedList<Stmt>(); :}
           | stmt:s stmtList:l  {: l.add(0,s); RESULT = l; :}
;
stmt : expr:e SEMICOLON {: RESULT = new ExprStmt(e); :}
       | RETURN expr:e SEMICOLON {: RESULT = new ReturnStmt(e); :}
       | LBRACE stmtList:l RBRACE {: RESULT = new BlockStmt(l); :}
       | IF LPAREN expr:e RPAREN stmt:s
         {: RESULT = new IfStmt(e, s); :}
       | IF LPAREN expr:e RPAREN stmt:s1 ELSE stmt:s2
         {: RESULT = new IfStmt(e, s1, s2); :}
       | SEMICOLON {: RESULT = new EmptyStmt(); :}
       | forStmt:f {: RESULT = f; :}
         | whileStmt:w {: RESULT = w; :}
;
expr : INTCONST:ic {: RESULT = new IntConstExpr(ic); :}
       | DOUBLECONST:dc {: RESULT = new DoubleConstExpr(dc); :}
       | l_expr:e {: RESULT = e; :}
       | LPAREN expr:e RPAREN {: RESULT = e; :}
       | binaryExpr:e {: RESULT = e; :}
;

l_expr : IDENT:i {: RESULT = new IdentExpr(i); :}
         | IDENT:i arrayDim:a {: RESULT = new ArrayExpr(i, a); :}
;
arrayDim : LBRACK expr:e RBRACK {: RESULT = new LinkedList<Expr>(); RESULT.add(e); :}
           | LBRACK expr:e RBRACK arrayDim:a {: a.add(0,e); RESULT = a; :}
;


binaryExpr : expr:e1 PLUS expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.PLUS, e2); :}
             | expr:e1 MUL expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.MUL, e2); :}
             | expr:e1 ASSIGN expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.ASSIGN, e2); :}
             | expr:e1 MINUS expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.MINUS, e2); :}
             | expr:e1 DIV expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.DIV, e2); :}
             | expr:e1 MOD expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.MOD, e2); :}
             | expr:e1 PLUSASSIGN expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.PLUSASSIGN, e2); :}
             | expr:e1 MINUSASSIGN expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.MINUSASSIGN, e2); :}
             | expr:e1 MULASSIGN expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.MULASSIGN, e2); :}
             | expr:e1 DIVASSIGN expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.DIVASSIGN, e2); :}
             | expr:e1 MODASSIGN expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.MODASSIGN, e2); :}
             | expr:e1 LT expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.LT, e2); :}
                | expr:e1 GT expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.GT, e2); :}
                | expr:e1 LE expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.LE, e2); :}
                | expr:e1 GE expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.GE, e2); :}
                | expr:e1 EQ expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.EQ, e2); :}
                | expr:e1 NE expr:e2 {: RESULT = new BinaryExpr(e1, BinaryExpr.NE, e2); :}
;

whileStmt : WHILE LPAREN expr:e RPAREN stmt:s
             {: RESULT = new WhileStmt(e, s); :}
;
forStmt : FOR LPAREN expr:e1 SEMICOLON expr:e2 SEMICOLON expr:e3 RPAREN stmt:s
           {: RESULT = new ForStmt(e1, e2, e3, s); :}
;


