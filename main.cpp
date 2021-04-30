#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <memory>
#include <thread>
#include <vector>
#include <fstream>
#include <set>
#include <string>
using namespace llvm;

const std::string path_prefix = "./analysis/";

std::vector<std::thread> thread_pool;

void check_function(llvm::Module::iterator &iter, int idx){
  std::set<std::string> allocated_variables;
  std::cout << "[" << idx << "]" << "Function: " << iter->getName().str() << std::endl;
  auto func_iter = iter->begin(), func_terminal = iter->end();
  if(func_iter == func_terminal) return;
  std::ofstream output_files(path_prefix + "function_" + std::to_string(idx) + "_" + iter->getName().str() + ".txt", std::ios::out);
  output_files << "[" << idx << "]" << "Function: " << iter->getName().str() << std::endl;
  for(; func_terminal != func_iter; func_iter++){
    output_files << "\tBlock: " << func_iter->getName().str() << std::endl;
    for(auto inst_iter = func_iter->begin(), inst_terminal = func_iter->end(); inst_iter != inst_terminal; inst_iter++){
      output_files << "\t\t" << inst_iter->getOpcodeName() << std::endl;
      if(isa<AllocaInst>(inst_iter)){
        if(dyn_cast<AllocaInst>(inst_iter)->hasName()) allocated_variables.insert(dyn_cast<AllocaInst>(inst_iter)->getName().str());
      }
    }
  }
  output_files << "Allocated Variables: " << std::endl;
  for(auto &p : allocated_variables){
    output_files << p << std::endl;
  }
  output_files.close();
}

int main(int argc, char** argv) {
    if(argc != 2){
        std::cerr << "Usage: <executable> <IR Files>" << std::endl;
        return 0;
    }

  llvm::LLVMContext context;
  SMDiagnostic error;
  std::unique_ptr<Module> m = parseIRFile(argv[1], error, context);
  if(!m)
  {
    return 0;
  }
  std::cout << error.getMessage().str() << std::endl;
  std::cout << m->getName().str() << std::endl;
  int idx = 0;
  for(auto iter = m->begin(), goal = m->end(); iter != goal; ++iter){
    check_function(iter, idx++);
    // thread_pool.push_back(std::move(std::thread(check_function, std::ref(iter), idx++)));
  }
  // for(auto &p: thread_pool){
  //   p.join();
  // }
  return 0;

}
