#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class IfStmt: public Stmt
{
public:
    IfStmt();
    IfStmt(Expr* cond, Stmt* then, Stmt* els);
    IfStmt(Expr* cond, Stmt* then);
    ~IfStmt();
    void print();
    void check();
    void genCode();
private:
    Expr* cond;
    Stmt* then;
    Stmt* els;
};