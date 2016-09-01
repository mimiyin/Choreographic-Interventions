// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker w;

void setup() {
  size(400, 400);
 //<>//
  // Create a walker object
  w = new Walker();
}

void draw() {
  background(0);

  // Run the walker object
  w.walk();
  w.render();
}

class Walker {
  float x, y, px, py;
  ArrayList<PVector>steps = new ArrayList<PVector>();

  Walker() {
    steps.add(new PVector(width/2, height/2));
  }

  void render() {
    stroke(255);
    noFill();
    beginShape();
    for (PVector step : steps) {
      vertex(step.x, step.y);
    }
    endShape();
  }

  void walk() {
    int offset = 10;
    PVector newStep = new PVector(random(-offset, offset), random(-offset, offset));
    newStep.add(steps.get(steps.size()-1));
    constrain(newStep.x, 0, width-1);
    constrain(newStep.y, 0, height-1);
    println("NEW STEP", newStep);
    steps.add(newStep);
  }
}