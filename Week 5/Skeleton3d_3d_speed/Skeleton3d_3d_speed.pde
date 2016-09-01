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
PVector jointPos = new PVector();
PVector pjointPos = new PVector();

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
  scale(500);
  rotateX(PI);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();

  //Get the skeleton
  if (skeletonArray.size() > 0) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(0);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      //Set which joint is drawing
      KJoint joint = joints[KinectPV2.JointType_HandLeft];
      jointPos = joint.getPosition(); //scaleJointPos(joint.getPosition());
      float d = PVector.dist(pjointPos, jointPos);
      pjointPos = jointPos.copy();
      pushMatrix();
      translate(jointPos.x, jointPos.y, jointPos.z); 
      noFill();
      stroke(255);
      strokeWeight(0.01);
      box(d);
      popMatrix();
    }
  }
  popMatrix();
}