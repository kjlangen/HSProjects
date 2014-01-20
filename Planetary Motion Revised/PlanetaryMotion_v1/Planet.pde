//The Planet Object

class Planet{
  //Planet attributes
  PVector acceleration;
  PVector velocity;
  PVector position;
  float mass;
  float radius;
  
  //Constructor
  Planet(int x, int y, float m, float r){
    mass = m;
    radius = r;
    position = new PVector(x,y,0);
    velocity = new PVector(5,5,0);
    acceleration = new PVector(0,0,0);
  }
  
  //Move
  void move(){
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  //Display
  void display(){
    fill(152,191,240);
    ellipse(position.x,position.y,radius,radius);
  }
}
