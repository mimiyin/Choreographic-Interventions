// MIDI library
import arb.soundcipher.*;
SoundCipher midi;

// Number of frames to wait before beeping again
// Processing runs at 60 frames per second
float interval = 1;
float t = 0;
float tspeed = 0.1;
float amplitude = 30;
int mode;


// Variables for drawing rectangle per beep
float x, y;
float prevX;
float w = 5;
float h = 10;

void setup() {
  size(800, 400);
  background(255);

  // Fire-up the midi
  midi = new SoundCipher(this);
  midi.instrument = 39;

  println("Press TAB to change modes.");
  println("\t 0: Fixed (Black)");
  println("\t 1: Sin (Blue)");
  println("\t 2: Random (Red)");
  println("\t 3: Noise (Pink)");

  println("Use UP/DOWN to adjust intervals in manual mode.");
  println("Press ENTER to toggle sound mode.");
}

void draw() {

  // When enough time has elapsed
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

  if (y > height) {
    background(255);
    x = 0;
    y = 0;
  }
}


void keyPressed() {


  switch (keyCode) {
  case RIGHT:
    tspeed+=0.01;
    break;
  case LEFT:
    tspeed-=0.01;
    break;
  case UP:
    amplitude++;
    break;
  case DOWN:
    amplitude--;
    break;
  case TAB:
    mode++;
    mode%=4;
    break;
  }

  // Never let the interval go below 1 frame
  if (amplitude < 1) {
    amplitude = 1;
  }

  // Never let the tspeed go below 0
  if (tspeed < 0) {
    tspeed = 0;
  }

  print("MODE", mode, "INTERVAL", interval, "BPM", 3600/interval, "AMPLITUDE", amplitude);
  if (mode == 1 || mode == 3) println(" TSPEED", tspeed);
  else println();

  switch (key) {
  case '1':
    midi.instrument = 39;
    break;
  case '2':
    midi.instrument = 46;
    break;
  case '3':
    midi.instrument = 47;
    break;
  case '4':
    midi.instrument = 123;
    break;
  }
}