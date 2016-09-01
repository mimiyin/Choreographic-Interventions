int skip = 50;
int mode;
int numModes = 4;
float diag;
boolean noStroke;

void setup() {
  size(800, 800);
  diag = sqrt(sq(width)+sq(height));
  
  println("USE TAB TO CHANGE MODES");
  println("\t0: Random.");
  println("\t1: Noise.");
  println("\t2: Distance from bottom-right corner.");
  println("\t3: Distance from mouse.");
  println("USE RIGHT/LEFT to -/+ CELLSIZE.");
  println("USE 's' to turn on/off gridlines.");
}
void draw() {
  
  if(noStroke) {
    noStroke();
  }

  for (int x = 0; x < width; x+=skip) {
    for (int y = 0; y < height; y+=skip) {
      switch(mode) {
      case 0:
        fill(random(255));
        break;
      case 1:
        fill(noise(x/float(width), y/float(height))*255);
        break;
      case 2:
        fill(255*(x*y)/(width*height));
        break;
      case 3:
        float d = dist(x, y, mouseX, mouseY);
        float f = map(d, 0, diag, 255, 0);
        fill(f);
        break;
      }
      rect(x, y, skip, skip);
    }
  }
}

void keyPressed() {
  // Turn on/off stroke
  if(key == 's') noStroke = !noStroke;
  
  switch(keyCode) {
  case TAB:
    mode++;
    mode%=numModes;
    break;
  case RIGHT:
    skip++;
    break;
  case LEFT:
    skip--;
    break;
  }
  skip = constrain(skip, 1, width);
  println("MODE", mode, "SKIP", skip);
}