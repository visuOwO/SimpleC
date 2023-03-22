#include "AST/Types.h"

#include <utility>

Types::Types()
= default;

Types::~Types()
= default;

Types::Types(int type)
{
    this->type = type;
}

Types::Types(int type, std::vector<int> Dims)
{
    this->type = type;
    this->Dims = std::move(Dims);
}

void Types::check() {
    for (int Dim : Dims)
    {
        if (Dim <= 0)
        {
            std::cout << "Error: Array dimension must be greater than 0" << std::endl;
            exit(1);
        }
    }
}
