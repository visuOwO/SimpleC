#ifndef ASTNODE_H
#define ASTNODE_H
#include <map>
#include <string>
#include <vector>
#include <iostream>
class ASTNode {
    public:
        ASTNode() {}
        virtual ~ASTNode() {}
        virtual void print() = 0;
        virtual void check() = 0;
        virtual void genCode() = 0;
    private:
        static int tmpVarCount;
        static int labelCount;
    protected:
        std::map<std::string, int> symbolTable;
};
#endif