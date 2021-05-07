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
#include <thread>
#include <unordered_set>

inline void dump(const std::vector<Element *> *p){
  if(p == nullptr){ std::cerr << "Size: 0" << std::endl; return; }
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
int verbosity = 1;

std::vector<std::vector<Element *>*>* expandCall(const std::vector<Element *> *original){
  std::vector<Element *> *template_one = new std::vector<Element *>();
  int i;
  if(verbosity >= 3){
    std::cerr << "Original: " << std::endl;
    dump(original);
    std::cerr << std::endl;
  }
  for(i = 0; i < original->size(); ++i){
    bool test = ((*original)[i]->getElementType() != FunctionCall) ||
    ((*original)[i]->getElementType() == FunctionCall && block2instSeq.count((*original)[i]->getTargetName()) == 0) ||
    ((*original)[i]->getElementType() == FunctionCall && block2instSeq[(*original)[i]->getTargetName()].size() == 0);
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
  int current_call = i;
  for(int j = 0; j < r->size(); ++j){
    for(i = current_call; i < original->size(); ++i)
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
    bool test = ((*p)[i]->getElementType() != FunctionCall) || 
    ((*p)[i]->getElementType() == FunctionCall && block2instSeq.count((*p)[i]->getTargetName()) == 0) ||
    ((*p)[i]->getElementType() == FunctionCall && block2instSeq[(*p)[i]->getTargetName()].size() == 0);
    if(!test) return false;
  }
  return true;
}

inline void output(std::string &header, std::vector<Element *> *p){
  std::string readable_path = "./readable/" + header, trans_path = "./trans/" + header;
  std::ofstream readable(readable_path, std::ios::app), trans(trans_path, std::ios::app);
  readable << "[Sequence]: ";
  trans << "-1 " << p->size() << std::endl;
  if(verbosity >= 3) std::cerr << "[Sequence]: ";
  for(int i = 0; i < p->size(); ++i){
    readable << (*p)[i]->toString() << " ";
    trans << (int)(*p)[i]->getElementType() << " " << (*p)[i]->getTargetName() << " ";
    if(verbosity >= 3) std::cerr << (*p)[i]->toString() << " ";
  }
  readable << std::endl;
  trans << std::endl;
  if(verbosity >= 3) std::cerr << std::endl;
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
      while(!target_list[i]->empty()){
        auto t = target_list[i]->back();
        target_list[i]->pop_back();
        delete t;
      }
      delete(target_list[i]);
      target_list[i] = nullptr;
      size_all--;
    }
  }
  if(size_all >= target_size) {
    std::cerr << "Target size reached.";
    return;
  }
  if(size_all == 0){
    std::cerr << "All expanded!!";
    return;
  }
  std::cerr << size_all << " " << target_list.size() << std::endl;
  while(target_list.size() < target_size && target_list.size() > 0){
    std::cerr << "target list size: " << target_list.size() << std::endl;
    std::vector<Element*> *head = target_list.front();
    target_list.pop_front();
    size_all--;
    if(head == nullptr) continue;
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
  for(int i = 0; i < target_list.size(); ++i){
    if(target_list[i] == nullptr) continue;
    for(int j = 0; j < target_list[i]->size(); ++j){
      if((*target_list[i])[j]->getElementType() == FunctionCall){
        std::string func_name((*target_list[i])[j]->getTargetName());
        if(block2instSeq.count(func_name) == 0 || block2instSeq[func_name].size() == 0) (*target_list[i])[j]->DeleteNode();
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
    std::cerr << "Test:" << recount << " " << size_all << std::endl;
    assert(recount == size_all);
  }
}

std::unordered_set<std::string> fuck;

void dfs(std::vector<Element *> *current_sequence, std::map<std::string, short> &visited, int idx, std::string prefix, int level, std::fstream &progress){
  if(check_no_expandable(current_sequence)) {
    output(prefix, current_sequence);
    std::cerr << "\033[35mno expandable: \033[0m";
    dump(current_sequence); std::cerr << std::endl;
    std::string val;
    for(int i = 0; i < current_sequence->size(); ++i) val = val + (*current_sequence)[i]->toString() + " ";
    if(fuck.count(val)){
	    while(1){
        std::cerr << "Fuck! ";
        std::cerr << val;
        exit(-1);
	    }	
    }
    fuck.insert(val);
    // auto hash_value = std::hash
    return;
  }
  std::vector<Element *> *new_sequence = new std::vector<Element *>();
  int i, next_call;
  for(i = 0; i < current_sequence->size(); ++i){
    bool test =((*current_sequence)[i]->getElementType() != FunctionCall) || 
    ((*current_sequence)[i]->getElementType() == FunctionCall && block2instSeq.count((*current_sequence)[i]->getTargetName()) == 0) ||
    ((*current_sequence)[i]->getElementType() == FunctionCall && block2instSeq[(*current_sequence)[i]->getTargetName()].size() == 0) ||
    ((*current_sequence)[i]->getElementType() == FunctionCall && visited[(*current_sequence)[i]->getTargetName()] >= 3);
    if(test){
      // new_sequence->push_back(new Element((*current_sequence)[i]->getElementType(), (*current_sequence)[i]->getTargetName(), false));
      new_sequence->push_back((*current_sequence)[i]);
    } else break;
  }
  if(i >= current_sequence->size()){
    output(prefix, current_sequence);
    // std::cout << "shortcut found!\r";
    // while(!new_sequence->empty()){
    //   Element *t = new_sequence->back();
    //   delete t;
    //   new_sequence->pop_back();
    // }
    return;
  }
  next_call = i;
  std::string call_target = (*current_sequence)[i]->getTargetName();
  std::vector<std::vector<Element *>> *p = &(block2instSeq[call_target]);
  for(int i = 0; i < p->size(); ++i){
    auto seq = (*p)[i];
    int reduce_size = seq.size();
    if(verbosity >= 3) std::cerr << "reduce size: " << reduce_size << std::endl;
    visited[call_target] += 1;
    std::cerr << "============" << std::endl;
    dump(current_sequence);
    std::cerr << "target: ====" << std::endl;
    dump(new_sequence);
    std::cerr << std::endl;
    // for(int j = 0; j < reduce_size; ++j) new_sequence->push_back(new Element(seq[j]->getElementType(), seq[j]->getTargetName(), false));
    for(int j = 0; j < reduce_size; ++j) new_sequence->push_back(seq[j]);
    for(int k = next_call + 1; k < current_sequence->size(); ++k) {
      // new_sequence->push_back(new Element((*current_sequence)[k]->getElementType(), (*current_sequence)[k]->getTargetName(), false));
      new_sequence->push_back((*current_sequence)[k]);
      reduce_size++;
    }
    if(verbosity >= 3){
      std::cerr << "over all reduce size: " << reduce_size << std::endl;
      dump(new_sequence);
      std::cerr << "<--->" << std::endl;
    }
    if(level < 5){
      for (int intent = 0; intent < level; intent++) progress << "  ";
      progress << "L[" << level << "] Size: " << i << " / " << p->size() << std::endl;
      progress.flush();
    }
    dfs(new_sequence, visited, idx, prefix, level + 1, progress);
    visited[call_target] -= 1;
    for(int k = reduce_size - 1; k >= 0; k--) {
      // Element *t = new_sequence->back();
      new_sequence->pop_back();
      // delete t;
    }
  }
  // while(!new_sequence->empty()){
  //   auto t = new_sequence->back();
  //   new_sequence->pop_back();
  //   delete t;
  // }
  delete new_sequence;
  if(level < 5){
    for (int intent = 0; intent < level; intent++) progress << "  ";
    progress << "L[" << level << "] Finish" << std::endl;
    progress.flush();
  }
}

void worker();

void dispatch(int idx, std::vector<Element*> *start_sequence){
  if(start_sequence == nullptr) return;
  std::map<std::string, short> *visited = new std::map<std::string, short>();
  std::vector<Element *> *internal_obj = new std::vector<Element *>();
  for(int i = 0; i < start_sequence->size(); ++i) internal_obj->push_back(new Element((*start_sequence)[i]->getElementType(), (*start_sequence)[i]->getTargetName(), false));
  for(auto &j : block2instSeq) (*visited)[j.first] = 0;
  std::fstream progress("./readable/" + std::to_string(idx) + ".prog", std::ios::out);
  dfs(internal_obj, *visited, idx, std::to_string(idx), 0, progress);
  while(!internal_obj->empty()){
    auto t = internal_obj->back();
    delete(t);
    internal_obj->pop_back();
  }
  delete(internal_obj);
  delete(visited);
}

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
        if(verbosity >= 3){
          std::cerr << "ops: " << ops << std::endl;
          std::cerr << "files: " << data_prefix + func_name << std::endl;
        }
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
  if(argc != 5){
    std::cerr << "Usage: <executable> <Top Files> <start function> <BFS Depth> <verbosity>" << std::endl;
    return 0;
  }
  std::string start(argv[2]);
  std::string top_file_name(argv[1]);
  int bfs_depth = std::stoi(std::string(argv[3]));
  verbosity = std::stoi(std::string(argv[4]));
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
  bfs(bfs_depth, start);
  if(verbosity >= 3){
    int idx = 0;
    for(auto j : target_list){
      if(j == nullptr) { std::cerr << "0: " << std::endl; continue; }
      std::cerr << idx << " : ";
      for(int i = 0; i < j->size(); ++i){
        std::cerr << (*j)[i]->toString() << " ";
      }
      std::cerr << std::endl;
    }
    idx++;
  }
  std::cerr << "BFS end" << std::endl;
  std::cerr << "size: " << target_list.size() << std::endl;
  std::thread **tid = new std::thread*[target_list.size()];
  int thread_cnt = 0;
  for(int i = 0; i < target_list.size(); ++i){
    tid[thread_cnt] = new std::thread(dispatch, i, target_list[i]);
    thread_cnt++;
    if(thread_cnt >= bfs_depth){
      std::cout << "Thread full" << std::endl;
      for(int j = 0; j < thread_cnt; ++j) {
        tid[j]->join();
        delete(tid[j]);
        std::cout << "\t Thread #" << j << " Joined";
        std::cout.flush();
      }
      std::cout << "Thread release, current: " << i + 1 << " / " << target_list.size() << std::endl;
      thread_cnt = 0;
    }
  }
  std::cerr << "DFS End" << std::endl;
}
