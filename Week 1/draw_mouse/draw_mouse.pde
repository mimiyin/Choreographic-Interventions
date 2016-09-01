float sw = 1;

void setup() {
  // Set up your stage
  size(800, 600);
  //fullScreen();
  background(255);
}

void draw() {
  // Calculate how thick to make the line based on speed of mouse
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  sw = dist/10;
  
  // Look up other ways to draw stuff in the reference
  strokeWeight(sw);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

// Look up other interaction modes in the reference.
// What do you need to change to get these key commands to take effect?
void keyPressed() {
  switch(keyCode) {
  case UP:
    sw += 10;
    break;
  case DOWN:
    sw -= 10;
    break;
  case RIGHT:
    sw ++;
    break;
  case LEFT:
    sw --;
    break;
  }
 
  sw = constrain(sw, 1, 100);
}