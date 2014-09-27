project(libclang-dump)
cmake_minimum_required(VERSION 2.8)
aux_source_directory(. SRC_LIST)
add_executable(${PROJECT_NAME} ${SRC_LIST})

set(CLANG_PREFIX /usr/local/Cellar/llvm/3.5.0/)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -I${CLANG_PREFIX}/include")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L${CLANG_PREFIX}/lib -lclang -Wl,-rpath,${CLANG_PREFIX}/lib")
