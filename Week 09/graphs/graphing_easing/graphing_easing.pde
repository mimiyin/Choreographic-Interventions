//GRAPHING HOW SPEED CHANGES WITH EASING

float x, y1, y2, y3, y4;

void setup() {
  size(800, 800);
  background(0);
  noStroke();
}

void draw() {
  println(x, y2, y2);
  x++;
  
  y1 += (height-y1)*.01;
  ellipse(x, y1, 10, 10);
  
  y2 += (height-y2)*.05;
  ellipse(x, y2, 10, 10);

  //y3 += (height-y3)*.001;
  //ellipse(x, y3, 10, 10);
  
  //y4 += (height-y4)*.005;
  //ellipse(x, y4, 10, 10);
}