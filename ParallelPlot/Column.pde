class Column {
  
  public static final int COLUMN_HEIGHT = 400;
  public static final int ATT_LABEL_HEIGHT = COLUMN_HEIGHT + 50;
  public static final int MAX_LABEL_HEIGHT = COLUMN_HEIGHT + 20;
  public static final int MIN_LABEL_HEIGHT = 15;
  
  int x, y;
  String attName;
  int attMax, attMin;
  
  Column(String attribute) {
    attName = attribute;
  }
  
  float convertY(float ty) {
    float attRange = attMax - attMin;
    float dy = (400*ty) / attRange;
    return y - dy; //Y relative to column size 
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  void setX(int tx) {
    x = tx;
  }
  
  void setY(int ty) {
    y = ty;
  }
  
  void setMax(int max) {
    attMax = max;
  }
  
  void setMin(int min) {
    attMin = min;
  }
  
  void draw() {
    fill(0);
    line(x, y, x, y - COLUMN_HEIGHT);
    textAlign(CENTER, CENTER);
    text(attName, x + 5, y - ATT_LABEL_HEIGHT);
    text(str(attMax), x + 5, y - MAX_LABEL_HEIGHT);
    text(str(attMin), x + 5, y + MIN_LABEL_HEIGHT);
  }
}