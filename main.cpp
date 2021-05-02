#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/MemorySSA.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Operator.h"

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

void debug_llvm_value(llvm::Value *p){
  if(isa<llvm::Argument>(p)) std::cout << "type: Argument" << std::endl;
  if(isa<llvm::BasicBlock>(p)) std::cout << "type: BasicBlock" << std::endl;
  if(isa<llvm::InlineAsm>(p)) std::cout << "type: InlineAsm" << std::endl;
  if(isa<llvm::MetadataAsValue>(p)) std::cout << "type: MetadataAsValue" << std::endl;
  if(isa<llvm::User>(p)) {
    std::cout << "type: User: ";
    if(isa<llvm::MemoryAccess>(p)) std::cout << "sub-type: MemoryAccess" << std::endl;
    if(isa<llvm::Instruction>(p)){
      std::cout << " [Instruction]: ";
      if(isa<llvm::AtomicCmpXchgInst>(p)) std::cout << "sub-type: AtomicCmpXchgInst" << std::endl;
      if(isa<llvm::AtomicRMWInst>(p)) std::cout << "sub-type: AtomicRMWInst" << std::endl;
      if(isa<llvm::BinaryOperator>(p)) std::cout << "sub-type: BinaryOperator" << std::endl;
      if(isa<llvm::BranchInst>(p)) std::cout << "sub-type: BranchInst" << std::endl;
      if(isa<llvm::CallBase>(p)) std::cout << "sub-type: CallBase" << std::endl;
      if(isa<llvm::CatchReturnInst>(p)) std::cout << "sub-type: CatchReturnInst" << std::endl;
      if(isa<llvm::CatchSwitchInst>(p)) std::cout << "sub-type: CatchSwitchInst" << std::endl;
      if(isa<llvm::CmpInst>(p)) std::cout << "sub-type: CmpInst" << std::endl;
      if(isa<llvm::ExtractElementInst>(p)) std::cout << "sub-type: ExtractElementInst" << std::endl;
      if(isa<llvm::FenceInst>(p)) std::cout << "sub-type: FenceInst" << std::endl;
      if(isa<llvm::FuncletPadInst>(p)) std::cout << "sub-type: FuncletPadInst" << std::endl;
      if(isa<llvm::GetElementPtrInst>(p)) std::cout << "sub-type: GetElementPtrInst" << std::endl;
      if(isa<llvm::IndirectBrInst>(p)) std::cout << "sub-type: IndirectBrInst" << std::endl;
      if(isa<llvm::InsertElementInst>(p)) std::cout << "sub-type: InsertElementInst" << std::endl;
      if(isa<llvm::InsertValueInst>(p)) std::cout << "sub-type: InsertValueInst" << std::endl;
      if(isa<llvm::LandingPadInst>(p)) std::cout << "sub-type: LandingPadInst" << std::endl;
      if(isa<llvm::PHINode>(p)) std::cout << "sub-type: PHINode" << std::endl;
      if(isa<llvm::ResumeInst>(p)) std::cout << "sub-type: ResumeInst" << std::endl;
      if(isa<llvm::ReturnInst>(p)) std::cout << "sub-type: ReturnInst" << std::endl;
      if(isa<llvm::SelectInst>(p)) std::cout << "sub-type: SelectInst" << std::endl;
      if(isa<llvm::ShuffleVectorInst>(p)) std::cout << "sub-type: ShuffleVectorInst" << std::endl;
      if(isa<llvm::StoreInst>(p)) std::cout << "sub-type: StoreInst" << std::endl;
      if(isa<llvm::SwitchInst>(p)) std::cout << "sub-type: SwitchInst" << std::endl;
      if(isa<llvm::UnaryInstruction>(p)) std::cout << "sub-type: UnaryInstruction" << std::endl;
      if(isa<llvm::UnreachableInst>(p)) std::cout << "sub-type: UnreachableInst" << std::endl;
    }
    if(isa<llvm::Operator>(p)){
      std::cout << "[Operator] ";
      if(isa<llvm::FPMathOperator>(p)) std::cout << " FP Math Operator" << std::endl;
      if(isa<llvm::OverflowingBinaryOperator>(p)) std::cout << " OverflowingBinaryOperator" << std::endl;
      if(isa<llvm::PossiblyExactOperator>(p)) std::cout << " PossiblyExactOperator" << std::endl;
    }
    if(isa<llvm::Constant>(p)){
      std::cout << " [Constant] ";
      if(isa<llvm::BlockAddress>(p)) std::cout << "BlockAddress" << std::endl;
      if(isa<llvm::ConstantArray>(p)) std::cout << "ConstantArray" << std::endl;
      if(isa<llvm::ConstantStruct>(p)) std::cout << "ConstantStruct" << std::endl;
      if(isa<llvm::ConstantData>(p)) std::cout << "ConstantData" << std::endl;
      if(isa<llvm::ConstantExpr>(p)) std::cout << "ConstantExpr" << std::endl;
      if(isa<llvm::GlobalValue>(p)) std::cout << "GlobalValue" << std::endl;
    }
  }
  std::cout << " Search end. " << std::endl;
}

void check_function(llvm::Module::iterator &iter, int idx){
  std::set<std::string> allocated_variables;
  std::cout << "[" << idx << "]" << "Function: " << iter->getName().str() << std::endl;
  auto func_iter = iter->begin(), func_terminal = iter->end();
  if(func_iter == func_terminal) return;
  std::ofstream output_files(path_prefix + "function_" + std::to_string(idx) + "_" + iter->getName().str() + ".txt", std::ios::out);
  output_files << "[" << idx << "]" << "Function: " << iter->getName().str() << std::endl;
  // Phase 1: find all the values that allocated on stack
  // The reason: stack variable is private
  for(; func_terminal != func_iter; func_iter++){
    output_files << "\tBlock: " << func_iter->getName().str() << std::endl;
    for(auto inst_iter = func_iter->begin(), inst_terminal = func_iter->end(); inst_iter != inst_terminal; inst_iter++){
      output_files << "\t\t" << inst_iter->getOpcodeName() << std::endl;
      if(isa<AllocaInst>(inst_iter)){
        if(dyn_cast<AllocaInst>(inst_iter)->hasName()) allocated_variables.insert(dyn_cast<AllocaInst>(inst_iter)->getName().str());
      }
    }
  }
  output_files << "Phase 1: Allocated Variables: " << std::endl;
  for(auto &p : allocated_variables){
    output_files << p << std::endl;
  }
  // Phase 2: do Propagation
  // If a variable is on stack, then all its arithmetic target is on the stack
  func_iter = iter->begin(), func_terminal = iter->end();
  for(; func_terminal != func_iter; func_iter++){
    std::cout << "\tBlock: " << func_iter->getName().str() << std::endl;
    for(auto inst_iter = func_iter->begin(), inst_terminal = func_iter->end(); inst_iter != inst_terminal; inst_iter++){
      std::cout << "\t\t" << inst_iter->getOpcodeName() << "Use: " << inst_iter->hasOneUse() << std::endl;
      if(isa<AllocaInst>(inst_iter)){
        // Allocation instructions: no need to do for this phase
        continue;
      }
      if(isa<StoreInst>(inst_iter)){
        std::cout << "Store: " << cast<StoreInst>(inst_iter)->getValueOperand()->getName().str() << " pointer: " << cast<StoreInst>(inst_iter)->getPointerOperand()->getName().str() << std::endl;
        continue;
      }
      if(isa<LoadInst>(inst_iter)){
        std::cout << "Load: " << cast<LoadInst>(inst_iter)->getPointerOperand()->getName().str() << std::endl;
        continue;
      }
      if(isa<ICmpInst>(inst_iter)){
        std::cout << "icmp: " << cast<ICmpInst>(inst_iter)->getOperand(0)->getName().str() << " " << cast<ICmpInst>(inst_iter)->getOperand(1)->getName().str() << " " << inst_iter->hasOneUse() << std::endl;
        continue;
      }
      if(isa<FCmpInst>(inst_iter)){
        continue;
      }
      if(isa<BranchInst>(inst_iter)){
        continue;
      }
      if(isa<CallBrInst>(inst_iter)){
        continue;
      }
      // Cast including SExt, ZExt
      if(isa<CastInst>(inst_iter)){
        continue;
      }
      if(isa<UnaryOperator>(inst_iter)){
        continue;
      }
      if(isa<GetElementPtrInst>(inst_iter)){
        continue;
      }
      if(isa<ExtractValueInst>(inst_iter)){
        continue;
      }
      if(isa<ReturnInst>(inst_iter)){
        continue;
      }
      std::cout << "not found: " << inst_iter->getOpcodeName() << std::endl;
    }
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
