float cols, rows; // Total number of columns and rows //<>// //<>//
float cellWidth, cellHeight; // Individual cell size
float[] colPositions;
float[] rowPositions;
float[] colSpeeds;
float[] rowSpeeds;

boolean rotate;
float angle;

void setup() {
  size(1080, 720);

  cellWidth = float(width);
  cellHeight = float(height);

  // Calculate number of cols and rows based on cell size
  // The number of rows and columns is a function of
  // how many times a cell fits across/down the window
  cols = width/cellWidth;
  rows = height/cellHeight;

  // Initialize positions and speeds of cols and rows.
  reset();

  println("Use TAB to turn on/off rotate.");
  println("Use UP/DOWN to +/- number of rows. LEFT/RIGHT to +/- number of columns.");
}

void draw() {
  background(0);
  stroke(128);
  noFill();

  if (rotate) {
    angle+=0.01;
  }

  translate(width/2, height/2);
  rotate(angle);

  // CREATE A GRID WITH SO MANY COLUMNS...
  for (int col = 0; col < colPositions.length; col++) {

    // Change position of col
    colPositions[col]+=colSpeeds[col];
    colSpeeds[col] = turnaround(colPositions[col], colSpeeds[col], 0, width);

    line(colPositions[col]-width/2, -width, colPositions[col]-width/2, width);
  }
  for (int row = 0; row < rowPositions.length; row++) {

    // Change position of row
    rowPositions[row]+=rowSpeeds[row];
    rowSpeeds[row] = turnaround(rowPositions[row], rowSpeeds[row], 0, height);

    line(-width, rowPositions[row]-height/2, width, rowPositions[row]-height/2);
  }
}

// Initialize arrays storing col/row positions and speeds
// based updated values for cols and rows.
void reset() {

  colPositions = new float[int(cols)];
  rowPositions = new float[int(rows)];
  colSpeeds = new float[int(cols)];
  rowSpeeds = new float[int(rows)];

  for (int col = 0; col < colPositions.length; col++) {
    colPositions[col] = col*cellWidth;
    colSpeeds[col] = random(-1, 1);
  }
  for (int row = 0; row < rowPositions.length; row++) {
    rowPositions[row] = row*cellHeight;
    rowSpeeds[row] = random(-1, 1);
  }
}


float turnaround(float parameter, float speed, float min, float max) {
  if (parameter < min || parameter > max ) {
    speed *= -1;
  }
  return speed;
}

void keyPressed() {

  // CHANGE NUMBER OF ROWS AND COLUMNS
  switch(keyCode) {
  case TAB:
    rotate = !rotate;
    break;
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

  reset();

  println("COLS", cols, "ROWS", rows);
}