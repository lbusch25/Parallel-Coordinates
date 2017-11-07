/*Testing

void setup(){
loadData();

}

void loadData(){
  TableReader tr = new TableReader("cars-cleaned.tsv");
  println("columnNum: "+tr.numColumns);
  println("rowNum: "+tr.numRows);
  for (int i = 0;i<tr.numColumns;i++){
    print("column "+i+": "+ tr.columnNames[i]+" ");
  }
  for (int i =0;i<tr.numRows;i++){
    for(String s: tr.items[i].attributes.keySet()){
      println(s+ " "+ tr.items[i].attributes.get(s));
    
    }
  
  }
  

}
*/

/*
  TableReader Class 11/7/2017
    **reads data table input and stores in column array and item array (for row information)
*/
class TableReader{
  Table dataTable;
  public Item[] items;
  public String[] columnNames;
  public int numColumns;
  public int numRows;
  
  //Constructor takes in filePath of Table as argument
  TableReader(String filePath){
    
    dataTable = loadTable(filePath, "header");
    items = new Item[dataTable.getRowCount()];
    columnNames = new String[dataTable.getColumnCount()];
    
    numRows = dataTable.getRowCount();
    numColumns = dataTable.getColumnCount();
    
    loadColumns(); //updates columnName array with columns from data
    loadItems(); //updates item array with each items row information
    
    
    
  
  }
  
  /*inputs the column names read from the dataTable*/
  void loadColumns(){
    columnNames = dataTable.getRow(0).getColumnTitles();
  }
  
  /*inputs the items from each row*/
  void loadItems(){
    TableRow row; 
    for (int i = 0;i<numRows;i++){
      row = dataTable.getRow(i); 
      items[i] = new Item(row.getString(columnNames[0]));
      
      for (int j = 1; j<numColumns; j++){
        items[i].addAttribute(columnNames[j],row.getFloat(columnNames[j]));// adds each data attribute of the item to hashmap
      }
      
  
    }
  }
  /*getter for numRows*/
  int getNumRows(){
    return numRows;
  }
  
  /*getter for numColumns*/
  int getNumColumns(){
    return numColumns;
  }

}