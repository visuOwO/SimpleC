#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class ReturnStmt: public Stmt
{
public:
    ReturnStmt();
    explicit ReturnStmt(Expr* expr);
    ~ReturnStmt() override;
    void print() override;
    void check() override;
    void genCode() override;
private:
    Expr* expr{};
};