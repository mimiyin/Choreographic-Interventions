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

void setup() {
  size(1024, 768, P3D);

  kinect = new KinectPV2(this);

  //enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
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

      //Draw body shape
      drawBody();

      //Draw joints
      stroke(255);
      strokeWeight(5);
      //drawJoints();
    }
  }
  popMatrix();
}

void drawBody() {
  //Specify which joints to use to create shape
  KJoint neck = joints[KinectPV2.JointType_Neck];
  KJoint head = joints[KinectPV2.JointType_Head];
  KJoint rightHand = joints[KinectPV2.JointType_HandRight];
  KJoint leftHand = joints[KinectPV2.JointType_HandLeft];
  KJoint rightElbow = joints[KinectPV2.JointType_ElbowRight];
  KJoint leftElbow = joints[KinectPV2.JointType_ElbowLeft];
  KJoint rightKnee = joints[KinectPV2.JointType_KneeRight];
  KJoint leftKnee = joints[KinectPV2.JointType_KneeLeft];
  KJoint rightAnkle = joints[KinectPV2.JointType_AnkleRight];
  KJoint leftAnkle = joints[KinectPV2.JointType_AnkleLeft];
 
  //stroke(255, 0, 0);
  //strokeWeight(0.05);
  //drawLine(leftHand, rightHand);

  //stroke(0, 255, 0);
  //strokeWeight(0.1);
  //drawLine(rightHand, leftKnee);

  //stroke(0, 0, 255);
  //strokeWeight(0.01);
  //drawLine(head, leftHand);

  //fill(255);
  //stroke(0);
  //strokeWeight(0.01);
  //drawShapeAt(neck);

  stroke(255, 32);
  strokeWeight(0.1);
  noFill();

  //noStroke();
  //fill(255, 32);

  KJoint[] joints1 = { head, leftHand, rightHand, leftKnee, rightElbow }; 
  drawVertices(joints1);

  KJoint[] joints2 = { neck, leftElbow, rightKnee, rightHand, rightAnkle }; 
  drawVertices(joints);
}

// Angle for rotating the box
float angle;
void drawShapeAt(KJoint joint) {
  PVector jointPos = joint.getPosition();
  pushMatrix();
  translate(jointPos.x, jointPos.y, jointPos.z); 
  rotate(angle);
  angle += 0.01;
  box(.5);
  //rect(0,0, .5, .5);
  popMatrix();
}

void drawVertices(KJoint[] joints) {
  beginShape();
  for (KJoint joint : joints) {
    PVector jointPosition = joint.getPosition();
    curveVertex(jointPosition.x, jointPosition.y, jointPosition.z);
  }
  endShape();
}

void drawLine(KJoint begin, KJoint end) {
  PVector bp = begin.getPosition();
  PVector ep = end.getPosition();
  line(bp.x, bp.y, bp.z, ep.x, ep.y, ep.z);
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