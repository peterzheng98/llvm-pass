#include <iostream>
#include <string>
#include <vector>
typedef enum{
  HEAD, Branch, Store, Load, Switch
} element_t;
class BaseElement;

class Element{
  friend class BaseElement;
private:
  element_t element_type;
  std::string target_name, br1, br2;
public:
  Element** next;
  Element* main_line_next;
  std::vector<std::string> brs;
private:
  int capacity, idx;
  bool isHead;
  void doubleSpace();
  void dfs(Element *p, std::vector<std::string> &output_str, std::ostream &target);
  std::string toString();
public:
  Element(element_t type, std::string name, bool isHead);
  Element(BaseElement p);
  void addElement(Element *);
  void getAllMemoryAccessPath(std::ostream &target);  
};

class BaseElement{
  friend class Element;
private:
  element_t element_type;
  std::string target_name, br1, br2;
public:
  std::vector<std::string> brs;
public:
  BaseElement(element_t, std::string);
  BaseElement(element_t, std::string, std::string);
  std::string toString();
  element_t getType();
  std::string getBr1();
  std::string getBr2();
  std::string getBrs(int);
  void addBrs(std::string);
  auto begin();
  auto end();
};