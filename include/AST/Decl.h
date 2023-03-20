#include "../exceptions/SemanticException.h"
#include <vector>
#include <string>
#include "ASTNode.h"


class Decl: public ASTNode {
    public:
        Decl() {}
        ~Decl() {}
        std::vector<int> Dims;
        std::string Name;
        int type;
        void print();
        void check();
        void genCode();
};