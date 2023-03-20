#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"

class IfStmt: public Stmt
{
public:
    IfStmt();
    IfStmt(Expr* cond, Stmt* then, Stmt* els);
    IfStmt(Expr* cond, Stmt* then);
    ~IfStmt() override;
    void print() override;
    void check() override;
    void genCode() override;
private:
    Expr* cond{};
    Stmt* then{};
    Stmt* els{};
};