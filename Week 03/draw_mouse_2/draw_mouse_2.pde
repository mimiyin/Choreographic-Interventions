/* Drawing 2 trails */

ArrayList<PVector> trail1;
ArrayList<PVector> trail2;

void setup() {
  // Set up your stage
  size(800, 600);
  //fullScreen();
  background(255);

  trail1 = new ArrayList<PVector>();
  trail2 = new ArrayList<PVector>();
}

void draw() {
  background(0);

  // Look up other ways to draw stuff in the reference
  //line(mouseX, mouseY, pmouseX, pmouseY);

  // Grab the mouse position and store it in a PVector
  PVector mouse = new PVector(mouseX, mouseY);

  // Add the current mouse position to the ArrayList trail1
  trail1.add(mouse);

  // Calculate a new position that's randomly offset from the mouse position by up to 50 pixels
  PVector noodle = new PVector(mouseX + random(-50, 50), mouseY + random(-50, 50));

  // Add that new position to the ArrayList trail2
  trail2.add(noodle);

  // When trail1 has more than 100 positions, delete the oldest one
  if (trail1.size() > 100) {
    trail1.remove(0);
  }

  // When trail2 has more than 100 positions, delete the oldest one
  if (trail2.size() > 100) {
    trail2.remove(0);
  }

  // Draw trail1
  // Calculate the size of the ellipse for each position in the trail based off it's "age" (counter)

  int counter1 = 0;
  fill(255, 32);
  noStroke();
  for (PVector t : trail1) {
    counter1++;
    ellipse(t.x, t.y, 2*counter1, 2*counter1);
  }   

  // Draw trail2
  // Calculate the size of the ellipse for each position in the trail based off it's "age" (counter)
  int counter2 = 0;
  fill(255, 32);
  noStroke();
  for (PVector t : trail2) {
    counter2++;
    ellipse(t.x, t.y, 2*counter2, 2*counter2);
  }
}