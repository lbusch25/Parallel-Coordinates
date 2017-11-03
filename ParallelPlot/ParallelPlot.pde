void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
} 


void draw() {
  
}

void loadData() {
  Table carData = loadTable("cars-cleaned.tsv");
  Table cameraData = loadTable("cameras-cleaned.tsv");
  Table nutrientData = loadTable("nutrients-cleaned.tsv");
  
  
}