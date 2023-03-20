#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class ExprStmt: public Stmt
{
    public:
        ExprStmt();
        ~ExprStmt();
        ExprStmt(Expr* expr);
        void print();
        void check();
        void genCode();
    private:
        Expr* expr;
};