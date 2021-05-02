#include "element.h"

Element::Element(element_t type, std::string name, bool isHead = false) : element_type(type), target_name(name), capacity(10), idx(0){
  this->next = new Element*[capacity];
  this->isHead = isHead;
}

void Element::doubleSpace(){
  capacity *= 2;
  auto p = new Element*[capacity];
  auto r = this->next;
  for(int i = 0; i < idx; ++i) p[i] = r[i];
  delete r;
  this->next = p;
}

void Element::addElement(Element *p){
  if(capacity <= idx) doubleSpace();
  this->next[idx++] = p;
}

std::string Element::toString(){
  std::string type;
  if(this->element_type == Branch) type = "Branch(";
  else if(this->element_type == Store) type = "Store(";
  else type = "Load(";
  return std::string(type + target_name + ")");
}

void Element::dfs(Element *p, std::vector<std::string> &output_str, std::ostream &target){
  output_str.push_back(p->toString());
  if(p->idx == 0){
    target << "[Sequence]";
    for(auto &p: output_str) target << p << " ";
    target << std::endl;
    output_str.pop_back();
    return; 
  } else {
    for(int i = 0; i < idx; ++i) dfs(p->next[i], output_str, target);
    output_str.pop_back();
  }
  return;
}

void Element::getAllMemoryAccessPath(std::ostream &target){
  std::vector<std::string> temp_object;
  if(this->isHead){
    for(int i = 0; i < idx; ++i) dfs(next[i], temp_object, target);
  } else {
    dfs(this, temp_object, target);
  }
}