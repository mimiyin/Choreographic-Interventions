String s = "All that we are is the result of what we thought";
String [] words = s.split(" ");
String word = " ";

void setup(){
  size(800, 800);
  textAlign(CENTER, CENTER);
  
}


void draw(){
  background(0);

  // Pick a new random 2x a second
  if(frameCount%30 == 0) word = words[int(random(words.length))];
  
  // Map text size to velocity of mouse
  float d = dist(mouseX, mouseY, pmouseX, pmouseY);
  float ts = map(d, 0, 500, 12, 1000);
  textSize(ts);
  text(word, mouseX, mouseY);
  
}