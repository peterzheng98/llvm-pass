#include "element.h"

#include <deque>
#include <iostream>
#include <memory>
#include <thread>
#include <vector>
#include <fstream>
#include <set>
#include <string>
#include <utility>
#include <ctime>
#include <cassert>

inline void dump(const std::vector<Element *> *p){
  std::cerr << "Size: " << p->size() << ": ";
  for(int i = 0; i < p->size(); ++i){
    std::cerr << (*p)[i]->toString() << " ";
  }
  std::cerr << std::endl;
}
std::string data_prefix = "./data/";
std::map<std::string, std::vector<std::vector<Element *>>> block2instSeq;
std::set<std::string> ignored_target;
std::deque<std::vector<Element *>*> target_list;
const int verbosity = 2;

std::vector<std::vector<Element *>*>* expandCall(const std::vector<Element *> *original){
  std::vector<Element *> *template_one = new std::vector<Element *>();
  int i;
  std::cerr << "Original: " << std::endl;
  dump(original);
  std::cerr << std::endl;
  for(i = 0; i < original->size(); ++i){
    bool test = false;
    test |= (*original)[i]->getElementType() != FunctionCall;
    test |= ((*original)[i]->getElementType() == FunctionCall && block2instSeq.count((*original)[i]->getTargetName()) == 0);
    test |= ((*original)[i]->getElementType() == FunctionCall && block2instSeq[(*original)[i]->getTargetName()].size() == 0);
    if(test){
      template_one->push_back(new Element((*original)[i]->getElementType(), (*original)[i]->getTargetName(), false));
    } else break;
  }
  std::string call_target = (*original)[i]->getTargetName();
  std::vector<std::vector<Element *>> *p = &(block2instSeq[call_target]);
  std::vector<std::vector<Element *> *> *r = new std::vector<std::vector<Element *>*>();
  for(auto &seq : *p){
    auto new_sequence = new std::vector<Element*>(template_one->begin(), template_one->end());
    assert(new_sequence->size() == template_one->size());
    for(auto &elem : seq){
      new_sequence->push_back(new Element(elem->getElementType(), elem->getTargetName(), false));
    }
    r->push_back(new_sequence);
  }
  i = i + 1;
  for(int j = 0; j < r->size(); ++j){
    for(; i < original->size(); ++i)
    (*r)[j]->push_back(new Element((*original)[i]->getElementType(), (*original)[i]->getTargetName(), false));
  }
  std::cerr << "Expanding to " << r->size() << " sequences." << std::endl;
  if(verbosity >= 2){
    int idx = 0;
    for(auto &j : *r){
      std::cerr << "\t[" << idx << "]: ";
      for(auto &elem: *j) std::cerr << elem->toString() << " ";
      std::cerr << std::endl;
      idx++;
    }
  }
  return r;
}

bool check_no_expandable(const std::vector<Element *> *p) {
  for(int i = 0; i < p->size(); ++i) {
    bool test = false;
    test |= (*p)[i]->getElementType() != FunctionCall;
    test |= ((*p)[i]->getElementType() == FunctionCall && block2instSeq.count((*p)[i]->getTargetName()) == 0);
    test |= ((*p)[i]->getElementType() == FunctionCall && block2instSeq[(*p)[i]->getTargetName()].size() == 0);
    if(!test) return false;
  }
  return true;
}

inline void output(std::string &header, std::vector<Element *> *p){
  std::string readable_path = "./readable/" + header, trans_path = "./trans/" + header;
  std::ofstream readable(readable_path, std::ios::app), trans(trans_path, std::ios::app);
  readable << "[Sequence]: ";
  trans << "-1 " << p->size() << std::endl;
  for(int i = 0; i < p->size(); ++i){
    readable << (*p)[i]->toString() << " ";
    trans << (int)(*p)[i]->getElementType() << " " << (*p)[i]->getTargetName() << " ";
  }
  readable << std::endl;
  trans << std::endl;
  readable.close();
  trans.close();
}



void bfs(int target_size, std::string &start){
  auto all_seq = block2instSeq[start];
  for(int i = 0; i < all_seq.size(); ++i){
    std::vector<Element *> *elem = new std::vector<Element *>();
    for(auto &j : all_seq[i]){
      elem->push_back(new Element(j->getElementType(), j->getTargetName(), false));
    }
    target_list.push_back(elem);
  }
  std::string prefix("master");
  int size_all = target_list.size();
  for(int i = 0; i < target_list.size(); ++i){
    if(check_no_expandable(target_list[i])){
      output(prefix, target_list[i]);
      delete(target_list[i]);
      target_list[i] = nullptr;
      size_all--;
    }
  }
  if(size_all >= target_size) return;
  if(size_all == 0){
    std::cerr << "All expanded!!";
    return;
  }
  std::cerr << size_all << " " << target_list.size() << std::endl;
  // while(target_list.size() > 0) {
  //   auto p = target_list.front();
  //   target_list.pop_front();
  // }
  // std::cerr << "fuck!!" << target_list.size() << std::endl;
  // int ttt;
  // std::cin >> ttt;
  
  while(size_all < target_size){
    std::vector<Element*> *head = target_list.front();
    target_list.pop_front();
    std::cerr << "Current head: ";
    dump(head);
    if(head == nullptr) continue;
    auto expand_result = expandCall(head);
    std::cerr << "Expanded: " << std::endl;
    for(auto &expanded_seq: *expand_result){
      dump(expanded_seq);
      if(check_no_expandable(expanded_seq)) output(prefix, expanded_seq);
      else{
        target_list.push_back(expanded_seq);
        size_all++;
      }
    }
  }
  std::cerr << "current target size: " << size_all << " " << target_list.size() << std::endl;
  if(verbosity >= 2){
    int recount = 0;
    for(int i = 0; i < target_list.size(); ++i){
      if(target_list[i] == nullptr){
        std::cerr << "\t[" << i << "]: null"; 
      } else {
        std::cerr << "\t[" << i << "]:";
        for(int j = 0; j < (target_list[i])->size(); ++j){
          std::cerr << (*(target_list[i]))[j]->toString() << " ";
        }
        std::cerr << std::endl;
        recount++;
      }
    }
    assert(recount == size_all);
  }
}
void dfs();


void loadfiles(std::string &configs){
  std::ifstream config_fs(configs);
  int n;
  config_fs >> n;
  for(int i = 0; i < n; ++i){
    std::string fs_name;
    config_fs >> fs_name;
    std::ifstream fs(fs_name);
    // read sub-config files
    int func_list_cnt = 0;
    fs >> func_list_cnt;
    for(int j = 0; j < func_list_cnt; ++j){
      std::string func_name;
      fs >> func_name;
      // open target files for loading the sequence
      std::ifstream func_fs(data_prefix + func_name);
      int record_cnt = 0;
      func_fs >> record_cnt;
      std::vector<std::vector<Element *>> *r = new std::vector<std::vector<Element*>>();
      for(int k = 0; k < record_cnt; ++k){
        int ops, cnt;
        func_fs >> ops >> cnt;
        assert(ops == -1);
        std::vector<Element *> *p = new std::vector<Element*>();
        for(int l = 0; l < cnt; ++l){
          int opCode;
          std::string target;
          func_fs >> opCode >> target;
          p->push_back(new Element((element_t) opCode, target, false));
        }
        r->push_back(*p);
      }
      func_fs.close();
      block2instSeq[func_name] = *r;
    }
    fs.close();
  }
  config_fs.close();
}

int main(int argc, char** argv){
  if(argc != 3){
    std::cerr << "Usage: <executable> <Top Files> <start function>" << std::endl;
    return 0;
  }
  std::string start(argv[2]);
  std::string top_file_name(argv[1]);
  loadfiles(top_file_name);
  std::cerr << "Total function counts: " << block2instSeq.size() << std::endl;
  if(verbosity >= 3){
    for(auto &j : block2instSeq){
      std::cerr << j.first << " " << j.second.size() << std::endl;
      for(int i = 0; i < j.second.size(); ++i){
        std::cerr << "  [" << i << "]:";
        for(auto &obj: j.second[i]){
          std::cerr << obj->toString() << " ";
        }
        std::cerr << std::endl;
      }
    }
  }
  bfs(170, start);
}