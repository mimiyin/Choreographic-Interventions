float cols, rows; // Total number of columns and rows //<>//
float cellWidth, cellHeight; // Individual cell size

PVector[][] cells;
PVector[][] cellSpeeds;

boolean rotate;
float angle;

void setup() {
  size(1080, 720);

  cellWidth = width;
  cellHeight = height;

  // Calculate number of cols and rows based on cell size
  // The number of rows and columns is a function of
  // how many times a cell fits across/down the window
  cols = width/cellWidth;
  rows = height/cellHeight;

  // Initialize positions and speeds of cells.
  reset();

  println("Use TAB to turn on/off rotate.");
  println("Use UP/DOWN to +/- number of rows. LEFT/RIGHT to +/- number of columns.");
}

void draw() {
  background(0);
  stroke(128);
  noFill();

  // ROTATE THE GRID
  if (rotate) {
    angle+=0.001;
  }

  // TRANSLATE GRID TO MIDDLE OF THE SCREEN
  translate(width/2, height/2);
  rotate(angle);

  // CREATE A GRID WITH SO MANY COLUMNS...
  for (int col = 0; col < cols; col++) {
    // Calculate the x-position of the cell based on the column number and cellWidth
    float x = col*cellWidth;
    // ...AND SO MANY ROWS
    for (int row = 0; row < rows; row++) {
      // Calculate the y-position of the cell based on the row number and cellHeight
      float y = row*cellHeight;

      // Change w/h of the cell
      cells[col][row].add(cellSpeeds[col][row]);
      cellSpeeds[col][row].x = turnaround(cells[col][row].x, cellSpeeds[col][row].x, 0, width);
      cellSpeeds[col][row].y = turnaround(cells[col][row].y, cellSpeeds[col][row].y, 0, height);

      // Draw a rectangle for every cell
      rect(x-width/2, y-height/2, cells[col][row].x, cells[col][row].y);
    }
  }
}

// Reinitialize 2D arrys storing PVector w+h
// and PVector w+h speeds for each cell.
void reset() {
  cells = new PVector[int(cols)][int(rows)];
  cellSpeeds = new PVector[int(cols)][int(rows)];

  for (int col = 0; col < cols; col++) {
    for (int row = 0; row < rows; row++) {
      cells[col][row] = new PVector(cellWidth, cellHeight);
      cellSpeeds[col][row] = new PVector(random(-1, 1), random(-1, 1));
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