float a = 255;
boolean flicker;

void setup()
{
    size(600, 600, P2D);
  //fullScreen(P2D);
  rectMode(CENTER);
  noStroke();
}

void draw()
{
  // Calc distance traveled by mouse between this frame and previous frame
  float d = dist(mouseX, mouseY, pmouseX, pmouseY);

  // Mode 5: Button with inertia
  // If distance was > a quarter of the screen, set alpha to 255
  // How else could you affect alpha?
  // THIS IS YOUR FINAL!!!
  if (d > width/4) {
    a = 255;
  }
  
  //a = map(d, 0, width, 0, 255);
  
  //if(d > 10) {
  // a++; 
  //}
  
  // Alpha is always decreasing
  a --;

  // Mode 4: Mapping to velocity
  // Map height to the distance travelled
  float h = map(d, 0, width, 0, height*2);

  // Mode 3: Mapping to space
  // Map the width of the rect to the mouseX position
  float w =  map(mouseX, 0, width, 0, width/2);

  // Mode 2: Button
  // If mouse is on right side of screen, draw, white on black
  if (mouseX > width/2) {
    background(0);
    fill(255, a);

    // Otherwise draw black on white
  } else {
    background(255);
    fill(0, a);
  }

  // Mode 1: Light Switch
  if (flicker) {
    background(random(255), random(255), random(255));
  }

  // Draw a rect in the center of a certain width and height
  rect(width/2, height/2, w, h);
}

void keyPressed() {
  flicker = !flicker;
}