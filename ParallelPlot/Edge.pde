class Edge {
  float x1, y1, x2, y2;
  
  //Node from;
  //Node to;
  //Item item;
  
  //Edge(Node f, Node t) {
  //  from = f;
  //  to = t;
  //  item = f.getItem();
  //}
  
  Edge(float tx1, float ty1, float tx2, float ty2) {
    x1 = tx1;
    x2 = tx2;
    y1 = ty1;
    y2 = ty2;
  }
  
  void draw() {
    fill(0);
    strokeWeight(0.5);
    line(x1, y1, x2, y2);
  }
  
  //Item getItem() {
  //  return item;
  //}
}