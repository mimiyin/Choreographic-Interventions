// MIDI library
import arb.soundcipher.*;
SoundCipher midi;

// Number of frames to wait before beeping again
// Processing runs at 60 frames per second
float interval = 1;
float easing = 0.05;

// Variables for drawing rectangle per beep
float x, y;
float prevX, prevY;
float threshold = 60;

void setup() {
  size(1920, 1080);
  background(255);

  // Fire-up the midi
  midi = new SoundCipher(this);
  midi.instrument = 39;

  println("Use UP/DOWN to adjust easing.");
  println("Use RIGHT/LEFT to adjust threshold.");
}

void draw() {

  background(255);

  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;

  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;

  ellipse(x, y, 50, 50);

  // When enough time has elapsed
  if (dist(x, y, prevX, prevY) >= threshold) {   
    midi.playNote(64, 100, .5);
    prevX = x;
    prevY = y;
  }
}


void keyPressed() {


  switch (keyCode) {
  case RIGHT:
    easing+=0.01;
    break;
  case LEFT:
    easing-=0.01;
    break;
  case UP:
    threshold++;
    break;
  case DOWN:
    threshold--;
    break;
  }
  if(easing < 0) {
    easing = 0.01;
  }
  
  if (threshold < 1) {
    threshold = 1;
  }

  println("EASING", easing, "THRESHOLD", threshold);

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