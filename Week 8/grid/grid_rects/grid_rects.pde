float cols, rows; // Total number of columns and rows //<>// //<>//
float cellWidth, cellHeight; // Individual cell size

void setup() {
  size(1080, 720);

  cellWidth = width;
  cellHeight = height;

  // Calculate number of cols and rows based on cell size
  // The number of rows and columns is a function of
  // how many times a cell fits across/down the window
  cols = width/cellWidth;
  rows = height/cellHeight;

  println("Use UP/DOWN to +/- number of rows. LEFT/RIGHT to +/- number of columns.");
}

void draw() {
  background(0);
  stroke(255);
  noFill();

  // CREATE A GRID OF CELSS WITH SO MANY COLUMNS...
  for (int col = 0; col < cols; col++) {
    // Calculate the x-position of the cell based on the column number and cellWidth
    float x = col*cellWidth;

    // ...AND SO MANY ROWS
    for (int row = 0; row < rows; row++) {
      // Calculate the y-position of the cell based on the row number and cellHeight
      float y = row*cellHeight; 
      
      // Draw a rectangle for every cell
      rect(x, y, cellWidth, cellHeight);
    }
  }
}

void keyPressed() {
  
  // CHANGE NUMBER OF ROWS AND COLUMNS
  switch(keyCode) {
  case UP:
    rows++;
    break;
  case DOWN:
    rows--;
    break;
  case RIGHT:
    cols++;
    break;
  case LEFT:
    cols--;
    break;
  }

  // CAN'T HAVE LESS THAN 1 COLUMN OR MORE COLUMNS THAN PIXELS ACROSS THE WINDOW
  cols = constrain(cols, 1, width);
  // CAN'T HAVE LESS THAN 1 ROW OR MORE ROWS THAN PIXELS DOWN THE WINDOW
  rows = constrain(rows, 1, height);
  
  // RE-CALCULATE CELLWIDTH AND CELL HEIGHT WITH NEW NUMBER OF COLS/ROWS.
  cellWidth = width/cols;
  cellHeight = height/rows;
  
  println("COLS", cols, "ROWS", rows);
}