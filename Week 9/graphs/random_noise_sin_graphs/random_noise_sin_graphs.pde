float x;
float ry, pry;
boolean r, n, s;
void setup() {
  size(1280, 720);
  background(0);
}


void draw() {
  if (r || n || s) {
    x++;
    if (x > width) {
      background(0);
      x = 0;
    }
  }

  if (r) {
    ry = height/5 + random(-height/8, height/8);
    stroke(255);
    line(x, ry, x-1, pry);
  } 
  
  if (n) {
    noStroke();
    ellipse(x, height/2 + ((noise(20*x/width)*(height/4)) - (height/8)), 5, 5);
  } 
  
  if (s) {
    noStroke();
    ellipse(x, sin(4*TWO_PI*x/width)*height/8 + 3*height/4, 5, 5);
  }

  pry = ry;
}

void keyPressed() {
  
  if(keyCode == TAB) {
   background(0);
   x = 0;
  }
  
  if (key == '1') {
    r = !r;
  } else if (key == '2') {
    n = !n;
  } else if (key == '3') {
    s = !s;
  }
}