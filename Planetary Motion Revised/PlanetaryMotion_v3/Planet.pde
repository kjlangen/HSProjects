//The Planet Object

class Planet{
  //Planet attributes
  PVector acceleration;
  PVector velocity;
  PVector position;
  float mass;
  float radius;
  int c;
  
  //Constructor
  Planet(float x, float y, float m, float r){
    mass = m;
    radius = r;
    c = 240;
    position = new PVector(x,y,0);
    velocity = new PVector(0.6,0.6,0);
    acceleration = new PVector(0,0,0);
  }
  
  //Move
  void move(){
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  //Display
  void display(){
    fill(152,191,c);
    ellipse(position.x,position.y,radius,radius);
  }
}
