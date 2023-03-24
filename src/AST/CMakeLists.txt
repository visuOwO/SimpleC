add_library(AST SHARED ArrayExpr.cpp ASTNode.cpp
        BinaryExpr.cpp BlockStmt.cpp Decl.cpp DoubleConstExpr.cpp
        EmptyStmt.cpp Expr.cpp ExprStmt.cpp ForStmt.cpp IdentExpr.cpp IfStmt.cpp
        IntConstExpr.cpp Program.cpp ReturnStmt.cpp Types.cpp WhileStmt.cpp Stmt.cpp)
