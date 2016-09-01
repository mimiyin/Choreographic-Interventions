import gab.opencv.*;
import KinectPV2.*;

KinectPV2 kinect;
OpenCV opencv;

float polygonFactor = 1;

int threshold = 10;

//Distance in cm
int maxD = 4500; //4.5m
int minD = 50; //50cm


void setup() {
  size(800, 600, P3D);
  opencv = new OpenCV(this, 512, 424);
  kinect = new KinectPV2(this);
  kinect.enableBodyTrackImg(true);
  kinect.init();
}

void draw() {
  background(0);

  noFill();
  strokeWeight(3);

  opencv.loadImage(kinect.getBodyTrackImage());
  opencv.gray();
  opencv.threshold(threshold);
  PImage dst = opencv.getOutput();

  ArrayList<Contour> contours = opencv.findContours(false, false);
  PVector center = new PVector(width/2, height/2, 0);

  if (contours.size() > 0) {
    for (Contour contour : contours) {

      contour.setPolygonApproximationFactor(polygonFactor);
      if (contour.numPoints() > 50) {

        stroke(255);       
        //strokeWeight(50);

        //stroke(255, 10);
        //strokeWeight(50);

        beginShape();

        for (PVector point : contour.getPolygonApproximation ().getPoints()) {
          // Scale the contour to 2x its size
          point.mult(2);

          // Define a vector radiating from the contour point to the edge of the screen
          PVector spoke = PVector.sub(point, center);
          spoke.setMag(500);
          spoke.add(point);
          // Draw radiating line
          line(point.x, point.y, spoke.x, spoke.y);
          // Draw point
          vertex(point.x, point.y);
        }
        endShape();
      }
    }
  }

  kinect.setLowThresholdPC(minD);
  kinect.setHighThresholdPC(maxD);
}