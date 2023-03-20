#include "AST/BinaryExpr.h"

BinaryExpr::BinaryExpr()
{
}

BinaryExpr::~BinaryExpr()
{
}

BinaryExpr::BinaryExpr(Expr left, Expr right, int op)
{
    this->left = left;
    this->right = right;
    this->op = op;
}

void BinaryExpr::print() {
    std::cout << "(";
    left.print();
    switch (op)
    {
        case ADD:
            std::cout << " + ";
            break;
        case MINUS:
            std::cout << " - ";
            break;
        case TIMES:
            std::cout << " * ";
            break;
        case DIVIDE:
            std::cout << " / ";
            break;
        case MOD:
            std::cout << " % ";
            break;
        case ADDASSIGN:
            std::cout << " += ";
            break;
        case MINUSASSIGN:
            std::cout << " -= ";
            break;
        case TIMESASSIGN:
            std::cout << " *= ";
            break;
        case DIVIDEASSIGN:
            std::cout << " /= ";
            break;
        case MODASSIGN:
            std::cout << " %= ";
            break;
        case ASSIGN:
            std::cout << " = ";
            break;
        case EQUAL:
            std::cout << " == ";
            break;
        case NOTEQUAL:
            std::cout << " != ";
            break;
        case GREATER:
            std::cout << " > ";
            break;
        case LESS:
            std::cout << " < ";
            break;
        case GREATEREQUAL:
            std::cout << " >= ";
            break;
        case LESSEQUAL:
            std::cout << " <= ";
            break;
    }
    right.print();
    std::cout << ")";
}

void BinaryExpr::check()
{
    left.check();
    right.check();
}

void BinaryExpr::genCode() {
    //TODO: implement this
}

