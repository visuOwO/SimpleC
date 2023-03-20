#include "AST/ForStmt.h"

ForStmt::ForStmt()
= default;

ForStmt::ForStmt(Expr* init, Expr* cond, Expr* incr, Stmt* body)
{
    this->init = init;
    this->cond = cond;
    this->incr = incr;
    this->body = body;
}

ForStmt::~ForStmt()
{
    delete init;
    delete cond;
    delete incr;
    delete body;
}

void ForStmt::print()
{
    std::cout << "for (";   
    init->print();
    std::cout << "; ";
    cond->print();
    std::cout << "; ";
    incr->print();
    std::cout << ")" << std::endl;
    body->print();
}

void ForStmt::check()
{
    init->check();
    cond->check();
    incr->check();
    body->check();
}

void ForStmt::genCode()
{
    init->genCode();
    std::cout << "for (" << std::endl;
    cond->genCode();
    std::cout << "; ";
    incr->genCode();
    std::cout << ")" << std::endl;
    body->genCode();
}