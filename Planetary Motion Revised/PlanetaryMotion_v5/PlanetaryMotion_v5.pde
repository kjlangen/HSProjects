PVector[] starPositions = new PVector[700];
PVector displacement =  new PVector(0,0,0);
Planet[] earths = new Planet[10];
float G;
float k = 0;
float gravForce = 0;
float accelerationMag = 0;
float distance = 0;

void setup(){
  frameRate(60);
  size(1100,900);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
    
  //Initialize the gravitational constant
  G = 6.67384 * pow(10,-8);  
  
  //Set random positions for background stars
  for(int i = 0; i < starPositions.length; i++){
    starPositions[i] = new PVector(0,0);
    starPositions[i].x = random(3,1098);
    starPositions[i].y = random(3,898);
  }
 
  //Instantiation of Planets
  for(int i = 0; i < earths.length; i++){
    earths[i] = new Planet(random(0,870),random(0,670),(random(1.31*pow(10,21),2.0*pow(10,27))),random(6,20),int(random(0,255)));
  }
}

void draw(){
  //Draw Background
  background(0);
  for(int i = 0; i < starPositions.length; i++){
    fill(255,255,255);
    ellipse(starPositions[i].x,starPositions[i].y,1.5,1.5);
  }
    
  //Gravity being applied planet to planet
  for (int i = 0; i < earths.length; i++){
    for (int j = 0; j < earths.length; j++){
      if(i != j){
        
//        println("I: " + i);
//        println("J: " + j);
//        
//        println("Position of earth " + j + ": " + earths[j].position);
//        println("Position of earth " + i + ": " + earths[i].position);
        
        //Calculate displacement
        displacement.set(earths[j].position.x - earths[i].position.x,earths[j].position.y - earths[i].position.y,0);
        
//        println("displacement: " + displacement);
         
        //Calculate magnitude of acceleration
        accelerationMag = accelerationCalc(dist(earths[i].position.x,earths[i].position.y,earths[j].position.x,earths[j].position.y),earths[i].mass);
        
//        println("accelMag: " + accelerationMag);
//        println("Distance: " + dist(earths[j].position.x,earths[j].position.y,earths[i].position.x,earths[i].position.y));
        
        distance = (dist(earths[j].position.x,earths[j].position.y,earths[i].position.x,earths[i].position.y));
        
//        println("Distance: " + distance);
        
        //Calculate ratio k
        k = (accelerationMag/distance)*0.00000000001;
        
//        println("k: " + k);
        
        //Add acceleration
        earths[i].acceleration.set(displacement.x*k,displacement.y*k,0.0);
      }
    }
  }
  
  //Move Planets
  for (int i = 0; i < earths.length; i++){
    earths[i].move();
  }
  
  //Display all Planets
  for(int i = 0; i < earths.length; i++){
    earths[i].display();
  }
}

float accelerationCalc (float r, float m2){
  float accel = sqrt((G * m2)/r);
  return accel;
}

