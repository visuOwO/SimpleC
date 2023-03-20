#include "AST/Stmt.h"
#include "AST/Expr.h"
#include "exceptions/SemanticException.h"
 
 class ForStmt: public Stmt
 {
    public:
        ForStmt();
        ~ForStmt();
        ForStmt(Expr* init, Expr* cond, Expr* incr, Stmt* body);
        void print();
        void check();
        void genCode();
    private:
        Expr* init{};
        Expr* cond{};
        Expr* incr{};
        Stmt* body{};
 };