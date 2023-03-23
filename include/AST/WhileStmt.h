#ifndef WHILESTMT_H
#define WHILESTMT_H

#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class WhileStmt: public Stmt
{
public:
    WhileStmt();
    WhileStmt(Expr* expr, Stmt* stmt);
    ~WhileStmt() override;
    void print() override;
    void check() override;
    void genCode() override;
private:
    Expr* expr{};
    Stmt* stmt{};
};

#endif //WHILESTMT_H