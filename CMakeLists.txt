cmake_minimum_required(VERSION 3.0)

project(SimpleC)

find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)
include(HandleLLVMOptions)
include(ChooseMSVCCRT)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${LLVM_BINARY_DIR}/include)
link_directories(${LLVM_LIBRARY_DIRS})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)

add_subdirectory(lib)
add_subdirectory(src)

