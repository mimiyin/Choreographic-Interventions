import toxi.math.conversion.*; //<>// //<>//
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
Voronoi voronoi;

int numPoints = 5;
Vec2D [] points;
Vec2D [] speeds;

float angle;
int mode;
int numModes = 5;

void setup()
{
  size( 800, 800, P2D);

  gfx = new ToxiclibsSupport( this );
  voronoi = new Voronoi();

  reset();

  println("TAB to change modes.");
  println("\t0: Speeds");
  println("\t1: Random speeds.");
  println("\t2: Noisy speeds.");
  println("\t3: Sine speeds.");
  println("\t4: Tan speeds.");
}

void draw()
{
  background(0);
  noFill();
  stroke(255);

  // UPDATE POINTS FOR MESH
  angle+=0.01;
  for ( int p = 0; p < points.length; p++ ) {
    switch(mode) {
    case 0: // Move points according to their speed
      points[p].addSelf(new Vec2D(speeds[p]));
      break;
    case 1: // Move points randomly
      points[p].addSelf(new Vec2D(random(-5, 5), random(-5, 5)));
      break;

    case 2: // Move points with noise
      points[p].addSelf(new Vec2D(noise(p*angle)*2 - 1, noise(2*p*angle)*2 - 1));
      break;

    case 3: // Move points using sin()
      float sinMult = sin(angle)*5;
      points[p].addSelf(new Vec2D(speeds[p]).scale(sinMult));
      break;
    case 4: // Move points using tan()
      // We need to constrain the tan multiplier because tan 
      // gives back numbers from -infinity to +infinity
      float tanMult = tan(speeds[p].x*angle);
      tanMult = constrain(tanMult, -100, 100);
      points[p].addSelf(new Vec2D(speeds[p]).scale(tanMult));
      break;
    }

    speeds[p].x = turnaround(points[p].x, speeds[p].x, 0, width);
    speeds[p].y = turnaround(points[p].x, speeds[p].y, 0, width);
  }

  // CREATE VORONOI MESH
  voronoi = new Voronoi();
  for ( int p = 0; p < points.length; p++ ) {
    voronoi.addPoint( points[p] );
  }

  for ( Polygon2D polygon : voronoi.getRegions()) {
    if (polygon.containsPoint(new Vec2D(mouseX, mouseY))) {
      fill(255);
    } else {
      fill(0);
    }
    gfx.polygon2D( polygon );
  }

  strokeWeight( 4 );
  stroke( 255, 0, 0 );
  for ( Vec2D v : voronoi.getSites() ) {
    point( v.x, v.y );
  }
}

float turnaround(float parameter, float speed, float min, float max) {
  if (parameter < min || parameter > max ) {
    speed *= -1;
  }
  return speed;
}

// Initialize arrays for keeping track of point positions and speeds
void reset() {
  points = new Vec2D[numPoints];
  speeds = new Vec2D[points.length];

  for ( int p = 0; p < points.length; p++ ) {
    points[p] = new Vec2D(random(width), random(height));
    speeds[p] = new Vec2D(random(-1, 1), random(-1, 1));
  }
}

void keyPressed() {
  switch(keyCode) {
  case TAB:
    mode++;
    mode%=numModes;
    break;
  case UP:
    numPoints++;
    break;
  case DOWN:
    numPoints--;
    break;
  }

  reset();

  // Don't allow fewer than 2 points or more than 50 points
  numPoints = constrain(numPoints, 2, 50);
  println("MODE", mode, "Number of Points", numPoints);
}