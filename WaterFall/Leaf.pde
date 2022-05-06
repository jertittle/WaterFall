class Leaf {
  
 // PVector loc;
  float x, y, w, h;
  
  float c;
  
  Leaf(){
   
  }
  
  Leaf(float _x, float _y, float _w, float _h) {//this needs work
    w = _w;
    h = _h;
    //loc = new PVector(x,y);
   x = _x;
   y = _y;
    
    c = random(0.,.5) ;
    //ellipseMode(CORNERS);
  }
  
   // Is the Mover in the Liquid?
  boolean contains(Particle p) {
    PVector l = p.position;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }
  
   // Calculate drag force
  PVector drag(Particle p) {
    // Magnitude is coefficient * speed squared
    float speed = p.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = p.velocity.copy();
    dragForce.mult(-1);

    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

  
  void display() {
    
    //fill(0,255,20); 
    //ellipseMode(CORNERS);
    //ellipse(x, y, w, h);
    rectMode(CORNERS);
    noFill();
    stroke(0,255,80);
    rect(x,y,w,h);
  }
  
}
