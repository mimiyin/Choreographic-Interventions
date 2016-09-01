void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(10);

  //Move the mouse to rotate around the Y-axis (vertical)
  rotateY(map(mouseX, 0, width, 0, TWO_PI));

  // Red Square 400 pixels behind the window
  pushMatrix();
  translate(0, 0, -400);
  fill(255, 0, 0);
  rect(0, 0, width, height);
  line(0, height/2, width, height/2);
  popMatrix();

  // Green Square @ the window
  pushMatrix();
  fill(0, 255, 0);
  translate(0, 0, 0);
  rect(0, 0, width, height);
  line(0, height/2, width, height/2);
  popMatrix();

  // Blue Square 400 pixels in front of the window
  pushMatrix();
  fill(0, 0, 255);
  translate(0, 0, 400);
  rect(0, 0, width, height);
  line(0, height/2, width, height/2);
  popMatrix();

  // Which one of these pushMatrix(), popMatrix() is unecessary?
  // How can we remove almost 2/3rds of the code here?
}