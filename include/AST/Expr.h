#include "exceptions/SemanticException.h"
#include "AST/ASTNode.h"

#include <iostream>

class Expr: public ASTNode
{
public:
    Expr();
    ~Expr();
    virtual void print();
    virtual void check();
    virtual void genCode();
};