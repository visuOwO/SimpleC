#include "exceptions/SemanticException.h"
#include "AST/ASTNode.h"

#include <iostream>

class Expr: public ASTNode
{
public:
    Expr();
    ~Expr() override;
    void print() override;
    void check() override;
    void genCode() override;
};