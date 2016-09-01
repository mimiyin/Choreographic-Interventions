float sz, speed; //<>//

void setup() {
  //size(1600, 900, P2D);
  fullScreen(P2D);
  noStroke();
  sz = 0;
  speed = 5;
}


void draw() {
  background(0);
  
  sz+=speed;
  if (sz > width || sz < 0) {
    speed *= -1;
  }
  
  ellipse(mouseX, mouseY, sz, sz);
  
  // What if we add a 2nd light?
}