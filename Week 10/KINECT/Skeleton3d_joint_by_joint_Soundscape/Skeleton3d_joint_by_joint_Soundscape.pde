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
PVector prevPos;

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
  marimba = minim.loadFile("marimba.mp3");
  rain = minim.loadFile("rain.mp3");
  thunder = minim.loadFile("thunder.mp3");

  marimba.loop();
  marimba.setGain(-48);

  rain.loop();
  rain.setGain(-48);

  thunder.setGain(6);
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

        // Distance between hands controls marimba
        PVector rightHand = joints[KinectPV2.JointType_HandRight].getPosition();
        PVector leftHand = joints[KinectPV2.JointType_HandLeft].getPosition();
        float d1 = PVector.dist(rightHand, leftHand)*scl;
        //println("d1", d1);
        float marimbaGain = map(d1, 10, scl, 6, -48);
        marimba.setGain(marimbaGain);

        // Distance between head and left hand controls rain
        PVector head = joints[KinectPV2.JointType_Head].getPosition();
        float d2 = PVector.dist(head, leftHand)*scl;
        //println("d2", d2);
        float rainGain = map(d2, 10, scl, 6, -48);
        rain.setGain(rainGain);

        // Velocity of Head controls thunder
        if (prevPos != null) {
          float d3 = PVector.dist(head, prevPos)*scl;
          //println("d3", d3);
          if (d3 > 50) {
            println(d3, head, prevPos);
            thunder.cue(0);
            thunder.play();
          }
        }
        prevPos = head.copy();

        if (drawSkeleton) {
          //Draw joints
          drawJoints(joints, skeleton.getIndexColor());
        }
      }
    }
  }
  popMatrix();
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
  PVector jointPosition = joint.getPosition().mult(1000);
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