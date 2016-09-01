
float y1, y2;
float y1speed, y2speed;
float h1, h2;
float h1speed, h2speed;
float w;
float wspeed;
float angle1, angle2;

void setup() {
  size(800, 600, P2D);
  y1 = height/2;
  y2 = height/2;
  h1 = 100;
  h2 = 100;
  w = width/2;

  y1speed = 1;
  y2speed = -1;
  h1speed = 1;
  h2speed = -1;
  wspeed = 1;
}

void draw() {
  background(0);


  y1+=y1speed;
  y2+=y2speed;
  h1+=h1speed;
  h2+=h2speed;
  w+=wspeed;

  y1speed = turnaround(y1, y1speed, 0, height);
  y2speed = turnaround(y2, y2speed, 0, height);
  h1speed = turnaround(h1, h1speed, 10, 200);
  h2speed = turnaround(h2, h2speed, 10, 200);
  wspeed = turnaround(w, wspeed, 0, width);

  angle1 += 0.01;
  angle2 += 0.005;


  if (y1 > height) {
    y1 = height/2; //0; //random(height/2);
  }

  noStroke();

  pushMatrix();
  translate(0, y1);
  rotate(angle1);
  rect(0, 0, w, h1);
  popMatrix();

  pushMatrix();
  translate(w, y2);
  rotate(angle2);
  rect(0, 0, width-w, h2);
  popMatrix();
}

float turnaround(float parameter, float speed, float min, float max) {
  if (parameter < min || parameter > max) {
    speed *= -1;
  }
  return speed;
}