/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 
 KinectPV2, Kinect for Windows v2 library for processing
 
 3D Skeleton.
 Some features a not implemented, such as orientation
 */

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

boolean drawSkeleton;

// Sound Stuff
import ddf.minim.*;

Minim minim;
AudioPlayer marimba, rain, thunder;

float scl = 500;
PVector prevYoPos;
PVector prevZingPos;
PVector prevBuddhasPos;

AudioPlayer yo, zing;
ArrayList<AudioPlayer>buddhas = new ArrayList<AudioPlayer>();
AudioPlayer buddha;

float buddhaGain;
String [] words =
  { "All", "that", "we are", "is the result", "of what we have", "thought", "the mind", "everything", "think", "we become"};
String word;

void setup() {
  size(1024, 768, P3D);

  kinect = new KinectPV2(this);

  //enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();

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
  // Start with All
  buddha = buddhas.get(0);
  word = "All";

  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);

  //translate the scene to the center 
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(PI);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();

  //Get the skeleton
  if (skeletonArray.size() > 0) {
    for (int s = 0; s < skeletonArray.size(); s++) {
      KSkeleton skeleton = skeletonArray.get(s);
      if (skeleton.isTracked()) {


        KJoint[] joints = skeleton.getJoints();

        // Velocity of right hand triggers Yo
        PVector rightHand = joints[KinectPV2.JointType_HandRight].getPosition();
        if (prevYoPos != null) {
          float d1 = PVector.dist(rightHand, prevYoPos)*scl; 
          if (d1 > 100) {
            yo.cue(0);
            yo.play();
          }
          pushMatrix();
          rotateX(-PI);
          if (prevZingPos != null) {
            textSize(d1 + 1);
            text("Yo", rightHand.x*scl, rightHand.y*scl);
          }
          popMatrix();
        }

        // Velocity of left knee triggers zing
        PVector leftHand = joints[KinectPV2.JointType_HandLeft].getPosition();
        if (prevZingPos != null) {
          float d2 = PVector.dist(leftHand, prevZingPos)*scl;
          if (d2 > 100) {
            zing.cue(0);
            zing.play();
          }
          pushMatrix();
          rotateX(-PI);
          if (prevYoPos != null) {
            textSize(d2 + 1);
            text("Zing", leftHand.x*scl, leftHand.y*scl);
          }
          popMatrix();
        }

        // Velocity of head increases gain of buddha
        PVector head = joints[KinectPV2.JointType_Head].getPosition();
        if (prevBuddhasPos != null) {
          float d3 = PVector.dist(head, prevBuddhasPos)*scl;
          println("d3", d3);          
          if (d3 > 10) buddhaGain++;
          pushMatrix();
          rotateX(-PI);
          if (prevBuddhasPos != null) {
            if (buddhaGain > 0) textSize(buddhaGain*50);
            else textSize(1);
            text(word, 0, 0);
          }
          popMatrix();
        }

        // Remember positions for next frame
        prevYoPos = rightHand.copy();
        prevZingPos = leftHand.copy();
        prevBuddhasPos = head.copy();


        if (drawSkeleton) {
          //Draw joints
          drawJoints(joints, skeleton.getIndexColor());
        }
      }
    }
  }
  // Weird bug with text. Need this out here to make the text not blurry.
  noStroke();
  fill(255, 0);
  textSize(128);
  text("Weird Bug", 0, 0);
  fill(255);

  popMatrix();

  // Pick the next random buddha phrase
  // But only if current buddha phrase is finished
  if (!buddha.isPlaying()) {
    int p = int(random(buddhas.size()));
    buddha = buddhas.get(p);
    buddha.cue(0);
    buddha.play();
    word = words[p];
  }

  // BuddhaGain is always dying
  buddhaGain -= 0.1;
  buddhaGain = constrain(buddhaGain, -48, 6);
  buddha.setGain(buddhaGain);
}


void keyPressed() {

  // Hit Enter key to erase trail
  switch (keyCode) {
  case ENTER:
    drawSkeleton = !drawSkeleton;
    break;
  }
}

void drawJoint(int jointType, KJoint[] joints, color col) {
  KJoint joint = joints[jointType];
  PVector jointPosition = joint.getPosition().mult(scl);
  stroke(col);
  strokeWeight(5);
  point(jointPosition.x, jointPosition.y, jointPosition.z);
}

void drawJoints(KJoint[] joints, color col) {
  //Bust
  drawJoint(KinectPV2.JointType_Head, joints, col);
  drawJoint(KinectPV2.JointType_Neck, joints, col);
  drawJoint(KinectPV2.JointType_SpineShoulder, joints, col);

  //Torso
  drawJoint(KinectPV2.JointType_SpineMid, joints, col);
  drawJoint(KinectPV2.JointType_SpineBase, joints, col);

  // Right Arm    
  drawJoint(KinectPV2.JointType_ShoulderRight, joints, col);
  drawJoint(KinectPV2.JointType_ElbowRight, joints, col);
  drawJoint(KinectPV2.JointType_WristRight, joints, col);
  drawJoint(KinectPV2.JointType_HandRight, joints, col);
  drawJoint(KinectPV2.JointType_HandTipRight, joints, col);
  drawJoint(KinectPV2.JointType_ThumbRight, joints, col);

  // Left Arm
  drawJoint(KinectPV2.JointType_ShoulderLeft, joints, col);
  drawJoint(KinectPV2.JointType_ElbowLeft, joints, col);
  drawJoint(KinectPV2.JointType_WristLeft, joints, col);
  drawJoint(KinectPV2.JointType_HandLeft, joints, col);
  drawJoint(KinectPV2.JointType_HandTipLeft, joints, col);
  drawJoint(KinectPV2.JointType_ThumbLeft, joints, col);

  // Right Leg
  drawJoint(KinectPV2.JointType_HipRight, joints, col);
  drawJoint(KinectPV2.JointType_KneeRight, joints, col);
  drawJoint(KinectPV2.JointType_AnkleRight, joints, col);
  drawJoint(KinectPV2.JointType_FootRight, joints, col);

  // Left Leg
  drawJoint(KinectPV2.JointType_HipLeft, joints, col);
  drawJoint(KinectPV2.JointType_KneeLeft, joints, col);
  drawJoint(KinectPV2.JointType_AnkleLeft, joints, col);
  drawJoint(KinectPV2.JointType_FootLeft, joints, col);
}