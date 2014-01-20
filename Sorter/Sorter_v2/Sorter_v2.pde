int[] grades = {(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100)),(int)(random(0,100))};
String[] names = {"Zhang, David","Page, Mitchel","Hicks, Douglas","Edwards, Trevor","Howard, Nick","Kuntz, Reuben","Para, Jacob","Ealgesham Reed","Braun Michele","Kaethler, Ethan"};
int sto;
String stoNames;


void setup(){
  size(600,600);
  textSize(18);
}

void draw(){
  background(255,255,255);
  table();
  button(0, 102, 153);
  fillTable();
  
  if(mouseX > 260 && mouseX < 340 && mouseY > 540 && mouseY < 620){
    button(0,122, 173);
    if(mousePressed){
      sortMethod();
    }
  }
  
  for(int i =0; i<10; i++){
    if(mouseX > 100 && mouseX < 460 && mouseY > (i*40 + 80) && mouseY < (i*40 + 120)){
      text(names[i] + " " + grades[i],150,510);
      fill(0,0,0);
    }
  }
}

void sortMethod(){
    for(int i =0; i<10; i++){
      for(int j = i; j < 10; j++){
        if(grades[i] > grades[j]){
          sto = grades[i];
          stoNames = names[i];
          grades[i] = grades[j];
          names[i] = names[j];
          grades[j] = sto;
          names[j] = stoNames; 
        }
      }
    }
  println(grades);
}

void table(){
  for(int i = 0; i <11; i++){ // Draws horizontal cell lines
    line(100,80 + i*40,460,80 + i*40);
  }
  // Draw vertical cell ines
  line(100,80,100,480);
  line(460,80,460,480);
  line(380,80,380,480);
}

void button(int a, int b, int c){
 // fill(255,255,255);
  text("Sort",265,560);
  fill(255,255,255);
  fill(a,b,c,204);
  rect(240,540,80,30,6);
}

void fillTable(){ //Prints text to each cell
  for(int i = 0; i < 10; i++){ // Print Names
    text(names[i],120,115 + i*40);
  }
  for (int i = 0; i < 10; i++){ //Print Grades
    text(grades[i] + "%",400,115 + i*40);
  }
}
