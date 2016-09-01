float x = 0;
int dir = 1;

void setup() {
  size(1280, 600, P2D);
  //fullScreen(P2D);
  background(0);
  noStroke();
}


void draw() {
  float xspeed;
  
  if(dir > 0) {
    xspeed = (width-x)*.05;
  }
  else {
    xspeed = (0-x)*.05;
  }
  
  x+=xspeed;
  
  if (width-x < 1 || 0-x > -1){
    dir *= -1;
  }
  
  background(0);
  fill(255);
  ellipse(x, height/2, 100, 100);
} //<>//