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
KJoint[] joints;
PImage img;

void setup() {
  size(1024, 768, P3D);

  kinect = new KinectPV2(this);

  //enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
  
  img = loadImage("clouds.jpg");
}

void draw() {
  background(0);
  //translate the scene to the center 
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(1000);
  rotateX(PI);
 // rotateY(map(mouseX, 0, width, -PI, PI));

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();

  //Get the skeleton
  if (skeletonArray.size() > 0) {
   KSkeleton skeleton = (KSkeleton) skeletonArray.get(0);
   if (skeleton.isTracked()) {
     joints = skeleton.getJoints();

     //Set which joint is drawing
     fill(255, 0, 0);
     noStroke();
     drawBody();

     //Draw joints
     stroke(255);
     drawJoints();
   }
  }
  popMatrix();
}

void drawBody() {
  //Specify which joints to use to create shape
  KJoint head = joints[KinectPV2.JointType_Head];
  KJoint rightElbow = joints[KinectPV2.JointType_ElbowRight];
  KJoint rightAnkle = joints[KinectPV2.JointType_AnkleRight];
  KJoint leftKnee = joints[KinectPV2.JointType_KneeLeft];

  beginShape();
  texture(img);
  // Anchor to a point in space instead of head
  //vertex(-1, 0, 0, 0, 0);
  drawVertex(head, 0, 0);
  drawVertex(rightElbow, img.width, 0);
  drawVertex(rightAnkle, img.width, img.height);
  drawVertex(leftKnee, 0, img.height );
  endShape();
}

void drawVertex(KJoint joint, int txtMapX, int txtMapY) {
  vertex(joint.getX(), joint.getY(), joint.getZ(), txtMapX, txtMapY); 
}

void drawJoint(int jointType) {
  KJoint joint = joints[jointType];
  PVector jointPosition = joint.getPosition();
  point(jointPosition.x, jointPosition.y, jointPosition.z);
}

void drawJoints() {
  //Bust
  drawJoint(KinectPV2.JointType_Head);
  drawJoint(KinectPV2.JointType_Neck);
  drawJoint(KinectPV2.JointType_SpineShoulder);

  //Torso
  drawJoint(KinectPV2.JointType_SpineMid);
  drawJoint(KinectPV2.JointType_SpineBase);

  // Right Arm    
  drawJoint(KinectPV2.JointType_ShoulderRight);
  drawJoint(KinectPV2.JointType_ElbowRight);
  drawJoint(KinectPV2.JointType_WristRight);
  drawJoint(KinectPV2.JointType_HandRight);
  drawJoint(KinectPV2.JointType_HandTipRight);
  drawJoint(KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawJoint(KinectPV2.JointType_ShoulderLeft);
  drawJoint(KinectPV2.JointType_ElbowLeft);
  drawJoint(KinectPV2.JointType_WristLeft);
  drawJoint(KinectPV2.JointType_HandLeft);
  drawJoint(KinectPV2.JointType_HandTipLeft);
  drawJoint(KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawJoint(KinectPV2.JointType_HipRight);
  drawJoint(KinectPV2.JointType_KneeRight);
  drawJoint(KinectPV2.JointType_AnkleRight);
  drawJoint(KinectPV2.JointType_FootRight);

  // Left Leg
  drawJoint(KinectPV2.JointType_HipLeft);
  drawJoint(KinectPV2.JointType_KneeLeft);
  drawJoint(KinectPV2.JointType_AnkleLeft);
  drawJoint(KinectPV2.JointType_FootLeft);
}