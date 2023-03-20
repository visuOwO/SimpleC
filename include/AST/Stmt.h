#include "AST/ASTNode.h"
#include "exceptions/SemanticException.h"

class Stmt: public ASTNode
{
public:
    Stmt();
    ~Stmt();
    virtual void print();
    virtual void check();
    virtual void genCode();
protected:
    int return_type;
};