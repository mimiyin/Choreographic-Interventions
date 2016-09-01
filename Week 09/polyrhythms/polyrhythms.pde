// MIDI library
import arb.soundcipher.*;
SoundCipher midi;

ArrayList<Layer>layers = new ArrayList<Layer>();

void setup() {
  size(800, 400);
  background(255);

  // Fire-up the midi
  midi = new SoundCipher(this);
  midi.instrument = 39;
  
  frameRate(30);
  
  // Create new rhythm layers
  // Parameters: mode, t, tspeed, amplitdue
  // t, tspeed is only important for modes 1 and 3 (Sin and Noise)
  // Amplitude will set the maximum interval length between beats
  
  // Regular
  //layers.add(new Layer(0, 0, 0, .01, 30));
  //layers.add(new Layer(0, 15, 0, .01, 30));
  //layers.add(new Layer(0, 25, 0, .01, 30));
  
  // Irregular
  //layers.add(new Layer(0, 0, 0, .01, 30));
  //layers.add(new Layer(0, 0, 0, .01, 60));
  //layers.add(new Layer(0, 0, 0, .01, 50));
  //layers.add(new Layer(0, 0, 0, .01, 110));

  // SIN + COS  
  //layers.add(new Layer(1, 0, 0, .04, 15));
  //layers.add(new Layer(1, 0, PI/2, .04, 15));
  
  // SIN + SIN with 2x tspeed and 2x the amplitude
  // RAISE YOUR HAND WHEN YOU FEEL THE RHYTHM SHIFT
  //layers.add(new Layer(1, 0, 0, .02, 15));
  //layers.add(new Layer(1, 0, 0, .04, 30));
  
  // Initialize all the layers now that we know how many there are.
  for(int l = 0; l < layers.size(); l++) {
    layers.get(l).init(l);
  }

  println("Press TAB to change modes.");
  println("\t 0: Fixed (Black)");
  println("\t 1: Sin (Blue)");
  println("\t 2: Random (Red)");
  println("\t 3: Noise (Pink)");

  println("Use UP/DOWN to adjust intervals in manual mode.");
  println("Press ENTER to toggle sound mode.");
}

void draw() {
  // Run layers
  for (Layer l : layers) {
    l.run();
  }
}

void keyPressed() {

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