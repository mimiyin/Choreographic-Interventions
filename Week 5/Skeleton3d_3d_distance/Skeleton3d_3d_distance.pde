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

      //Draw line from joint position to joint position
      PVector begin = joints[KinectPV2.JointType_HandLeft].getPosition();
      PVector end = joints[KinectPV2.JointType_HandRight].getPosition();

      // Calculate the distance between the joints
      float distance = PVector.dist(begin, end);      
      // Map the distance value so that the sw gets smaller as the distance gets bigger
      float sw = map(distance, 0, 1.2, .5, .000001);
      stroke(255);
      // Use it to adjust strokeweight
      strokeWeight(sw);
      line(begin.x, begin.y, begin.z, end.x, end.y, end.z);
    }
  }
  popMatrix();
}