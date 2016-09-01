// MIDI library
import arb.soundcipher.*;
SoundCipher midi;

// Number of frames to wait before beeping again
// Processing runs at 60 frames per second
float interval = 60;

void setup() {
  size(800, 400);
  //fullScreen(P2D);

  background(255);

  // Fire-up the midi
  midi = new SoundCipher(this);
  midi.instrument = 39;

  println("Press TAB to change modes.");
  println("Use UP/DOWN to adjust intervals in manual mode.");
  println("Press ENTER to toggle sound mode.");
}

void draw() {
  background(0);
  // When enough time has elapsed
  if (frameCount%interval == 0) {
    midi.playNote(64, 100, .5);
    fill(255);
    rect(0, 0, width, height);
  }
}


void keyPressed() {

  // Manually adjust interval
  switch (keyCode) {
  case RIGHT:
    interval*=2;
    break;
  case LEFT:
    interval*=.5;
    break;
  case UP:
    interval++;
    break;
  case DOWN:
    interval--;
    break;
  case TAB:
    interval = 60;
    break;
  }

  // Pick an instrument
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
  case 'g': // Grave 25bpm
    interval = 3600/25;
    break;
  case 'l': // Largo 45 bpm
    interval = 3600/45;
    break;
  case 'd': // Adagio 70 bpm
    interval = 3600/70;
    break;
  case 'n': // Andante 100bpm
    interval = 3600/100;
    break;
  case 'a': // Allegro 135bpm
    interval = 3600/135;
    break;
  case 'v': // Vivace 170bpm
    interval = 3600/170;
    break;
  case 'p': // Presto 200bpm
    interval = 3600/200;
    break;
  }

  interval = int(interval);

  // Never let the interval go below 1
  if (interval < 1) {
    interval = 1;
  }

  println("INTERVAL", interval, "BPM", int(3600/interval));
}