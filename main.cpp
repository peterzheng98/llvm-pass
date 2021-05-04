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

#include "element.h"

#include <iostream>
#include <memory>
#include <thread>
#include <vector>
#include <fstream>
#include <set>
#include <string>
#include <utility>
using namespace llvm;

const std::string path_prefix = "./analysis/";

std::vector<std::thread> thread_pool;
Element *head;

void generate_dfs(Element *r, std::vector<BaseElement> &start_obj, std::map<std::string, std::vector<BaseElement>> &p, std::map<std::string, int> &visit_times){
  Element *prev = r;
  for(auto &j: start_obj){
    if(j.getType() == Branch){
      Element *n = new Element(j);
      prev->addElement(n);
      std::string br1 = j.getBr1(), br2 = j.getBr2();
      if(visit_times[br1] != 3){
        visit_times[br1]++;
        generate_dfs(n, p[br1], p, visit_times);
      }
      if(br2 != "" && visit_times[br2] != 3){
        visit_times[br2]++;
        generate_dfs(n, p[br2], p, visit_times);
      }
      Element *p = n;
      
      prev = n;
    } else if (j.getType() == Store){
      Element *n = new Element(j);
      prev->addElement(n);
      prev = n;
    } else if (j.getType() == Load){
      Element *n = new Element(j);
      prev->addElement(n);
      prev = n;
    } else if(j.getType() == Switch){
      Element *n = new Element(j);
      prev->addElement(n);
      for(auto &obj: j.brs){
        if(visit_times[obj] != 3){
          visit_times[obj]++;
          generate_dfs(n, p[obj], p, visit_times);
        }
      }
      Element *p = n;
      prev = n;
    } else if(j.getType() == FunctionCall){
      Element *n = new Element(j);
      prev->addElement(n);
      prev = n;
    }
  }
}

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
      if(isa<llvm::LoadInst>(p)) std::cout << "sub-type: LoadInst" << std::endl; 
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
  head = new Element(element_t::HEAD, "HEAD", true);
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
  std::vector<std::pair<std::string, int>> temporatory_phase2;
  idx = 0;
  // Phase 2: do Propagation
  // If a variable is on stack, then all its arithmetic target is on the stack
  func_iter = iter->begin(), func_terminal = iter->end();
  for(; func_terminal != func_iter; func_iter++){
    std::cout << "\tBlock: " << func_iter->getName().str() << std::endl;
    for(auto inst_iter = func_iter->begin(), inst_terminal = func_iter->end(); inst_iter != inst_terminal; inst_iter++, idx++){
      std::cout << "\t\t" << inst_iter->getOpcodeName() 
                << " Target: " << inst_iter->getName().str()
                << " Use: " << inst_iter->hasOneUse() << std::endl;
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
        LoadInst *load_i = cast<LoadInst>(inst_iter);
        auto p = load_i->getPointerOperand();
        std::string load_source = cast<LoadInst>(inst_iter)->getPointerOperand()->getName().str();
        if(isa<GetElementPtrInst>(p)){
          std::cout << cast<GetElementPtrInst>(p)->getPointerOperand()->getName().str() << std::endl;
          load_source = cast<GetElementPtrInst>(p)->getPointerOperand()->getName().str();
        }
        if(allocated_variables.count(load_source)){
          allocated_variables.insert(inst_iter->getName().str());
          temporatory_phase2.push_back(std::pair<std::string, int>(inst_iter->getName().str(), idx));
        }
        continue;
      }
      if(isa<ICmpInst>(inst_iter)){
        std::cout << "icmp: " << cast<ICmpInst>(inst_iter)->getOperand(0)->getName().str() << " " << cast<ICmpInst>(inst_iter)->getOperand(1)->getName().str() << " " << inst_iter->hasOneUse() << std::endl;
        bool icmp_stack = true;
        icmp_stack &= (isa<Constant>(cast<ICmpInst>(inst_iter)->getOperand(0)) || allocated_variables.count(cast<ICmpInst>(inst_iter)->getOperand(0)->getName().str()));
        icmp_stack &= (isa<Constant>(cast<ICmpInst>(inst_iter)->getOperand(1)) || allocated_variables.count(cast<ICmpInst>(inst_iter)->getOperand(1)->getName().str()));
        if(icmp_stack) {
          allocated_variables.insert(inst_iter->getName().str());
          temporatory_phase2.push_back(std::pair<std::string, int>(inst_iter->getName().str(), idx));
        }
        continue;
      }
      if(isa<FCmpInst>(inst_iter)){
        continue;
      }
      if(isa<SwitchInst>(inst_iter)){
        std::cout << "Switch: " << std::endl;
        SwitchInst *p = cast<SwitchInst>(inst_iter);
        for(auto iter = p->case_begin(), terminal = p->case_end(); iter != terminal; ++iter){
          std::cout << iter->getCaseSuccessor()->getName().str() << std::endl;
        }
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
      if(isa<CallInst>(inst_iter)){
        auto call_p = cast<CallInst>(inst_iter);
        std::string target_function_name = "";
        if(!call_p->getCalledFunction()) target_function_name = call_p->getOperand(call_p->getNumOperands() - 1)->getName().str();
        else target_function_name = call_p->getCalledFunction()->getName().str();
        std::cout << "Call to: " << target_function_name << std::endl;
        continue;
      }
      if(isa<BinaryOperator>(inst_iter)){
        std::cout << "binary: " << inst_iter->getNumOperands() << std::endl;
        bool binary_stack = true;
        for(int i = 0; i < inst_iter->getNumOperands(); ++i){
          std::cout << "\t[binary]" << inst_iter->getOperand(i)->getName().str() << std::endl;
          bool value1 = isa<Constant>(inst_iter->getOperand(i));
          bool value2 = allocated_variables.count(inst_iter->getOperand(i)->getName().str());
          std::cout << "check value 1: " << value1 << " 2:" << value2 << std::endl;
          binary_stack &= (value1 || value2);
        }
        std::cout << "target: " << inst_iter->getName().str() << std::endl;
        if(binary_stack){
          allocated_variables.insert(inst_iter->getName().str());
          temporatory_phase2.push_back(std::pair<std::string, int>(inst_iter->getName().str(), idx));
        }
        continue;
      }
      std::cout << "not found: " << inst_iter->getOpcodeName() << std::endl;
    }
  }
  std::cout << "Phase 2:" << std::endl;
  output_files << "Phase 2:" << std::endl;
  for(auto &t : temporatory_phase2){
    std::cout << "Add: " << t.first << " " << t.second << std::endl;
    output_files << "Add: " << t.first << " " << t.second << std::endl;
  }

  std::map<std::string, std::vector<BaseElement>> block2insts;
  std::map<std::string, int> visit_time;
  std::vector<BaseElement> *p = new std::vector<BaseElement>();
  func_iter = iter->begin(), func_terminal = iter->end();
  for(; func_terminal != func_iter; ++func_iter){
    std::cout << "Phase 3\tBlock: " << func_iter->getName().str() << std::endl;
    for(auto inst_iter = func_iter->begin(), inst_terminal = func_iter->end(); inst_iter != inst_terminal; inst_iter++, idx++){
      if(isa<CallInst>(inst_iter)){
        auto call_p = cast<CallInst>(inst_iter);
        std::string target_function_name = "";
        if(!call_p->getCalledFunction()) target_function_name = call_p->getOperand(call_p->getNumOperands() - 1)->getName().str();
        else target_function_name = call_p->getCalledFunction()->getName().str();
        BaseElement tmp(FunctionCall, target_function_name);
        p->push_back(tmp);
        continue;
      }
      // Notice that from llvm:D70113
      // llvm/lib/IR/Constants.cpp
      // should not call getAsInstruction() since this will add a new instruction
      if(isa<StoreInst>(inst_iter)){
        std::string target = cast<StoreInst>(inst_iter)->getPointerOperand()->getName().str();
        StoreInst *inst = cast<StoreInst>(inst_iter);
        if(isa<GetElementPtrInst>(inst->getPointerOperand())){
          target = cast<GetElementPtrInst>(inst->getPointerOperand())->getPointerOperand()->getName().str();
        }
        if(isa<ConstantExpr>(inst->getPointerOperand())){
          auto t_inst = cast<ConstantExpr>(inst->getPointerOperand());
          target = t_inst->getOperand(0)->getName().str();
        }
        if(allocated_variables.count(target)) continue;
        BaseElement tmp(Store, target);
        p->push_back(tmp);
        continue;
      }
      if(isa<LoadInst>(inst_iter)){
        std::string target = cast<LoadInst>(inst_iter)->getPointerOperand()->getName().str();
        LoadInst *inst = cast<LoadInst>(inst_iter);
        if(isa<GetElementPtrInst>(inst->getPointerOperand())){
          target = cast<GetElementPtrInst>(inst->getPointerOperand())->getPointerOperand()->getName().str();
        }
        if(isa<ConstantExpr>(inst->getPointerOperand())){
          auto t_inst = cast<ConstantExpr>(inst->getPointerOperand());
          target = t_inst->getOperand(0)->getName().str();
        }
        if(allocated_variables.count(target)) continue;
        BaseElement tmp(Load, target);
        p->push_back(tmp);
        continue;
      }
      if(isa<BranchInst>(inst_iter)){
        if(cast<BranchInst>(inst_iter)->isConditional()){
          BaseElement tmp(Branch, cast<BranchInst>(inst_iter)->getOperand(1)->getName().str(), cast<BranchInst>(inst_iter)->getOperand(2)->getName().str());
          p->push_back(tmp);
          continue;
        } else {
          BaseElement tmp(Branch, cast<BranchInst>(inst_iter)->getOperand(0)->getName().str(), "");
          p->push_back(tmp);
          continue;
        }
      }
      // switch instruction
      if(isa<SwitchInst>(inst_iter)){
        SwitchInst *sinst = cast<SwitchInst>(inst_iter);
        BaseElement tmp(Switch, inst_iter->getName().str());
        for(auto iter = sinst->case_begin(), terminal = sinst->case_end(); iter != terminal; ++iter){
          tmp.addBrs(iter->getCaseSuccessor()->getName().str());
        }
        p->push_back(tmp);
        continue;
      }
    }
    block2insts[func_iter->getName().str()] = *p;
    visit_time[func_iter->getName().str()] = 0;
    p = new std::vector<BaseElement>();
  }
  delete p;
  // debug output of jump, load
  std::cout << "Debug phase 3: " << std::endl;
  for(auto &p: block2insts){
    std::cout << "Block: " << p.first << "[";
    for(auto &r : p.second) std::cout << r.toString() << " ";
    std::cout << "]" <<  std::endl;
  }

  
  

  // Generate target:
  Element *original = head;
  generate_dfs(original, block2insts["entry"], block2insts, visit_time);
  original = head;
  original->getAllMemoryAccessPath(output_files);
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
    std::cout << "error!" << std::endl;
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
