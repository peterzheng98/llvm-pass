cmake_minimum_required(VERSION 3.17)
project(llvm_pass)


set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)
string(APPEND CMAKE_C_FLAGS " -pedantic -Wall -Wextra")
string(APPEND CMAKE_CXX_FLAGS " -pedantic -Wall -Wextra")
set(LLVM_DIR "/mnt/ssd/llvm-project/llvm/build/lib/cmake/llvm")
find_package(LLVM REQUIRED CONFIG)
llvm_map_components_to_libnames(LLVM_LIBRARIES all)

set(CLANG_LIBRARIES
    clangAnalysis
    clangAST
    clangBasic
    clangCodeGen
    clangDriver
    clangEdit
    clangFormat
    clangFrontend
    clangFrontendTool
    clangIndex
    clangLex
    clangParse
    clangSema
    clangSerialization
    clangToolingCore
    clangRewrite
    clangRewriteFrontend
)


function(add_playground_executable target_name)
  add_executable(${target_name} ${ARGN})
  set_target_properties(
    ${target_name}
    PROPERTIES
      COMPILE_FLAGS
        "-fno-rtti -fno-omit-frame-pointer -fsanitize=address"
      LINK_FLAGS
        "-fno-omit-frame-pointer -fsanitize=address")
  target_include_directories(${target_name}
                             PUBLIC ${LLVM_INCLUDE_DIRS} ${CLANG_INCLUDE_DIRS})
  target_link_libraries(${target_name} ${LLVM_LIBRARIES} ${CLANG_LIBRARIES})
endfunction()


add_playground_executable(memorybuffer main.cpp)