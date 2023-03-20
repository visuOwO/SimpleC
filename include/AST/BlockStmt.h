#include "AST/Stmt.h"
#include "exceptions/SemanticException.h"

#include <vector>
 
 class BlockStmt: public Stmt
 {
    public:
        BlockStmt();
        ~BlockStmt() override;

        BlockStmt(std::vector<Stmt> stmts);
        std::vector<Stmt> getStmts();
        void print() override;
        void check() override;
        void genCode() override;
    private:
        std::vector<Stmt> stmts;
};