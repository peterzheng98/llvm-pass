#include "element.h"

Element::Element(element_t type, std::string name, bool isHead = false) : element_type(type), target_name(name), capacity(10), idx(0){
  this->next = new Element*[capacity];
  for(int i = 0; i < capacity; ++i) this->next[i] = NULL;
  this->isHead = isHead;
  this->main_line_next = NULL;
}

Element::Element(BaseElement p) : element_type(p.element_type), target_name(p.target_name), capacity(10), idx(0){
  this->next = new Element*[capacity];
  for(int i = 0; i < capacity; ++i) this->next[i] = NULL;
  this->isHead = false;
  this->main_line_next = NULL;
  this->br1 = p.br1;
  this->br2 = p.br2;
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
  if(this->capacity <= idx) doubleSpace();
  this->next[idx++] = p;
}

std::string Element::toString(){
  std::string type;
  if(this->element_type == Branch) type = "Branch(" + br1 + "=>" + br2;
  else if(this->element_type == Store) type = "Store(";
  else type = "Load(";
  return std::string(type + target_name + ")");
}

std::string BaseElement::toString(){
  std::string type;
  if(this->element_type == Branch) type = "Branch(" + br1 + "=>" + br2;
  else if(this->element_type == Store) type = "Store(" + target_name;
  else type = "Load(" + target_name;
  return std::string(type + ")");
}

void Element::dfs(Element *p, std::vector<std::string> &output_str, std::ostream &target){
  output_str.push_back(p->toString());
  if(p->idx == 0){
    target << "[Sequence]";
    for(auto &p: output_str) {
      if(p.find("Branch") == std::string::npos)
      target << p << " ";
    }
    target << std::endl;
    output_str.pop_back();
    return; 
  } else {
    for(int i = 0; i < p->idx; ++i) dfs(p->next[i], output_str, target);
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

BaseElement::BaseElement(element_t p, std::string target){
  this->element_type = p;
  this->target_name = target;
}

BaseElement::BaseElement(element_t p, std::string br1, std::string br2){
  this->element_type = p;
  this->br1 = br1;
  this->br2 = br2;
}

element_t BaseElement::getType(){ return this->element_type; }

std::string BaseElement::getBr1() { return this->br1; }
std::string BaseElement::getBr2() { return this->br2; }