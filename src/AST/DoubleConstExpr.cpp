#include "AST/DoubleConstExpr.h"

DoubleConstExpr::DoubleConstExpr(double d)
{
    dval = d;
}

DoubleConstExpr::~DoubleConstExpr()
= default;

double DoubleConstExpr::getDval() const
{
    return dval;
}

void DoubleConstExpr::print()
{
    std::cout << dval << std::endl;
}

void DoubleConstExpr::check()
{
}

void DoubleConstExpr::genCode()
{
    std::cout << "DoubleConstExpr genCode" << std::endl;
}