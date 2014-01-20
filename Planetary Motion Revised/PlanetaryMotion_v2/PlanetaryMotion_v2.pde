PVector[] starPositions = new PVector[700];
PVector[] displacement =  new PVector[2];
Sun sun1 = new Sun();
Planet[] earths = new Planet[2];
float G;
float[] k = {0,0};
float gravForce = 0;
float[] accelerationMag = {0,0};
float distance = 0;
float randomMass;

void setup(){
  frameRate(60);
  size(900,700);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
  
  //Randomly assign a mass betweent the masses of Pluto and Jupiter
  randomMass = random(1.31*pow(10,21),2.0*pow(10,27));
  
  //Initializing gravitational constant
  G = 6.67384 * pow(10,-8);  
  
  for(int i = 0; i < starPositions.length; i++){
    starPositions[i] = new PVector(0,0);
    starPositions[i].x = random(3,898);
    starPositions[i].y = random(3,698);
  }
 
  //Instantiation of Planets
  for(int i = 0; i < earths.length; i++){
    earths[i] = new Planet(int(random(0,870)),int(random(0,670)),randomMass*i,random(6,25));
  }
  
  //Creating empty displacement vectors
  for (int i = 0; i < displacement.length; i++){
    displacement[i] = new PVector(0,0,0);
  }
  
}

void draw(){
  //Draw Background
  background(0);
  for(int i = 0; i < starPositions.length; i++){
    fill(255,255,255);
    ellipse(starPositions[i].x,starPositions[i].y,1.5,1.5);
  }
   
  //Calculate magnitude of acceleration Note: acceleration is only calculated between each planet and the sun, not between the planets
  for(int i = 0; i < earths.length; i++){
    accelerationMag[i] = accelerationCalc(dist(sun1.position.x,sun1.position.y,earths[i].position.x,earths[i].position.y),sun1.mass);
  }
   
  //Calculate ratio k
  for (int i = 0; i < k.length; i++){
    k[i] = accelerationMag[i]/dist(sun1.position.x,sun1.position.y,earths[i].position.x,earths[i].position.y);
  }
  
  //Calculate displacement
  for (int i = 0; i < k.length; i++){
    displacement[i].set(sun1.position.x - earths[i].position.x,sun1.position.y - earths[i].position.y,0);
  }
  
  //Set acceleration
  for (int i = 0; i < earths.length; i++){
    earths[i].acceleration.set(displacement[i].x*k[i],displacement[i].y*k[i],0.0);
  }
  
  //Move Planets
  for (int i = 0; i < earths.length; i++){
    earths[i].move();
  }
  
  //Display all Planets
  sun1.display();
  for(int i = 0; i < earths.length; i++){
    earths[i].display();
  }
}

float accelerationCalc (float r, float m2){
  float accel = sqrt((G * m2)/r);
  return accel;
}

