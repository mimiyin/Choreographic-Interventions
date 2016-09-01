/* Draw 1 trail of mouse positions */

ArrayList<PVector> trail;

void setup() {
  // Set up your stage
  size(800, 600);
  //fullScreen();
  background(255);

  trail = new ArrayList<PVector>();
}

void draw() {
  background(0);

  // Look up other ways to draw stuff in the reference
  //line(mouseX, mouseY, pmouseX, pmouseY);

  // Grab the mouse position and store it in a PVector
  PVector mouse = new PVector(mouseX, mouseY);

  // Add the current mouse position to the ArrayList trail1
  trail.add(mouse);


  // When trail1 has more than 100 positions, delete the oldest one
  if (trail.size() > 100) {
    trail.remove(0);
  } 

  // Draw trail
  // Calculate the size of the ellipse for each position in the trail based off it's "age" (counter)
  int counter = 0;
  fill(255, 32);
  noStroke();
  for (PVector t : trail) {
    counter++;
    ellipse(t.x, t.y, 2*counter, 2*counter);
  }
}