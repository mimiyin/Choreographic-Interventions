float cols, rows; // Total number of columns and rows //<>//
float cellWidth, cellHeight; // Individual cell size

float[] colPositions;
float[] colSpeeds;

float[] rowPositions;
float[] rowSpeeds;

int mode = 0;
int numModes = 6;

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

  println("TAB to change modes.");
  println("\t0: Altogether");
  println("\t1: Diagonal");
  println("\t2: Alternating");
  println("\t3: Sine");
  println("\t4: Random");
  println("\t5: Noise");

  println("Use UP/DOWN to +/- number of rows. LEFT/RIGHT to +/- number of columns.");
}

void draw() {
  background(0);
  stroke(128);
  noFill();

  // CREATE A GRID WITH SO MANY COLUMNS...
  for (int col = 0; col < cols; col++) {

    // Calculate position of column based on column number and colWidth
    float x = col*cellWidth;

    // Change column position
    colPositions[col] += colSpeeds[col];
    colSpeeds[col] = turnaround(colPositions[col], colSpeeds[col], 0, height);

    // Draw column line
    line(x, 0, x, colPositions[col]);
  }
  for (int row = 0; row < rows; row++) {

    // Calculate position of row based on row number and rowHeight
    float y = row*cellHeight;

    // Change row position
    rowPositions[row] += rowSpeeds[row];
    rowSpeeds[row] = turnaround(rowPositions[row], rowSpeeds[row], 0, width);

    // Draw row line
    line(0, y, rowPositions[row], y);
  }
}

void reset() {
  colPositions = new float[int(cols)];
  colSpeeds = new float[int(cols)];

  rowPositions = new float[int(rows)];
  rowSpeeds = new float[int(rows)];

  for (int col = 0; col < cols; col++) {
    colPositions[col] = 0;
    switch(mode) {
    case 0: // Everyone goes same speed
      colSpeeds[col] = 5;
      break;
    case 1: // Diagonal of speeds
      colSpeeds[col] = 5*col/cols;
      break;
    case 2: // Alternating speeds
      colSpeeds[col] = col%2 + 3;
      break;
    case 3: // Sine speeds
      colSpeeds[col] = sin(col/cols)*2 + 2;
      break;
    case 4: // Random speeds
      colSpeeds[col] = random(cols);
      break;
    case 5: // Noisy speeds
      colSpeeds[col] = noise(col/cols)*cols;
      break;
    }
  }

  for (int row = 0; row < rows; row++) {
    rowPositions[row] = 0;
    switch(mode) {
    case 0: // Everyone goes same speed
      rowSpeeds[row] = 5;
      break;
    case 1: // Diagonal of speeds
      rowSpeeds[row] = 5*row/rows;
      break;
    case 2: // Alternating speeds
      rowSpeeds[row] = row%2 + 3;
      break;
    case 3: // Sine speeds
      rowSpeeds[row] = sin(row/rows)*2 + 2;
      break;
    case 4: // Random speeds
      rowSpeeds[row] = random(rows);
      break;
    case 5: // Noisy speeds
      rowSpeeds[row] = noise(row/rows)*rows;
      break;
    }
  }
}

float turnaround(float parameter, float speed, float min, float max) {
  if (parameter < min || parameter > max ) {
    speed *= -1;
  }
  return speed;
}

void keyPressed() {
  
  // CHANGE MODE AND NUMBER OF COLUMNS/ROWS
  switch(keyCode) {
  case TAB:
    mode++;
    mode%=numModes;
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

  println("MODE", mode, "COLS", cols, "ROWS", rows);
}