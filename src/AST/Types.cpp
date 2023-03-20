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
