


class ParticleSystem {


  ArrayList<Particle> particles;
  PVector startPoint;
  
  
  ParticleSystem(int pulse,PVector startPointIn) {
     particles = new ArrayList<Particle>();
   startPoint = startPointIn.copy(); 
   
   for (int i = 0; i < pulse; i++) {
     particles.add(new Particle(startPoint));
    
  }
}

 // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
 void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(startPoint));
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }

}
