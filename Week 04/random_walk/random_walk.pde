float x, y;
float offset = 10;

void setup() {
  //size(1600,900, P2D);
  fullScreen(P2D);
  x = width/2;
  y = height/2;
}

void draw() {
  background(0);  
  offset = 100*mouseX/width;
  x += random(-offset, offset);
  y += random(-offset, offset);
  ellipse(x, y, 400, 400);
}