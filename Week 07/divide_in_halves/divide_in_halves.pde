boolean horizontal, vertical, leftRight, rightLeft;

void setup() {
  size(1600, 800);
  rectMode(CENTER);
  stroke(255);
}

void draw() {
  background(0);

  if (horizontal) {
    line(0, height/2, width, height/2);
  }

  if (vertical) {
    line(width/2, 0, width/2, height);
  }

  if (leftRight) {
    line(0, 0, width, height);
  }

  if (rightLeft) {
    line(width, 0, 0, height);
  }
}

void keyPressed() {
  switch(key) {
  case '1':
    horizontal = !horizontal;
    break;
  case '2':
    vertical = !vertical;
    break;
  case '3':
    leftRight = !leftRight;
    break;
  case '4':
    rightLeft = !rightLeft;
    break;
  }
}