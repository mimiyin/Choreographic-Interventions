float x, y;
float xspeed, yspeed;

float w1, w2, h1, h2;
float w1speed, h1speed, w2speed, h2speed;

float angle;

boolean blackonwhite;

void setup() {
  fullScreen(P2D);

  x = width/2;
  y = height/2;
  
  xspeed = 5;
  yspeed = 3;

  w1 = width/2;
  h1 = height/2;

  w2 = width/2;
  h2 = height/2;

  w1speed = 1;
  h1speed = 2;

  w2speed = 3;
  h2speed = 5;

  noStroke();
}


void draw() {

  //x+=wspeed;
  //y+=hspeed;

  //xspeed = turnaround(x, xspeed, 0, width);
  //yspeed = turnaround(y, yspeed, 0, height);

  w1+=w1speed;
  h1+=h1speed;

  w2+=w2speed;
  h2+=h2speed;

  w1speed = turnaround(w1, w1speed, width/2, width);
  h1speed = turnaround(h1, h1speed, 0, height);

  w2speed = turnaround(w2, w2speed, 0, width);
  h2speed = turnaround(h2, h2speed, height/2, height);


  //angle += .005;

  if (blackonwhite) {
    background(255);
    fill(0);
  } else {
    background(0);
    fill(255);
  }

  translate(x, y);
  rotate(angle);
  beginShape();
  vertex(-w1/2, -h1/2);
  vertex(w1/2, -h2/2);
  vertex(w2/2, h2/2);
  vertex(-w2/2, h1/2);
  endShape();

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