class Button {
  PVector pos;
  float d = 100;
  boolean isOn;

  Button(PVector _pos) {
    pos = _pos;
  }

  boolean isEntering() {
    return !isOn && PVector.dist(mouse, pos) < d/2;
  }

  
  void display() {
    isOn = PVector.dist(mouse, pos) < d/2;
    fill(0);
    noStroke();
    ellipse(pos.x, pos.y, d, d);
  }
}