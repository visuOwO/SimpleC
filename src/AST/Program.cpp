#include "AST/Program.h"

#include <utility>

Program::Program()
= default;

Program::Program(std::string funName, std::vector<ASTNode*> decls, std::vector<ASTNode*> stmts)
{
    this->funName = std::move(funName);
    this->decls = std::move(decls);
    this->stmts = std::move(stmts);
}

Program::~Program()
{
    for (auto & decl : decls)
        delete decl;
}

void Program::print()
{
    std::cout << "int " << funName << "()" << std::endl;
    std::cout << "{" << std::endl;
    for (auto & decl : decls)
        decl->print();
    for (auto & stmt : stmts)
        stmt->print();
    std::cout << "}" << std::endl;
}

void Program::check()
{
    for (auto & decl : decls)
        decl->check();
    for (auto & stmt : stmts)
        stmt->check();
}

void Program::genCode()
{
    std::cout << "int " << funName << "()" << std::endl;
    std::cout << "{" << std::endl;
    for (auto & decl : decls)
        decl->genCode();
    for (auto & stmt : stmts)
        stmt->genCode();
    std::cout << "}" << std::endl;
}


