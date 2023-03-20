#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class DoubleConstExpr: public Expr
{
protected:
    double dval;
public:
    DoubleConstExpr(double d);
    ~DoubleConstExpr();
    double getDval();
    void print();
    void check();
    void genCode();
};

