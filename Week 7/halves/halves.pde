float w;
float wspeed;

void setup() {
  fullScreen(P2D);
  wspeed = 5;
}

void draw() {
  w+=wspeed;
  wspeed = turnaround(w, wspeed, 0, width);
  
  fill(255);
  noStroke();
  rect(0, 0, w, height);

  fill(0);
  rect(w, 0, width-w, height);
  
  //How would we make this divide vertically?
}

float turnaround(float parameter, float speed, float min, float max) {
  if (parameter < min || parameter > max ) {
    speed *= -1;
  }
  return speed;
}