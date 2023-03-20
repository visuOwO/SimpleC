#include "AST/DoubleConstExpr.h"

DoubleConstExpr::DoubleConstExpr(double d)
{
    dval = d;
}

DoubleConstExpr::~DoubleConstExpr()
{
}

double DoubleConstExpr::getDval()
{
    return dval;
}

void DoubleConstExpr::print()
{
    std::cout << dval << std::endl;
}

void DoubleConstExpr::check()
{
    std::cout << "DoubleConstExpr check" << std::endl;
}

void DoubleConstExpr::genCode()
{
    std::cout << "DoubleConstExpr genCode" << std::endl;
}