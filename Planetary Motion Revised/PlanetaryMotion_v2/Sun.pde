//The Sun Object

class Sun{
  //Sun attributes
  PVector position;
  float mass;
  float radius;
  
  //Constructor
  Sun(){
    position = new PVector(450.0,350.0,0.0);
    radius = random(40,51);
    mass = 1.9891 * pow(10,4);
  }
  
  //Display the Sun
  void display(){
    fill(255,105,36);
    ellipse(position.x,position.y,radius,radius);
  }
}
