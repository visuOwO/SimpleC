#include "AST/ASTNode.h"

std::map<std::string, Types> ASTNode::getSymbolTable() {
    return symbolTable;
}

void ASTNode::setSymbolTable(std::map<std::string, Types> st) {
    this->symbolTable = std::move(st);
}
