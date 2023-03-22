#ifndef ASTNODE_H
#define ASTNODE_H
#include "AST/Types.h"
#include <map>
#include <string>
#include <vector>
#include <iostream>
class ASTNode {
    public:
        ASTNode() = default;
        virtual ~ASTNode() = default;
        virtual void print() = 0;
        virtual void check() = 0;
        virtual void genCode() = 0;
        std::map<std::string, Types> getSymbolTable();
        void setSymbolTable(std::map<std::string, Types> symbolTable);
    private:
        static int tmpVarCount;
        static int labelCount;
    protected:
        std::map<std::string, Types> symbolTable;
};
#endif