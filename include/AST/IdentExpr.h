#include "AST/Expr.h"
#include "exceptions/SemanticException.h"
#include "AST/ASTNode.h"

class IdentExpr: public Expr
{
protected:
    std::string id;
public:
    explicit IdentExpr(std::string id);
    IdentExpr();
    ~IdentExpr() override;
    std::string getId();
    void print() override;
    void check() override;
    void genCode() override;
};
