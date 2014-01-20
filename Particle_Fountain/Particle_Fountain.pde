/* Kyle Langendoen
   6/3/2013
   Particle Fountain
   
   Description: This particle fountain generates
   particles at a particlular point, then changes their
   transparency according to the particles lifespan and
   removes them when they are dead. The fountain aims to
   emulate water droplets as they coalesce when falling.
*/

//Import an iterator object
import java.util.Iterator;

//Create a new particle system and a counter
ParticleSystem water;
int count;

//Initialize the particle system, counter, and setup window settings
void setup(){
  noStroke();
  size(500,500);
  water = new ParticleSystem();
  count = 0;
}

//Run the particle system and a new particle each time through
void draw(){
  background(255);
  water.run();
  water.addParticle();
}

//Method which changes computer generated random numbers to Poisson distribution
float getPoisson(double lambda) {
  double L = Math.exp(-lambda);
  double p = 1.0;
  float k = 0;

  do {
    k++;
    p *= Math.random();
  } while (p > L);

  return k - 1;
}
