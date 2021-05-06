#include "element.h"


extern std::set<std::string> ignored_target;

Element::Element(element_t type, std::string name, bool isHead = false) : element_type(type), target_name(name), capacity(10), idx(0){
  this->next = new Element*[capacity];
  for(int i = 0; i < capacity; ++i) this->next[i] = NULL;
  this->isHead = isHead;
  this->main_line_next = NULL;
  this->select_idx = 0;
}

Element::Element(BaseElement p) : element_type(p.element_type), target_name(p.target_name), capacity(10), idx(0){
  this->next = new Element*[capacity];
  for(int i = 0; i < capacity; ++i) this->next[i] = NULL;
  this->isHead = false;
  this->main_line_next = NULL;
  this->br1 = p.br1;
  this->br2 = p.br2;
  for(auto &obj: p.brs) brs.push_back(obj);
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

void Element::DeleteNode(){
  this->element_type = DELETED;
}

std::string Element::toString(){
  std::string type;
  if(this->element_type == Branch) type = "Branch(" + br1 + "=>" + br2;
  else if(this->element_type == Store) type = "Store(";
  else if(this->element_type == Load) type = "Load(";
  else if(this->element_type == Switch) type = "Switch(";
  else if(this->element_type == FunctionCall) type = "Call(";
  else type = "Delete(";
  return std::string(type + target_name + ")");
}

std::string BaseElement::toString(){
  std::string type;
  if(this->element_type == Branch) type = "Branch(" + br1 + "=>" + br2;
  else if(this->element_type == Store) type = "Store(" + target_name;
  else if(this->element_type == Load) type = "Load(" + target_name;
  else if(this->element_type == Switch) type = "Switch(" + target_name;
  else type = "Call(" + target_name;
  return std::string(type + ")");
}

void Element::dfs(Element *p, std::vector<std::string> &output_str, std::vector<Element*> &output_target, std::ostream &target, std::map<std::string, std::vector<Element*>> &to_be_merged){
  output_str.push_back(p->toString());
  output_target.push_back(p);
  if(p->idx == 0){
    
    std::string to_be_output;
    std::vector<Element *> to_be_output_raw;
    int idx = 0;
    for(auto &p_str: output_str) {
      if(p_str.find("Branch") == std::string::npos && p_str.find("Switch") == std::string::npos && (ignored_target.count(p_str) == 0)){
        to_be_output = to_be_output + p_str + " ";
        to_be_output_raw.push_back(output_target[idx]);
      }
      idx++;
    }
    if(to_be_output.length() != 0){
      target << "Sequence: " << to_be_output << std::endl;
      to_be_merged[to_be_output] = to_be_output_raw;
    } else {
      target << "Zero Sequence." << std::endl;
    }
    output_str.pop_back();
    output_target.pop_back();
    return; 
  } else {
    for(int i = 0; i < p->idx; ++i) dfs(p->next[i], output_str, output_target, target, to_be_merged);
    output_str.pop_back();
    output_target.pop_back();
  }
  return;
}

std::map<std::string, std::vector<Element *>>* Element::getAllMemoryAccessPath(std::ostream &target){
  std::vector<std::string> temp_object;
  std::vector<Element *> output_target;
  std::map<std::string, std::vector<Element *>> to_be_merged;
  if(this->isHead){
    for(int i = 0; i < idx; ++i) dfs(next[i], temp_object, output_target, target, to_be_merged);
  } else {
    dfs(this, temp_object, output_target, target, to_be_merged);
  }
  std::vector<std::string> keys;
  for(auto &j: to_be_merged){
    keys.push_back(j.first);
  }
  std::sort(keys.begin(), keys.end(), [&](std::string &r1, std::string &r2){
    return r1.length() <= r2.length();
  });
  for(int i = 0; i < keys.size(); ++i){
    std::string current = keys[i];
    bool found = false;
    for(int j = keys.size() - 1; j > i; --j){
      if(keys[j].find(current) != std::string::npos){
        found = true;
        break;
      }
    }
    if(found) keys[i] = "[TO BE DELETED]";
  }
  std::map<std::string, std::vector<Element *>> *after_merge = new std::map<std::string, std::vector<Element *>>();
  for(auto &j : keys){
    if(j.find("[TO BE DELETED]") == std::string::npos){
      (*after_merge)[j] = to_be_merged[j];
    }
  }
  target << std::endl << "<==============================>" << std::endl;
  target << "After Merge: " << std::endl;
  for(auto &j : *after_merge){
    target << "Sequence: ";
    for(auto &r : j.second){
      target << r->toString() << " ";
    }
    target << std::endl;
  }
  return after_merge;
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
void BaseElement::addBrs(std::string r){
  this->brs.push_back(r);
}

std::string BaseElement::getBrs(int idx){
  return brs[idx];
}

auto BaseElement::begin(){
  return brs.begin();
}

auto BaseElement::end(){
  return brs.end();
}

const element_t Element::getElementType() const { return this->element_type; }
element_t Element::getElementType() { return this->element_type; }
std::string Element::getTargetName() { return this->target_name; }