float h, hspeed;
boolean blackonwhite;

void setup() {
  fullScreen(P2D);
  hspeed = 5;
  rectMode(CENTER);
}

void draw() {
  h+=hspeed;  
  hspeed = turnaround(h, hspeed, 0, height/2);

  if (blackonwhite) {
    background(255);
    fill(0);
  } else {
    background(0);
    fill(255);
  }
  noStroke();
  rect(width/2, height/2, width, h);
}

float turnaround(float parameter, float speed, float min, float max) {
  if (parameter < min || parameter > max ) {
    speed *= -1;
  }
  return speed;
}

void keyPressed() {
  blackonwhite = !blackonwhite;
}