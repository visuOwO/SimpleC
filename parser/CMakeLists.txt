find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

if (NOT FLEX_FOUND)
    message(FATAL_ERROR "Flex not found")
endif()

if (NOT BISON_FOUND)
    message(FATAL_ERROR "Bison not found")
endif()

FLEX_TARGET(lexer ${CMAKE_CURRENT_SOURCE_DIR}/src/lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lexer.c)
BISON_TARGET(parser ${CMAKE_CURRENT_SOURCE_DIR}/src/parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.c)