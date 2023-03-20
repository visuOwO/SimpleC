#include "AST/Program.h"

Program::Program()
{
}

Program::Program(std::string funName, std::vector<ASTNode*> decls, std::vector<ASTNode*> stmts)
{
    this->funName = funName;
    this->decls = decls;
    this->stmts = stmts;
}

Program::~Program()
{
    for (int i = 0; i < decls.size(); i++)
        delete decls[i];
}

void Program::print()
{
    std::cout << "int " << funName << "()" << std::endl;
    std::cout << "{" << std::endl;
    for (int i = 0; i < decls.size(); i++)
        decls[i]->print();
    for (int i = 0; i < stmts.size(); i++)
        stmts[i]->print();
    std::cout << "}" << std::endl;
}

void Program::check()
{
    for (int i = 0; i < decls.size(); i++)
        decls[i]->check();
    for (int i = 0; i < stmts.size(); i++)
        stmts[i]->check();
}

void Program::genCode()
{
    std::cout << "int " << funName << "()" << std::endl;
    std::cout << "{" << std::endl;
    for (int i = 0; i < decls.size(); i++)
        decls[i]->genCode();
    for (int i = 0; i < stmts.size(); i++)
        stmts[i]->genCode();
    std::cout << "}" << std::endl;
}


