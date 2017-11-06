class Node {
  Item item;
  Column column;
  float x, y;
  
  Node(Item tempI, Column tempC) {
    item = tempI;
    column = tempC;
    y = column.convertY(item.getAttribute(column.attName)); //Get att value from item and convert to y position
    x = column.getX();
  }
  
  Item getItem() {
    return item;
  }
  
  void draw() {
    ellipse(x, y, 5, 5);
  }
}