#include "AST/ArrayExpr.h"

ArrayExpr::ArrayExpr()
{
}

ArrayExpr::~ArrayExpr()
{
}

ArrayExpr::ArrayExpr(std::string name, std::vector<Expr> exprs)
{
    this->name = name;
    this->exprs = exprs;
}

std::string ArrayExpr::getName()
{
    return name;
}

std::vector<Expr> ArrayExpr::getExprs()
{
    return exprs;
}

void ArrayExpr::print()
{
    std::cout << name << "[";
    for (int i = 0; i < exprs.size(); i++)
    {
        exprs[i].print();
        if (i != exprs.size() - 1)
        {
            std::cout << ", ";
        }
    }
    std::cout << "]";
}