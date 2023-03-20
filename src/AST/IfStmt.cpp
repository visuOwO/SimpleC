#include "AST/IfStmt.h"

IfStmt::IfStmt()
= default;

IfStmt::IfStmt(Expr* cond, Stmt* then, Stmt* els)
{
    this->cond = cond;
    this->then = then;
    this->els = els;
}

IfStmt::IfStmt(Expr* cond, Stmt* then)
{
    this->cond = cond;
    this->then = then;
    this->els = nullptr;
}

IfStmt::~IfStmt()
{
    delete cond;
    delete then;
    delete els;
}

void IfStmt::print()
{
    std::cout << "if (";
    cond->print();
    std::cout << ") ";
    then->print();
    if (els != nullptr)
    {
        std::cout << " else ";
        els->print();
    }
}

void IfStmt::check()
{
    cond->check();
    then->check();
    if (els != nullptr)
        els->check();
}

void IfStmt::genCode()
{
    std::cout << "if (";
    cond->genCode();
    std::cout << ") ";
    then->genCode();
    if (els != nullptr)
    {
        std::cout << " else ";
        els->genCode();
    }
}