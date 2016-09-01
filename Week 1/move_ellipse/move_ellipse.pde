
float x, y;

void setup() {
  size(800, 600); 

  x = 600;
  y = 600;
}


void draw() {
  x -= .33;
  y --;

  background(0);
  ellipse(x, y, 10, 10);
}

void keyPressed() {
 noLoop(); 
}