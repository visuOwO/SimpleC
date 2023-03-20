#include "AST/IdentExpr.h"

IdentExpr::IdentExpr()
{
}

IdentExpr::IdentExpr(std::string ident)
{
    this->id = ident;
}

IdentExpr::~IdentExpr()
{
}

std::string IdentExpr::getId()
{
    return this->id;
}

void IdentExpr::print()
{
    std::cout << this->id;
}

void IdentExpr::check()
{
}

void IdentExpr::genCode()
{
    std::cout << this->id;
}


