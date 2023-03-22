#include "AST/IdentExpr.h"

#include <utility>

IdentExpr::IdentExpr()
= default;

IdentExpr::IdentExpr(std::string ident)
{
    this->id = std::move(ident);
}

IdentExpr::~IdentExpr()
= default;

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
    if (this->getSymbolTable().find(this->id) == this->getSymbolTable().end())
        throw SemanticException("Variable " + this->id + " not declared");
}

void IdentExpr::genCode()
{
    std::cout << this->id;
}


