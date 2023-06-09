find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

# set(CMAKE_CXX_FLAGS "-fpermissive")

if (NOT FLEX_FOUND)
    message(FATAL_ERROR "Flex not found")
endif()

if (NOT BISON_FOUND)
    message(FATAL_ERROR "Bison not found")
endif()

message(STATUS "Flex version: ${FLEX_VERSION}")
message(STATUS "Bison version: ${BISON_VERSION}")

FLEX_TARGET(lexer ${CMAKE_CURRENT_SOURCE_DIR}/lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp COMPILE_FLAGS)
BISON_TARGET(parser ${CMAKE_CURRENT_SOURCE_DIR}/parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp COMPILE_FLAGS)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(parser ${FLEX_lexer_OUTPUTS} ${BISON_parser_OUTPUTS})
target_link_libraries(parser AST)
