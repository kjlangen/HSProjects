class ParticleSystem{
  ArrayList droplets;
  
  ParticleSystem(){
    droplets = new ArrayList<Particle>();
  }
  
  void run(){
    //Create an iterator to go through the arraylist
    Iterator<Particle> iter = droplets.iterator();
    while(iter.hasNext()){
      Particle r = iter.next(); 
      r.run(); //Update each particle's condition
      water.isClose(r,r.life); //Check if the particle is close to another particle
      if(r.isDead()){
        iter.remove(); //If the particle's lifespan is 0 delete it
      }
    }
   }
  
  //Method that adds a new particle to the arraylist
  void addParticle(){
    droplets.add(new Particle(new PVector(250,250),3));
  }
  
  //Method that checks for proximity
  void isClose(Particle r, float life){
    float distance = 0;
    
    //Create an iterator to go through the arraylist
    Iterator<Particle> it = droplets.iterator();
    synchronized(droplets){
      while(it.hasNext()){
        Particle p = it.next(); //Get the next particle in the array
        distance = dist(r.location.x,r.location.y,p.location.x,p.location.y); //Take the distance between the particle p and the reference particle
        if(distance < r.radius + p.radius && distance > 0 && r.radius >= p.radius && r.radius < 10 && life < 300){
          r.velocity = new PVector((r.velocity.x + p.velocity.x)/2,(r.velocity.y + p.velocity.y)/2); //Average their velocities
          r.radius++; //Add one to the radius of the droplet
          p.life = 0; //Set life of the particle to 0 to be deleted later
        }
      }
    }
  }
}
