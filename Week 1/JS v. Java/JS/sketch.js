// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

var walker;

function setup() {
  createCanvas(400, 400);
  walker = new Walker();
};

function draw() {
  background(0);
  walker.step();
  walker.render();
};

function Walker() {
  this.steps = [createVector(width / 2, height / 2)];

  this.render = function() {
    stroke(255);
    noFill();
    beginShape();
    for (var i = 0; i < this.steps.length; i++) {
      vertex(this.steps[i].x, this.steps[i].y);
    }
    endShape();
  };

  this.step = function() {
    var offset = 10;
    var newStep = createVector(random(-offset, offset), random(-offset, offset));
    newStep.add(this.steps[this.steps.length - 1]);
		constrain(newStep.x, 0, width - 1);
		constrain(newStep.y, 0, height - 1);
    println("NEW STEP: " + newStep);
    this.steps.push(newStep);
  }
}