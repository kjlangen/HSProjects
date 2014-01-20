PVector[] starPositions = new PVector[700];
PVector acceleration;
PVector displacement;
Sun sun1 = new Sun();
Planet earth = new Planet(200,350,5.97219 * pow(10,24),random(6,20));
float G;
float gravForce = 0;
float accelerationMag = 0;
float distance = 0;
float angle;

void setup(){
  frameRate(10);
  size(900,700);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
  for(int i = 0; i < starPositions.length; i++){
    starPositions[i] = new PVector(0,0);
    starPositions[i].x = random(3,898);
    starPositions[i].y = random(3,698);
  }
  G = 6.67384 * pow(10,-1);
  acceleration = new PVector(0,0,0);
}

void draw(){
  background(0);
  for(int i = 0; i < starPositions.length; i++){
    fill(255,255,255);
    ellipse(starPositions[i].x,starPositions[i].y,1.5,1.5);
  }
  
  //Calculation of displacement
  PVector displacement = displacementCalc(earth.position,sun1.position);
  
  //Calculate angle between the horizontal and the displacement vector
   angle = angleCalc(displacement);
   println(angle);
   println("sin " + sin(angle));
   println("cos " + cos(angle));
   
   //Calculate magnitude of acceleration
   accelerationMag = accelerationCalc(dist(sun1.position.x,sun1.position.y,earth.position.x,earth.position.y),sun1.mass);
   
   //Set acceleration
   earth.acceleration.set(cos(angle)*accelerationMag,sin(angle)*accelerationMag*-1,0.0);

//   println("earth.acceleration.x: " + earth.acceleration.x);
//   println("earth.acceleration.y: " + earth.acceleration.y);
  
  //Move Planets
  earth.move();
  
  //Display all Planet
  sun1.display();
  earth.display();
}

float accelerationCalc (float r, float m2){
  float accel = sqrt((G * m2)/r);
  return accel;
}

float angleCalc (PVector v2){
  PVector v1 = new PVector(1,0);
  float angle = PVector.angleBetween(v1,v2);
  //angle = degrees(angle);
  return angle;
}

PVector displacementCalc (PVector v1, PVector v2){
  PVector delta = new PVector(v2.x - v1.x,v2.y - v1.y);
  return delta;
}

//Use positions of p1 and p2 to find the angle between them
//Use the magnitude of the acceleration and the angle to find a and b which are added to x and y
