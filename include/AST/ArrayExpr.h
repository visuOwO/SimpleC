#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

#include <string>
#include <vector>

class ArrayExpr: public Expr
{
public:
    ArrayExpr();
    ~ArrayExpr() override;
    ArrayExpr(std::string name, std::vector<Expr> exprs);
    std::string getName();
    std::vector<Expr> getExprs();
    void print() override;
    void check() override;
    void genCode() override;
private:
    std::string name;
    std::vector<Expr> exprs;
};