#include "../exceptions/SemanticException.h"
#include <vector>
#include <string>
#include "ASTNode.h"


class Decl: public ASTNode {
    public:
        Decl();
        ~Decl() override;
        std::vector<int> Dims;
        std::string Name;
        int type{};
        void print() override;
        void check() override;
        void genCode() override;
};