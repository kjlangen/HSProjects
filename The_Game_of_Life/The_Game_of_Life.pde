Cell[][] cells = new Cell[64][48];
boolean[][] liveCells = new boolean[64][48];
int clickCount = 0;
int count;
int liveNeighbours = 0;
int x;
int y;

void setup(){
  frameRate(10);
  size(1024,825);
  textSize(15);
  
  x = 0;
  y = 0;
  count = 0;
  
  //Initialize cell objects
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      cells[i][j] = new Cell(false, count); 
      count ++;
    }
  }
  
  //Initialize live cell database 
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      liveCells[i][j] = false;
    } 
  }
}

void draw(){
  
  //Drawing all the cells;
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      cells[i][j].display(i*16,j*16);
    }
  }
  
  if(keyPressed){
    changeState();
    resetLiveCells();
  }
  
  hud();
}

void hud(){
  fill(0,0,0);
  text("Press r to reset the grid.", 10, 790);
  text("Hold any key to play the game forward.",10,805);
  text("Tap any key to step the game forward.", 10,820);
  text("Press a to spawn a block.", 400, 790);
  text("Press s to spawn a blinker.", 680, 790);
  text("Press d to spawn a glider.", 400, 820);
  text("Press f to spawn a LWSS.", 680, 820);
}

void reset(){
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      cells[i][j].alive = false;
    } 
  }
  
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      liveCells[i][j] = false;
    } 
  }
}

void drawBlock(int x, int y){
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      if(x > i*16 && x < (i+1)*16 && y > j*16 && y < (j+1)*16){
        cells[i][j].alive = true;
        cells[i+1][j].alive = true;
        cells[i][j+1].alive = true;
        cells[i+1][j+1].alive = true;
      }
    }
  }
}

void drawBlinker(int x, int y){
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      if(x > i*16 && x < (i+1)*16 && y > j*16 && y < (j+1)*16){
        cells[i][j].alive = true;
        cells[i+1][j].alive = true;
        cells[i+2][j].alive = true;
      }
    }
  }
}

void drawGlider(int x, int y){
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      if(x > i*16 && x < (i+1)*16 && y > j*16 && y < (j+1)*16){
        cells[i][j].alive = true;
        cells[i+1][j+1].alive = true;
        cells[i+1][j+2].alive = true;
        cells[i][j+2].alive = true;
        cells[i-1][j+2].alive = true;
      }
    }
  }
}

void drawLWSS(int x, int y){
 for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      if(x > i*16 && x < (i+1)*16 && y > j*16 && y < (j+1)*16){
        cells[i][j].alive = true;
        cells[i][j+2].alive = true;
        cells[i+1][j+3].alive = true;
        cells[i+2][j+3].alive = true;
        cells[i+3][j+3].alive = true;
        cells[i+4][j+3].alive = true;
        cells[i+4][j+2].alive = true;
        cells[i+4][j+1].alive = true;
        cells[i+3][j].alive = true;
      }
    }
  } 
}


void keyReleased(){
  if(key == 'r'){
    reset();
  }
  if(key == 'a'){
    drawBlock(int(mouseX),int(mouseY));
  }
  if(key == 's'){
    drawBlinker(int(mouseX),int(mouseY));
  }
  if(key == 'd'){
    drawGlider(int(mouseX),int(mouseY));
  }
  if(key == 'f'){
    drawLWSS(int(mouseX),int(mouseY));
  }
}

void mouseReleased(){
  
  //Change the state of a cell if the user clicks
  userInput(int(mouseX),int(mouseY));
}

void userInput(int x, int y){
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      if(x > i*16 && x < (i+1)*16 && y > j*16 && y < (j+1)*16){
        if(cells[i][j].alive == true){
          cells[i][j].alive = false;
        }
        else if(cells[i][j].alive == false){
          cells[i][j].alive = true;
        }
        break;
      }
    }
  }
}

void resetLiveCells(){
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      liveCells[i][j] = false;
    }
  }
}

void changeState(){
  
  //Go through the grid and store all the live cells
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      if(cells[i][j].alive == true){
        liveCells[i][j] = true;
      }
    }
  }
  
  //Go through the grid and change cells alive state
  for(int i = 0; i < 64; i++){
    for(int j = 0; j < 48; j++){
      
      //Centre of the grid
      if(i > 0 && j > 0 && i < 63 && j < 47){
        for(int k = -1; k < 2; k++){
          for(int m = -1; m < 2; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      
      //Upper wall
      else if(i > 0 && j == 0 && i < 63){
          for(int k = -1; k < 2; k++){
            for(int m = 0; m < 2; m++){
              x = i + k;
              y = j + m;
              if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                  liveNeighbours += 1;
              }
            }
          }
      }
      
      //Lower wall
      else if(i > 0 && i < 63 && j == 47){
        for(int k = -1; k < 2; k++){
          for(int m = -1; m < 1; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      
      //Left wall
      else if(i == 0 && j > 0 && j < 47){
        for(int k = 0; k < 2; k++){
          for(int m = -1; m < 2; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      
      //Right wall
      else if(i == 63 && j > 0 && j < 47){
        for(int k = -1; k < 1; k++){
          for(int m = -1; m < 2; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      
      //Corners
      else if(i == 0 && j == 0){
        for(int k = 0; k < 2; k++){
          for(int m = 0; m < 2; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      else if(i == 63 && j == 0){
        for(int k = -1; k < 1; k++){
          for(int m = 0; m < 2; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      else if(i == 0 && j == 63){
        for(int k = 0; k < 2; k++){
          for(int m = -1; m < 1; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      else if(i == 63 && j == 63){
        for(int k = -1; k < 1; k++){
          for(int m = -1; m < 1; m++){
            x = i + k;
            y = j + m;
            if(liveCells[x][y] == true && cells[x][y].self != cells[i][j].self){
                liveNeighbours += 1;
            }
          }
        }
      }
      
      if(cells[i][j].alive == false && liveNeighbours == 3){
        cells[i][j].alive = true;
      }
      if(cells[i][j].alive == true && (liveNeighbours > 3 || liveNeighbours < 2)){
        cells[i][j].alive = false;
      }
      
      liveNeighbours = 0;
    }
  }
}
