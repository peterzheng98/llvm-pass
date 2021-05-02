#include <iostream>
#include <string>
#include <vector>
typedef enum{
  Branch, Store, Load
} element_t;

class Element{
private:
  element_t element_type;
  std::string target_name;
  Element** next;
  int capacity, idx;
  bool isHead;
  void doubleSpace();
  void dfs(Element *p, std::vector<std::string> &output_str, std::ostream &target);
  std::string toString();
public:
  Element(element_t type, std::string name, bool isHead);
  void addElement(Element *);
  void getAllMemoryAccessPath(std::ostream &target);  
};