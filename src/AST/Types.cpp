#include "AST/Types.h"

Types::Types()
{
}

Types::~Types()
{
}

Types::Types(int type)
{
    this->type = type;
}

Types::Types(int type, std::vector<int> Dims)
{
    this->type = type;
    this->Dims = Dims;
}
