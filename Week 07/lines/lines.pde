float x, y;
float xspeed, yspeed;

float sw;
float swspeed;

boolean blackonwhite, changeSW;
boolean h, v, d1, d2, d3, d4, d5, d6, d7;

void setup() {
  fullScreen(P2D);

  x = 0;
  y = 0;
  sw = 1;

  xspeed = 5;
  yspeed = 5;
  swspeed = 1;

  strokeCap(SQUARE);
}

void draw() {
  y+=yspeed;  
  yspeed = turnaround(y, yspeed, 0, height);

  x+=xspeed;  
  xspeed = turnaround(x, xspeed, 0, width);

  if (changeSW) {
    sw+=swspeed;  
    swspeed = turnaround(sw, swspeed, 0, height/2);
  }

  if (blackonwhite) {
    background(255);
    stroke(0);
  } else {
    background(0);
    stroke(255);
  }

  strokeWeight(sw);

  // HOLD X1 @ZERO
  // horizontal line 1
  if (h) line(0, y, width, y);
  // diagonal line 1
  if (d1) line(0, y, width, height-y);
  // diagonal line 2
  if (d2) line(0, y, width-x, height-y);

  // HOLD Y1 @ZERO
  // vertical line 1
  if (v) line(x, 0, x, height);
  // diagonal line 3
  if (d3) line(x, 0, width-x, height);
  // diagonal line 4
  if (d4) line(x, 0, width-x, height-y);

  // CHANGE BOTH X1 AND Y1
  // diagonal line 5
  if (d5) line(x, y, width-x, height);
  // diagonal line 6
  if (d6) line(x, y, width, height-y);
  // diagonal line 7
  if (d7) line(x, y, width-x, height-y);
}

float turnaround(float parameter, float speed, float min, float max) {
  if (parameter < min || parameter > max ) {
    speed *= -1;
  }
  return speed;
}

void keyPressed() {
  switch (keyCode) {
  case RETURN:
    blackonwhite = !blackonwhite;
    break;
  case TAB:
    changeSW = ! changeSW;
    if(!changeSW) sw = 1;
    break;
  } 
  switch(key) {
  case 'h':
    h = !h;
    break;
  case 'v':
    v = !v;
    break;
  case '1':
    d1 = !d1;
    break;
  case '2':
    d2 = !d2;
    break;
  case '3':
    d3 = !d3;
    break;
  case '4':
    d4 = !d4;
    break;
  case '5':
    d5 = !d5;
    break;
  case '6':
    d6 = !d6;
    break;
  case '7':
    d7 = !d7;
    break;
  }
}