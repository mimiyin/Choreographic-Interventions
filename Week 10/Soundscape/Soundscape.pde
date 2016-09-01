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
AudioPlayer marimba, rain, thunder;
float thunderGain;

void setup()
{
  size(400, 400, P2D);

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  marimba = minim.loadFile("marimba.mp3");
  rain = minim.loadFile("rain.mp3");
  thunder = minim.loadFile("thunder.mp3");

  marimba.loop();
  rain.loop();
  thunder.loop();
  
}

void draw()
{
  background(0);
  stroke(255);
  
  float marimbaGain = map(mouseX, 0, width, -48, 6);
  marimba.setGain(marimbaGain);

  float rainGain = map(mouseY, 0, height, -48, 6);
  rain.setGain(rainGain);
  
  float distance = dist(mouseX, mouseY, pmouseX, pmouseY);
  if ( abs(distance) > width/4) {
    thunderGain = 6;
  }
  thunderGain-=.5;
  thunder.setGain(thunderGain);
}