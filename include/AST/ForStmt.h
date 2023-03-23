#ifndef FORSTMT_H
#define FORSTMT_H

#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"
 
 class ForStmt: public Stmt
 {
    public:
        ForStmt();
        ~ForStmt() override;
        ForStmt(Expr* init, Expr* cond, Expr* incr, Stmt* body);
        void print() override;
        void check() override;
        void genCode() override;
    private:
        Expr* init{};
        Expr* cond{};
        Expr* incr{};
        Stmt* body{};
 };

#endif //FORSTMT_H