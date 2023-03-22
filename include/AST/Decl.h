#include "../exceptions/SemanticException.h"
#include <vector>
#include <string>
#include "AST/ASTNode.h"
#include "AST/Tokens.h"


class Decl: public ASTNode {
    public:
        Decl();
        Decl(std::string name, const Types& type);
        ~Decl() override;
        std::string Name;
        Types type{};
        void print() override;
        void check() override;
        void genCode() override;
};