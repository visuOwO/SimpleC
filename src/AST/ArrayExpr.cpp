#include "AST/ArrayExpr.h"

#include <utility>

ArrayExpr::ArrayExpr()
= default;

ArrayExpr::~ArrayExpr()
= default;

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

void ArrayExpr::check() {
    for (auto & expr : exprs) {
        expr.setSymbolTable(this->symbolTable);
        expr.check();
    }
}

void ArrayExpr::genCode() {
    for (auto & expr : exprs)
        expr.genCode();
}

ArrayExpr::ArrayExpr(std::string *name, std::vector<ASTNode *> *exprs) {
    this->name = *name;
    for (auto & expr : *exprs)
    {
        this->exprs.push_back(*dynamic_cast<Expr*>(expr));
    }
}
