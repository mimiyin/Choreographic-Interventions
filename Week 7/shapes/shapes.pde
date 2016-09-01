float x, y;
float xspeed, yspeed;

float w, h;
float wspeed, hspeed;

float angle;

boolean blackonwhite;

void setup() {
  fullScreen(P2D);

  x = width/2;
  y = height/2;
  
  xspeed = 5;
  yspeed = 5;

  w = 150;
  h = 150;

  wspeed = 5;
  hspeed = 5;

  noStroke();
}


void draw() {

  //x+=wspeed;
  //y+=hspeed;

  //xspeed = turnaround(x, xspeed, 0, width);
  //yspeed = turnaround(y, yspeed, 0, height);

  w+=wspeed;
  h+=hspeed;

  wspeed = turnaround(w, wspeed, 150, height);
  hspeed = turnaround(h, hspeed, 150, height);


  angle += .005;

  if (blackonwhite) {
    background(255);
    fill(0);
  } else {
    background(0);
    fill(255);
  }

  translate(x, y);
  rotate(angle);

  // DRAW TRIANGLE
  beginShape();
  vertex(0, -h/2);
  vertex(-w/2, h/2);
  vertex(w/2, h/2);
  endShape();
  
  // DRAW RECTANGLE
  //rectMode(CENTER);
  //rect(0, 0, w, h);
  
  // DRAW ELLIPSE
 // ellipse(0, 0, w, h);
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