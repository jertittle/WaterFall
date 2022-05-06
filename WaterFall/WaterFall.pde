// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ArrayList<Particle> particles;

ArrayList<Leaf> leafs;

void setup() {
  size(640, 360);
  particles = new ArrayList<Particle>();
  leafs = new ArrayList<Leaf>();
  noStroke();
}

void draw() {
  background(0);

  particles.add(new Particle(new PVector(width/2, 50)));

  PVector gravity = new PVector(0, 0.1);
  PVector wind = new PVector(walk(), 0.);

  // Looping through backwards to delete
  for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      
    for (int j = leafs.size()-1; j >= 0; j--) {
    Leaf l = leafs.get(j);
    if( l.contains(p) ){
        // Calculate drag force
      PVector dragForce = l.drag(p);
      p.applyForce(dragForce);
    }
    
  }
  
  
    p.applyForce(gravity);
    p.applyForce(wind);
    p.checkEdges();
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
  
  for (int i = leafs.size()-1; i >= 0; i--) {
    Leaf l = leafs.get(i);
    l.display();
  }
  
  //  for (int i = 0; i < particles.size(); i++) {

  //  // Is the Mover in the liquid?
  //  if (leafs.contains(particles[i])) {
  //    // Calculate drag force
  //    PVector dragForce = leafs.drag(particles[i]);
  //    // Apply drag force to Mover
  //    particles[i].applyForce(dragForce);
  //  }
    
  //}

  
}

float walk() {

  float x = random(-1., 1.);
  x*=.01;

  return x;
}

void keyPressed() {
  if (key == 'r') {
    for (int i = leafs.size()-1; i >= 0; i--) {
      leafs.remove(i);
    }
   //println("reset loop" + frameCount); 
  }
}

void mousePressed() {
 leafs.add( new Leaf( mouseX, mouseY, mouseX  + random(15, 30), mouseY  + random(5, 20) ) ); 
}
