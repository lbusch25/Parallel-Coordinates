//Get rid of nodes and edges
//Make item hold Dict <att name, pos>, this will hold different attribute positions
//Store columns in arrayList, how things are drawn is based on order of Columns in arrayList
//click and drag on label
TableReader activeTable;
TableReader carData;
TableReader cameraData;
TableReader foodData;

int startX, startY;

//ArrayList<Column> columns;
Item items[];

void setup() {
  size(1200, 600);
  pixelDensity(displayDensity());
  loadData();
  print(activeTable.columns.size());
} 


void draw() {
  background(255);
  for(Column c: activeTable.columns) {
    //if(c.highlight == true) {
    //  print(c.highlight);
    //}
    c.draw();
  } 
  for(int i =1; i < activeTable.items.length - 1; i++){
    for(int j = 0; j < activeTable.columns.size() - 1; j++) {
      Column c1 = activeTable.columns.get(j);
      Column c2 = activeTable.columns.get(j+1);
      float p1 = c1.convertY(activeTable.items[i].getAttribute(c1.attName));
      float p2 = c2.convertY(activeTable.items[i].getAttribute(c2.attName));
      //print(activeTable.items[i].highlighted);
      if(activeTable.items[i].highlighted) {
        stroke(255, 0, 0);
        strokeWeight(0.5);
        line(c1.getPosX(), p1, c2.getPosX(), p2);
      } 
      else {
        stroke(0);
        strokeWeight(0.5);
        line(c1.getPosX(), p1, c2.getPosX(), p2);
      }
    }
  }
}

void mouseMoved() {
  for(Column c: activeTable.columns) {
    c.rollOver(mouseX, mouseY);
  }
}

void mousePressed() {
  startX = mouseX;
  startY = mouseY;
  for(Column c: activeTable.columns) {
    if(c.highlight) {
      c.setHighlight();
      for(Item item: activeTable.items) {
        if(item.highlighted) {
          item.setHighlighted();
        }
      }
    }
    if (startX >= c.getPosX() - 25 && startX <= c.getPosX() + 25) {
      c.setHighlight();
    }
  }
}

void mouseReleased() {
  for(int i = 0; i < activeTable.columns.size(); i++) {
    Column c = activeTable.columns.get(i);
    if (c.over && c.deltaX > 50) {
        if(i + 1 < activeTable.columns.size()) {
          Column s = activeTable.columns.get(i+1);
          c.setX(s.getPosX());
          c.deltaX = 0;
          s.setX((i+1) * width/activeTable.numColumns);
          activeTable.columns.set(i, s);
          activeTable.columns.set(i+1, c);
        }
    } 
      if (c.over && c.deltaX < -50) {
        if(i - 1 >= 0) {
          Column s = activeTable.columns.get(i - 1);
          c.setX(s.getPosX());
          c.deltaX = 0;
          s.setX((i+1) * width/activeTable.numColumns);
          activeTable.columns.set(i, s);
          activeTable.columns.set(i-1, c);
        }
     }
     
      if(c.highlight) {
      for(Item item: activeTable.items){
        float val = item.getAttribute(c.attName);
        float yVal = c.convertY(val);
        if((yVal >= startY && yVal <= mouseY) || (yVal <= startY && yVal >= mouseY)) {
          item.setHighlighted();
        }
      }
    }
  }
}

void mouseDragged() {
  for(int i = 0; i < activeTable.columns.size(); i++) {
    Column c = activeTable.columns.get(i);
    if(c.over && c.deltaX >= -50 && c.deltaX <= 50) {
      c.setDX(mouseX);
      }
    } 
}

void loadData() {
  
  carData = new TableReader("cars-cleaned.tsv");
  cameraData = new TableReader("cameras-cleaned.tsv");
  foodData = new TableReader("nutrients-cleaned.tsv");
  
  activeTable = carData;
}