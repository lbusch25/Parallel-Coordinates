
Column columns[];
Item items[];
ArrayList<Edge> edges;

HashMap<Item, ArrayList<Node>> itemNodes = new HashMap<Item, ArrayList<Node>>();
HashMap<Item, ArrayList<Edge>> itemEdges = new HashMap<Item, ArrayList<Edge>>();

void setup() {
  size(1000, 600);
  pixelDensity(displayDensity());
  loadData();
  print(edges.size());
} 


void draw() {
  for(Column c: columns) {
    c.draw();
  } for(Item i: itemNodes.keySet()) {
    for(Node n: itemNodes.get(i)) {
      //n.setPos();
      n.draw();
    } 
    for(Edge e: edges) {
      e.draw(); //Asl about fucking null pointer exception
    }
  }
}

void loadData() {
  Table carData = loadTable("cars-cleaned.tsv"); //Don't include "header" since we want that data
  //Table cameraData = loadTable("cameras-cleaned.tsv");
  //Table nutrientData = loadTable("nutrients-cleaned.tsv");
  columns = new Column[carData.getColumnCount() - 1];
  for(int i = 1; i < carData.getColumnCount(); i++) {
    Column c = new Column(carData.getString(0, i));
    c.setX(i*width/carData.getColumnCount());
    c.setY(500);
    c.setMax(0);
    c.setMin(100000);
    columns[i - 1] = c;
  }
  
  items = new Item[carData.getRowCount()];
  for(int i = 0; i < carData.getRowCount() - 1; i++) {
    TableRow row = carData.getRow(i);
    
    String ident = row.getString(0);
    Item item = new Item(ident);
    for(int j = 1; j < carData.getColumnCount(); j++) {
      if(row.getFloat(j) > columns[j-1].attMax) {
        columns[j-1].setMax(int(row.getFloat(j)));
      } if(row.getFloat(j) < columns[j-1].attMin) {
        columns[j-1].setMin(int(row.getFloat(j)));
      }
      item.addAttribute(columns[j-1].attName, row.getFloat(j));
      Node node = new Node(item, columns[j-1 ]);
      if(itemNodes.containsKey(item)) {
        itemNodes.get(item).add(node);
        //print(itemNodes.get(item).size());
      } else {
        ArrayList<Node> nodel = new ArrayList<Node>();
        nodel.add(node);
        itemNodes.put(item, nodel);
      }
    }
    
    items[i] = item;
    
    //item.addAttribute("mpg", row.getFloat("mpg"));
    //item.addAttribute("cylinders", row.getFloat("cylinders")
    //float mpg = row.getFloat("mpg");
    //float cyl = row.getFloat("cylinders");
    //float dsp = row.getFloat("displacement");
    //float hp = row.getFloat("horsepower");
    //float w = row.getFloat("weight");
    //float acc = row.getFloat("acceleration");
    //float m_year = row.getFloat("model year");
  }
  //edges = new Edge[items.length * columns.length];
  
  edges = new ArrayList<Edge>();
  
  
  for(int i = 0; i < items.length - 1; i++) {
    Item ti = items[i];
    ArrayList<Node> tn = itemNodes.get(ti);
    for(int j = 0; j < columns.length - 1; j++) {
      Edge e = new Edge(tn.get(j).x, tn.get(j).y, tn.get(j+1).x, tn.get(j+1).y);
      //edges[i+j] = e;
      edges.add(e);
      //print(e.from.y);
    }
  } 
  
  //int f = 0;
  //for(Item i: items) { //Change to normal for loop when not brain mush
  //  ArrayList<Node> nodes = itemNodes.get(i);
  //  print(nodes.get(0).y);
  //  ArrayList<Edge> edgeList = new ArrayList<Edge>();
  //  for(int j = 1; j < columns.length - 1; j++) {
  //    Edge e = new Edge(nodes.get(j-1), nodes.get(j));
  //    edgeList.add(e);
  //    edges[f+j] = e;
  //  }
  //  f++;
  //}
  
}