#ifndef DOUBLECONSTEXPR_H
#define DOUBLECONSTEXPR_H

#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class DoubleConstExpr: public Expr
{
protected:
    double dval;
public:
    DoubleConstExpr(double d);
    ~DoubleConstExpr() override;
    double getDval() const;
    void print() override;
    void check() override;
    void genCode() override;
};

#endif //DOUBLECONSTEXPR_H

