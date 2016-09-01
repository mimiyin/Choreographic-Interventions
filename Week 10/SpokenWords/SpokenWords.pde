/**
 * This sketch demonstrates how to play a file with Minim using an AudioPlayer. <br />
 * It's also a good example of how to draw the waveform of the audio. Full documentation 
 * for AudioPlayer can be found at http://code.compartmental.net/minim/audioplayer_class_audioplayer.html
 * <p>
 * For more information about Minim and additional features, 
 * visit http://code.compartmental.net/minim/
 */

import ddf.minim.*;
Minim minim;


AudioPlayer yo, zing;
ArrayList<AudioPlayer>buddhas = new ArrayList<AudioPlayer>();
Button b1, b2, b3;

PVector mouse;
float t;

void setup()
{
  size(600, 600, P3D);

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  yo = minim.loadFile("yo.wav");
  zing = minim.loadFile("zing.mp3");

  for (int i = 0; i < 10; i++) {
    buddhas.add(minim.loadFile(i + ".mp3"));
  }

  b1 = new Button(new PVector(width/3, height/3));
  b2 = new Button(new PVector(2*width/3, height/3));
  b3 = new Button(new PVector(width/2, 2*height/3));

  rectMode(CENTER);
}

void draw()
{
  background(255);  
  mouse = new PVector(mouseX, mouseY);
  t+=0.01;

  // Where is the mouse relative to the buttons?
  if (b1.isEntering()) {
    if (yo.position() > yo.length()-1000) yo.cue(0);
    yo.play();
  } else if (b2.isEntering()) {
    //AudioPlayer player = buddhas.get(int(random(buddhas.size())));
    AudioPlayer player = buddhas.get(int(noise(t)*buddhas.size()));
    if (player.position() > player.length()-1000) player.cue(0);
    player.play();
  } else if (b3.isEntering()) {
    if (zing.position() > zing.length()-1000) zing.cue(0);
    zing.play();
  }

  b1.display();
  b2.display();
  b3.display();
}