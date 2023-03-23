#ifndef INTCONSTEXPR_H
#define INTCONSTEXPR_H

#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class IntConstExpr: public Expr
{
protected:
    int dval{};
public:
    explicit IntConstExpr(int d);
    IntConstExpr();
    ~IntConstExpr() override;
    int getDval() const;
    void print() override;
    void check() override;
    void genCode() override;
};

#endif //INTCONSTEXPR_H