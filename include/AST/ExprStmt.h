#ifndef EXPRSTMT_H
#define EXPRSTMT_H

#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class ExprStmt: public Stmt
{
    public:
        ExprStmt();
        ~ExprStmt() override;
        explicit ExprStmt(Expr* expr);
        void print() override;
        void check() override;
        void genCode() override;
    private:
        Expr* expr{};
};

#endif //EXPRSTMT_H