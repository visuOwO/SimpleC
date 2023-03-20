#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class IntConstExpr: public Expr
{
protected:
    int dval;
public:
    IntConstExpr(int d);
    IntConstExpr();
    ~IntConstExpr();
    int getDval();
    void print();
    void check();
    void genCode();
};

