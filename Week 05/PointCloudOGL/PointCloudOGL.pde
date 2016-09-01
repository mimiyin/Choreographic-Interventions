/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 KinectPV2, Kinect for Windows v2 library for processing
 
 Point Cloud example using openGL and Shaders
 */

import java.nio.*;
import KinectPV2.*;

KinectPV2 kinect;


int  vertLoc;

//transformations
float a = 3.1;

//Distance Threashold
int maxD = 1500; // up to 4500mm (4.5m, 13.5 feet)
int minD = 500;  //

int skip = 4;

float t;

public void setup() {
  size(1280, 720, P3D);

  kinect = new KinectPV2(this);
  kinect.enableDepthImg(true);
  kinect.enablePointCloud(true);
  kinect.setLowThresholdPC(minD);
  kinect.setHighThresholdPC(maxD);
  kinect.init();
}

public void draw() {
  background(0);

  //translate the scene to the center
  translate(width / 2, height / 2, 50);
  rotateY(a);

  // Threahold of the point Cloud.
  kinect.setLowThresholdPC(minD);
  kinect.setHighThresholdPC(maxD);

  //get the points in 3d space
  int[] depth = kinect.getRawDepthData();

  //obtain XYZ the values of the point cloud
  for (int x = 0; x < kinect.WIDTHDepth; x+=skip) {
    for (int y = 0; y < kinect.HEIGHTDepth; y+=skip) {
      int offset = x + y * kinect.WIDTHDepth;

      // Ignore points that are too far or close
      if (depth[offset] > maxD || depth[offset] < minD) continue;

      //calculte the x, y, z camera position based on the depth information
      PVector point = depthToPointCloudPos(x, y, depth[offset]);
      
      // Draw a point
      stroke(255);
      point(point.x, point.y, point.z);

      // Draw a random line
      //stroke(255, 64);
      //line(point.x, point.y, point.z, point.x + random(-100,100), point.y, point.z);
      //line(point.x, point.y, point.z, point.x + random(-100,100), point.y  + random(-100,100), point.z + random(-100,100));
      
      // Draw a line to the mouse
      //stroke(255, 10);
      //line(point.x, point.y, point.z, width/2-mouseX, mouseY-height/2, point.z);
    }
  }
}

//calculte the xyz camera position based on the depth data
PVector depthToPointCloudPos(int x, int y, float depthValue) {
  PVector point = new PVector();
  point.z = (depthValue/1.0f);// / (1.0f); // Convert from mm to meters
  point.x = (x - CameraParams.cx) * point.z / CameraParams.fx;
  point.y = (y - CameraParams.cy) * point.z / CameraParams.fy;
  return point;
}