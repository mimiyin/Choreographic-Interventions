class Layer {
  float t, tspeed, amplitude;
  float x, y, prevX, ymin, ymax;
  float w = 5;
  float h = 10;
  float interval = 60;
  int mode = 0;

  Layer(int _mode, int _x, float _t, float _tspeed, float _amplitude) {
    mode = _mode;
    x = _x;
    t = _t;
    tspeed = _tspeed;
    amplitude = _amplitude;
  }
  void init(int l) {
    ymin = l*height/layers.size();
    ymax = (l+1) * height/layers.size();
    y = ymin;
  }

  void run() {
    if (x-prevX >= interval) {
      t+=tspeed;
      switch(mode) {
      case 0:
        interval = amplitude;
        fill(0);
        break;
      case 1:
        interval = sin(t)*amplitude/2 + amplitude/2;
        fill(0, 0, 255);
        break;
      case 2:
        interval = random(10, amplitude);
        fill(255, 0, 0);
        break;
      case 3:
        interval = noise(t)*amplitude;
        fill(255, 153, 153);
        break;
      }
      prevX = x;
      noStroke();
      rect(x, y, w, h);
      midi.playNote(64, 100, .5);
    }

    x++;

    // WRAP AROUND
    if (x > width) {
      x%=width;
      prevX-=width;
      y += h;
    }
    if (y > ymax) {
      background(255);
      x = 0;
      y = ymin;
    }
  }
}