#ifndef STMT_H
#define STMT_H

#include "AST/ASTNode.h"
#include "exceptions/SemanticException.h"

class Stmt: public ASTNode
{
public:
    Stmt();
    ~Stmt() override;
    void print() override;
    void check() override;
    void genCode() override ;
protected:
    int return_type{};
};

#endif //STMT_H
