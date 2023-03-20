#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class WhileStmt: public Stmt
{
public:
    WhileStmt();
    WhileStmt(Expr* expr, Stmt* stmt);
    ~WhileStmt();
    void print();
    void check();
    void genCode();
private:
    Expr* expr;
    Stmt* stmt;
};