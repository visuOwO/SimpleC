#include "exceptions/SemanticException.h"
#include "AST/Stmt.h"

class EmptyStmt: public Stmt
{
public:
    EmptyStmt();
    ~EmptyStmt();
    void print();
    void check();
    void genCode();
};