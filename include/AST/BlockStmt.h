#include "AST/Stmt.h"
#include "exceptions/SemanticException.h"

#include <vector>
 
 class BlockStmt: public Stmt
 {
    public:
        BlockStmt();
        ~BlockStmt();

        BlockStmt(std::vector<Stmt> stmts);
        std::vector<Stmt> getStmts();
        void print();
        void check();
        void genCode();
    private:
        std::vector<Stmt> stmts;
};