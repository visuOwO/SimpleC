#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

#include <string>
#include <vector>

class ArrayExpr: public Expr
{
public:
    ArrayExpr();
    ~ArrayExpr();
    ArrayExpr(std::string name, std::vector<Expr> exprs);
    std::string getName();
    std::vector<Expr> getExprs();
    void print();
private:
    std::string name;
    std::vector<Expr> exprs;
};