#include "AST/WhileStmt.h"

WhileStmt::WhileStmt()
= default;

WhileStmt::WhileStmt(Expr* expr, Stmt* stmt)
{
    this->expr = expr;
    this->stmt = stmt;
}

WhileStmt::~WhileStmt()
{
    delete expr;
    delete stmt;
}

void WhileStmt::print()
{
    std::cout << "while (";
    expr->print();
    std::cout << ") ";
    stmt->print();
}

void WhileStmt::check()
{
    expr->check();
    stmt->check();
}

void WhileStmt::genCode()
{
    std::cout << "while (";
    expr->genCode();
    std::cout << ") ";
    stmt->genCode();
}