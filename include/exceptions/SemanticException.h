#ifndef SEMANTIC_EXCEPTION_H
#define SEMANTIC_EXCEPTION_H
#include <string>
#include <exception>
class SemanticException : public std::exception {
    public:
        SemanticException(std::string msg) : msg(msg) {}
        virtual ~SemanticException() throw() {}
        virtual const char* what() const throw() {
            return msg.c_str();
        }
    private:
        std::string msg;
};
#endif