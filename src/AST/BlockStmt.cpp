#include "AST/BlockStmt.h"

#include <utility>

BlockStmt::BlockStmt()
= default;

BlockStmt::~BlockStmt()
= default;

BlockStmt::BlockStmt(std::vector<Stmt> stmts)
{
    this->stmts = std::move(stmts);
}

std::vector<Stmt> BlockStmt::getStmts()
{
    return stmts;
}

void BlockStmt::print()
{
    std::cout << "{" << std::endl;
    for (auto & stmt : stmts)
    {
        stmt.print();
        std::cout << std::endl;
    }
    std::cout << "}";
}

void BlockStmt::check()
{
    for (auto & stmt : stmts)
    {
        stmt.check();
    }
}

void BlockStmt::genCode()
{
    for (auto & stmt : stmts)
    {
        stmt.genCode();
    }
}   