// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ParticleSystem ps;

ArrayList<Leaf> leafs;
//Leaf leaf;

void setup() {
  size(640, 360);

  ps = new ParticleSystem(10, new PVector(width/2, 50));

  //leaf = new Leaf(280,200,100,200);

  leafs = new ArrayList<Leaf>();

  noStroke();
}

void draw() {

  background(0);

  //leaf.display();

  if ( frameCount % 6 == 1 ) {
    ps.addParticle();
  }
  PVector gravity = new PVector(0, 0.1);
  PVector wind = new PVector(walk(), 0.);
  PVector leftBias = new PVector(-.1, 0.);
  PVector rightBias = new PVector(.1, 0.);


  ps.applyForce(gravity);
  ps.applyForce(wind);
  ps.run();

  //// Looping through backwards to delete
  for (int j = leafs.size()-1; j >= 0; j--) {
    Leaf l = leafs.get(j);

    for (int i = 0; i < ps.particles.size(); i++) {
      Particle p = ps.particles.get(i);
      if ( l.contains(p) ) {
        PVector pos = p.position;

        // Calculate drag force
        PVector dragForce = l.drag(p);
        p.applyForce(dragForce);

        if (pos.x > l.x && pos.x < l.x + l.w/2) {
          p.applyForce(leftBias);
        }
        if (pos.x > l.x + l.w/2 && pos.x < l.x + l.w) {
          p.applyForce(rightBias);
        }
        // println("cool!");
      }
    }
    //
    //  Leaf l = leafs.get(j);
    //  if( l.contains(p) ){
    //      // Calculate drag force
    //    PVector dragForce = l.drag(p);
    //    p.applyForce(dragForce);
    //  }
  }




  for (int i = leafs.size()-1; i >= 0; i--) {
    Leaf l = leafs.get(i);
    l.display();
  }
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
  leafs.add( new Leaf( mouseX, mouseY, 100, 20 ) );
}
