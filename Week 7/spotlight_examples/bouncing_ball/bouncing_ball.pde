float x;
float xspeed = 10;

void setup() {
  //size(1280, 600, P2D);
  fullScreen(P2D);
  background(0);
  noStroke();
}


void draw() {
  
  x += xspeed;
  if (x > width || x < 0){
    xspeed *= -1;
  }
  
  background(0);
  fill(255);
  ellipse(x, height/2, 100, 100);
}