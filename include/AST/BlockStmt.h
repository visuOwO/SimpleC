#ifndef BLOCKSTMT_H
#define BLOCKSTMT_H

#include "AST/Stmt.h"
#include "exceptions/SemanticException.h"

#include <vector>
 
 class BlockStmt: public Stmt
 {
    public:
        BlockStmt();
        ~BlockStmt() override;

        explicit BlockStmt(std::vector<ASTNode*>* stmts);
        std::vector<Stmt> getStmts();
        void print() override;
        void check() override;
        void genCode() override;
    private:
        std::vector<Stmt> stmts;
};

#endif //BLOCKSTMT_H