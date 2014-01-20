class Particle{
  PVector location,velocity,acceleration;
  int radius;
  float life; //Each particle's lifespan
  double rand;
  
  //Setup each particle's variables
  Particle(PVector origin, int radius){
    location = origin;
    rand = (double)random(-2,0);
    velocity = new PVector(random(0,1),getPoisson((double)random(-1,0)));
    acceleration = new PVector(0,0.05);
    life = 355;
    this.radius = radius;
  }
  
  //Convience function to call update and display
  void run(){
    update();
    display();
  }
  
  //Function which updates the particle's variables
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    life--; //Slowly decrease the amount of time left for the particle to live
  }
  
  //Draws an ellipse at each particle's location
  void display(){
    fill(129,186,255,life);
    ellipse(location.x,location.y,radius,radius);
  }
  
  //Method checking it the particle is alive or dead
  boolean isDead(){
    //If the particle is dead tell the process so
    if(life < 0){
      return true;
    }
    //If not tell the process so
    else{
      return false;
    }
  }
}
