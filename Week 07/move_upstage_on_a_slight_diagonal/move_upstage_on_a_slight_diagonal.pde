float x,y;
void setup(){
  size(800, 600);

  x = (width/2) - 10;
  y = height-10;
  
  noStroke();
  
}

void draw(){
  x-=.2;
  y--;
  
  background(0);
  
  fill(255, 0, 0);
  ellipse(x, y, 10, 10);
  
  // Horizontal movement
  fill(128);
  ellipse(x, height-10, 10, 10);
  
  // Vertical movement
  fill(128);
  ellipse((width/2)-10, y, 10, 10);
  
  fill(255, 32);
  rect(0, 0, x, height);
  rect(0, y, width, height-y);  

  
}