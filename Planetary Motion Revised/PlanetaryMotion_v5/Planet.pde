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
  Planet(float x, float y, float m, float r, int c){
    mass = m;
    radius = r;
    this.c = c;
    position = new PVector(x,y,0);
    velocity = new PVector(random(0.0,0.4),random(0.0,0.4));
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
