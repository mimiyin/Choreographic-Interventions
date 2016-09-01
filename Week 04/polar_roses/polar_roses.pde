
float x, y; // Location x and y
float xa, ya; // Amplitude for x and y
float xf, yf; //  Frequency for x and y
float angle; //Radians - where are we along the circumference of the circle?

boolean adjustX; // Whether we're adjusting X or Y frequency/amplitude


void setup() {
  //size(1280, 600);
  fullScreen();
  background(0);
  noStroke();
  fill(255);

  xf = 1;
  yf = 1;
  xa = width/2;
  ya = height/4;

  println("Press TAB to switch between adjusting X and Y. ENTER to clear screen.");
  println("UP/DOWN to adjust amplitude.\tRIGHT/LEFT to adjust frequency.");
}


void draw() {
  background(0);
  // Keep moving around the circle
  angle+=0.01; 
  // Calculate location with sin and cos
  x = cos(angle*xf)*xa + width/2;
  y = sin(angle*yf)*ya + height/2; 

  // Draw!
  ellipse(x, y, 100, 100);
  //rect(x, 0, 100, height);
  //rect(x, height-y, 100, 100);
}

void keyPressed() {
  switch(keyCode) {
  case UP:
    if (adjustX) xa+=10; 
    else ya+=10;
    break;
  case DOWN:
    if (adjustX) xa-=10; 
    else ya-=10;
    break;
  case RIGHT:
    if (adjustX) xf+=.5; 
    else yf+=.5;
    break;
  case LEFT:
    if (adjustX) xf-=.5; 
    else yf-=.5;
    break;
  case TAB:
    adjustX = !adjustX;
    println("ADJUSTING " + (adjustX ? "X" : "Y"));
    break;
  case ENTER:
    background(0);
    break;
  }

  xa = constrain(xa, 0, width);
  ya = constrain(ya, 0, width);
  xf = constrain(xf, 0, 10);
  yf = constrain(yf, 0, 10);

  println("X-AMP: " + xa + "\t\tY-AMP: " + ya + "\t\tX-FREQ: " + xf + "\t\tY-FREQ: " + yf);
}