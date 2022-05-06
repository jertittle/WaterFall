// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float decay;
  float mass;

  Particle(PVector l) {
    position = l.copy();
    acceleration = new PVector(0, 0.0);
    velocity = new PVector(0,0);
    
    lifespan = random(100,255);
    decay = .5 + random(1.);
    mass = 1;
    //ellipseMode(CENTER);
    
  }

  void run() {
    update();
    display();
  }
  
  void applyForce( PVector force) {
     PVector f = PVector.div(force,mass);
    acceleration.add(f);
    
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= decay;
  }

  // Method to display
  void display() {
    //stroke(0, lifespan);
    //strokeWeight(2);
    noStroke();
    ellipseMode(CENTER);
    fill(200, lifespan);
    ellipse(position.x, position.y, 12, 12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
  
   void checkEdges() {
    if (position.y > height - 6) {
      velocity.y *= -0.1;  // A little dampening when hitting the bottom
      position.y = height;
    }
  }
}
