#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class BinaryExpr: public Expr
{
public:
    ~BinaryExpr() override;
    BinaryExpr(const Expr& left, const Expr& right, int op);
    void print() override;
    void check() override;
    void genCode() override;
    const static int ADD = 1;
    const static int MINUS = 2;
    const static int TIMES = 3;
    const static int DIVIDE = 4;
    const static int MOD = 5;
    const static int ADDASSIGN = 6;
    const static int MINUSASSIGN = 7;
    const static int TIMESASSIGN = 8;
    const static int DIVIDEASSIGN = 9;
    const static int MODASSIGN = 10;
    const static int ASSIGN = 11;
    const static int EQUAL = 12;
    const static int NOTEQUAL = 13;
    const static int GREATER = 14;
    const static int LESS = 15;
    const static int GREATEREQUAL = 16;
    const static int LESSEQUAL = 17;
private:
    Expr left;
    Expr right;
    int op{};
};