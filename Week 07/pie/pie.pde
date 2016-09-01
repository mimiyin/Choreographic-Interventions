int numSlices = 3;

void setup() {
  size(1080, 720);
  //fullScreen();  
}


void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(1);
  for (int i = 0; i < numSlices; i++) {
    float angle = map(i, 0, numSlices, 0, TWO_PI);
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);
    line(0, 0, width, height);
    popMatrix();
  }
}

void keyPressed() {
  switch(keyCode) {
  case RIGHT:
    numSlices++;
    break;
  case LEFT:
    numSlices--;
    break;
  }
  
  numSlices = constrain(numSlices, 0, 100);
  println("NUM SLICES", numSlices);
}