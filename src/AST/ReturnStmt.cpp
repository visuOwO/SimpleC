#include "AST/ReturnStmt.h"

ReturnStmt::ReturnStmt()
= default;

ReturnStmt::ReturnStmt(Expr* expr)
{
    this->expr = expr;
}

ReturnStmt::~ReturnStmt()
{
    delete expr;
}

void ReturnStmt::print()
{
    std::cout << "return ";
    expr->print();
    std::cout << ";";
}

void ReturnStmt::check()
{
    expr->check();
}

void ReturnStmt::genCode()
{
    std::cout << "return ";
    expr->genCode();
    std::cout << ";";
}