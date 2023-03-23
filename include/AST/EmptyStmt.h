#ifndef EMPTYSTMT_H
#define EMPTYSTMT_H

#include "exceptions/SemanticException.h"
#include "AST/Stmt.h"

class EmptyStmt: public Stmt
{
public:
    EmptyStmt();
    ~EmptyStmt();
    void print() override;
    void check() override;
    void genCode() override;
};

#endif //EMPTYSTMT_H