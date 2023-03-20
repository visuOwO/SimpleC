#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class ReturnStmt: public Stmt
{
public:
    ReturnStmt();
    ReturnStmt(Expr* expr);
    ~ReturnStmt();
    void print();
    void check();
    void genCode();
private:
    Expr* expr;
};