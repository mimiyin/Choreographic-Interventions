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
int trailingJointIndex;
ArrayList<PVector>trail = new ArrayList<PVector>();

void setup() {
  size(1024, 768, P3D);

  kinect = new KinectPV2(this);

  //enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
}

void draw() {
  background(0);

  //Translate the scene to the center 
  //Scale it x1000
  //Rotate it around the x-axis 180-degrees
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(1000);
  rotateX(PI);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();

  // Get the skeleton
  // This sketch assumes one skeleton
  if (skeletonArray.size() > 0) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(0);
    
    if (skeleton.isTracked()) {
      joints = skeleton.getJoints();      

      //Set which joint is drawing
      // Get the index number for the joint
      int trailingJointIndex = getTrailingJointIndex();
      // Retrieve the joint using the index number
      KJoint trailingJoint = joints[trailingJointIndex];
      // Get the PVector containing the xyz position of the joint
      PVector trailingJointPosition = trailingJoint.getPosition().copy();

      // Add to trail array
      trail.add(trailingJointPosition);

      //Draw joints
      stroke(255);
      strokeWeight(5);
      drawJoints();
    }
  }

  // Draw trail
  stroke(255, 0, 0);
  strokeWeight(10);      
  for (PVector t : trail) {
    point(t.x, t.y, t.z);
  }

  popMatrix();
}

int getTrailingJointIndex() {

  //Bust
  //return KinectPV2.JointType_Head;
  //return KinectPV2.JointType_Neck;
  //return KinectPV2.JointType_SpineShoulder;

  //Torso
  //return KinectPV2.JointType_SpineMid;
  //return KinectPV2.JointType_SpineBase;

  // Right Arm    
  //return KinectPV2.JointType_ShoulderRight;
  //return KinectPV2.JointType_ElbowRight;
  //return KinectPV2.JointType_WristRight;
  //return KinectPV2.JointType_HandRight;
  //return KinectPV2.JointType_HandTipRight;
  //return KinectPV2.JointType_ThumbRight;

  // Left Arm
  //return KinectPV2.JointType_ShoulderLeft;
  //return KinectPV2.JointType_ElbowLeft;
  //return KinectPV2.JointType_WristLeft;
  return KinectPV2.JointType_HandLeft;
  //return KinectPV2.JointType_HandTipLeft;
  //return KinectPV2.JointType_ThumbLeft;

  // Right Leg
  //return KinectPV2.JointType_HipRight;
  //return KinectPV2.JointType_KneeRight;
  //return KinectPV2.JointType_AnkleRight;
  //return KinectPV2.JointType_FootRight;

  // Left Leg
  //return KinectPV2.JointType_HipLeft;
  //return KinectPV2.JointType_KneeLeft;
  //return KinectPV2.JointType_AnkleLeft;
  //return KinectPV2.JointType_FootLeft;
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