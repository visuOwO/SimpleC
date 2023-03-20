#include "AST/IntConstExpr.h"

IntConstExpr::IntConstExpr()
{
}

IntConstExpr::IntConstExpr(int value)
{
    this->dval = value;
}

IntConstExpr::~IntConstExpr()
{
}

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

int IntConstExpr::getDval()
{
    return this->dval;
}

