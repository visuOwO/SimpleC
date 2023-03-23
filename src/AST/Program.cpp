#include "AST/Program.h"

#include <utility>

Program::Program() {
    this->funName = "";
    this->decls = {};
    this->stmts = {};
    this->type = 0;
}

Program::Program(std::string* funName, int type, std::vector<ASTNode*>* decls, std::vector<ASTNode*>* stmts)
{
    this->funName = *funName;
    this->decls = *decls;
    this->stmts = *stmts;
    this->type = type;
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


