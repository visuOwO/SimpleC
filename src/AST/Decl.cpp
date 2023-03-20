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
    std::cout << "Decl check" << std::endl;
}

void Decl::genCode()
{
    std::cout << "Decl genCode" << std::endl;
}
