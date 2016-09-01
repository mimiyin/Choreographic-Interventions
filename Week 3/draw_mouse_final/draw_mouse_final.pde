/* Draw 2 trails using functions to reduce repetition in code */

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
  
  // Draw trail 1 with an opacity of 64
  drawTrail(trail1, 64);
  
  // Draw trail 2 with an opacity of 32
  drawTrail(trail2, 32);

}

// Function for drawing trails
void drawTrail(ArrayList<PVector> trail, float alpha) {
  
  // When trail has more than 100 positions, delete the oldest one
  if (trail.size() > 100) {
    trail.remove(0);
  }
  
  // Draw the trail
  // Calculate the size of the ellipse for each position in the trail based off it's "age" (counter)
  int counter = 0;
  fill(255, alpha);
  noStroke();
  for (PVector t : trail) {
    counter++;
    float sz = calcSize(counter);
    ellipse(t.x, t.y, sz, sz);
  }   
  angle = 0;
}

// Function for calculating size of the ellipse for each position using the sin function
float angle = 0;
float calcSize(float base) {
  angle += 0.05;
  return base*sin(angle);
}