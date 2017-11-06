class Item {
  
  String identifier;
  HashMap<String, Float> attributes;
  
  Item(String ident) {
    identifier = ident;
    attributes = new HashMap<String, Float>();
  }
  
  void addAttribute(String s, Float f) {
    attributes.put(s, f);
  }
  
  float getAttribute(String s) {
    return attributes.get(s);
  }
}