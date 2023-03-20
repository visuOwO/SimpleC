#include "AST/IntConstExpr.h"

IntConstExpr::IntConstExpr()
= default;

IntConstExpr::IntConstExpr(int value)
{
    this->dval = value;
}

IntConstExpr::~IntConstExpr()
= default;

void IntConstExpr::print()
{
    std::cout << dval;
}

void IntConstExpr::check()
{
}

void IntConstExpr::genCode()
{
    std::cout << dval;
}

int IntConstExpr::getDval() const
{
    return this->dval;
}

