#ifndef DECL_H
#define DECL_H

#include "../exceptions/SemanticException.h"
#include <vector>
#include <string>
#include "AST/ASTNode.h"


class Decl: public ASTNode {
    public:
        Decl();
        Decl(std::string* name, const int type, std::vector<int>* dims);
        ~Decl() override;
        std::string Name;
        int type{};
        std::vector<int> dims;
        void print() override;
        void check() override;
        void genCode() override;
};

#endif //DECL_H