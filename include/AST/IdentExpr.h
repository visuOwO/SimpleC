#include "AST/Expr.h"
#include "exceptions/SemanticException.h"
#include "AST/ASTNode.h"

class IdentExpr: public Expr
{
protected:
    std::string id;
public:
    IdentExpr(std::string id);
    IdentExpr();
    ~IdentExpr();
    std::string getId();
    void print();
    void check();
    void genCode();
};
