#include "AST/BlockStmt.h"

BlockStmt::BlockStmt()
{
}

BlockStmt::~BlockStmt()
{
}

BlockStmt::BlockStmt(std::vector<Stmt> stmts)
{
    this->stmts = stmts;
}

std::vector<Stmt> BlockStmt::getStmts()
{
    return stmts;
}

void BlockStmt::print()
{
    std::cout << "{" << std::endl;
    for (int i = 0; i < stmts.size(); i++)
    {
        stmts[i].print();
        std::cout << std::endl;
    }
    std::cout << "}";
}

void BlockStmt::check()
{
    for (int i = 0; i < stmts.size(); i++)
    {
        stmts[i].check();
    }
}

void BlockStmt::genCode()
{
    for (int i = 0; i < stmts.size(); i++)
    {
        stmts[i].genCode();
    }
}   