#include "AST/ASTNode.h"
#include "AST/Decl.h"
#include "AST/Stmt.h"
#include "exceptions/SemanticException.h"

#include <string>
#include <vector>
 
class Program: public ASTNode
{
public:
    Program();
    Program(std::string funName, std::vector<ASTNode*> decls, std::vector<ASTNode*> stmts);
    ~Program() override;
    void print() override;
    void check() override;
    void genCode() override;
private:
    std::string funName; 
    std::vector<ASTNode*> stmts;
    std::vector<ASTNode*> decls;
};