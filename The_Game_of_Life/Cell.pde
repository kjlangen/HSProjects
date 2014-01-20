class Cell{
  boolean alive;
  int self;
  
  Cell(boolean alive, int self){
    this.alive = alive;
    this.self = self;
  }
  
  void display(int x, int y){
    if(alive == false){
      fill(255,255,255);
      rect(x,y,16,16);
    }
    else{
      fill(0,0,0);
      rect(x,y,16,16);
    }
  }
  
}
