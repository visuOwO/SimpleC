#include "AST/ExprStmt.h"

ExprStmt::ExprStmt()
{
}

ExprStmt::ExprStmt(Expr* expr)
{
    this->expr = expr;
}

ExprStmt::~ExprStmt()
{
    delete expr;
}

void ExprStmt::print()
{
    expr->print();
}

void ExprStmt::check()
{
    expr->check();
}

void ExprStmt::genCode()
{
    expr->genCode();
}
