#include "AST/Decl.h"

Decl::Decl()
= default;

Decl::~Decl()
= default;

void Decl::print()
{
    std::cout << "Decl" << std::endl;
}

void Decl::check()
{
    if (this->symbolTable.find(this->Name) != this->symbolTable.end()) {
        std::cout << "Error: Redeclaration of variable " << this->Name << std::endl;
        exit(1);
    }
}

void Decl::genCode()
{
    std::cout << "Decl genCode" << std::endl;
}

Decl::Decl(std::string* name, const int type, std::vector<int> *dims) {
    this->Name = *name;
    this->type = type;
    this->dims = *dims;
}


