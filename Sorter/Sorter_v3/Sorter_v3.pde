int[] numbers100 = new int[100];
int[] numbers1K = new int[1000];
int[] numbers10K = new int[10000];
int[] numbers100K = new int[100000];
int[] numbers1M = new int[1000000];
String[] sortType = {"Selection","Bubble","Insertion","Quick","Merge","Shell"};
String[] numberOfValues = {"100","1 K","10 K","100 K","1 M"};
String[] misc = {"Sort","Sim All"};
int totalTime = 0;
int arraySortType;
int arrayNumValues;
boolean sortPressed = false;
boolean simPressed = false;

void setup(){
 size(1100,450);
 background(255,255,255);
 textSize(12);
 noStroke();
}

void draw(){
  for(int i = 0; i < 6; i++){
    if(mouseX > 100 && mouseX < 200 && mouseY > (i*45 + 80) && mouseY < (i*45 + 110)){
      button(0,122,173,100,true,i);
      fill(255,255,255);
      text(sortType[i], 105, i*45 + 100);
      if(mousePressed){
        arraySortType = i;
      }
    }
    else{
     button(0,102,153,100,false,i);
     fill(255,255,255);
     text(sortType[i], 105, i*45 + 100);
    }
  }
  
  for(int i = 0; i < 5; i++){
    if(mouseX > 230 && mouseX < 330 && mouseY > (i*45 + 80) && mouseY < (i*45 + 110)){
      button(0,122,173,230,true,i);
      fill(255,255,255);
      text(numberOfValues[i], 235, i*45 + 100);
      if(mousePressed){
        arrayNumValues = i;
      }
    }
    else{
      button(0,102,153,230,false,i);
      fill(255,255,255);
      text(numberOfValues[i], 235, i*45 + 100);
      fill(255,255,255);
    }
  }
  
  for(int i = 0; i < 2; i++){
    button(0,102,153,360,false,i);
    if(mouseX > 360 && mouseX < 460 && mouseY > (i*45 + 80) && mouseY < (i*45 + 110)){
      button(0,122,173,360,true,i);
      fill(255,255,255);
      text(misc[i], 370, i*45 + 100);
      if(mousePressed && i == 0){
        sortPressed = true;
      }
      if(mousePressed && i == 1){
        simPressed = true;
        println("simPressed");
      }
    }
    else{
      button(0,102,153,360,false,i);
      fill(255,255,255);
      text(misc[i], 370, i*45 + 100);
    }
  }
  
  if(sortPressed == true){ //If the "start" button is pushed
    
    // Initializing values for chosen array
      if(arrayNumValues == 0){
        for(int j = 0; j < 100; j++){
          numbers100[j] = (int)(random(0,101));
        }
      }
      else if(arrayNumValues == 1){
        for(int j = 0; j < 1000; j++){
          numbers1K[j] = (int)(random(0,101));
        }
      }
      else if(arrayNumValues == 2){
        for(int j = 0; j < 10000; j++){
          numbers10K[j] = (int)(random(0,101));
        }
      }
      else if(arrayNumValues == 3){
        for(int j = 0; j < 100000; j++){
          numbers100K[j] = (int)(random(0,101));
        }
      }
      else if(arrayNumValues == 4){
        for(int j = 0; j < 1000000; j++){
          numbers1M[j] = (int)(random(0,101));
        }
      }
    
    // Setting type of sorting method
    if(arraySortType == 0 && arrayNumValues == 0){
      selectionSort(numbers100);
    }
    else if(arraySortType == 0 && arrayNumValues == 1){
      selectionSort(numbers1K);
    }
    else if(arraySortType == 0 && arrayNumValues == 2){
      selectionSort(numbers10K);
    }
    else if(arraySortType == 0 && arrayNumValues == 3){
      selectionSort(numbers100K);
    }
    else if(arraySortType == 0 && arrayNumValues == 4){
      selectionSort(numbers1M);
    }
    
    //Bubble Sort
    else if(arraySortType == 1 && arrayNumValues == 0){
      bubbleSort(numbers100);
    }
    else if(arraySortType == 1 && arrayNumValues == 1){
      bubbleSort(numbers1K);
    }
    else if(arraySortType == 1 && arrayNumValues == 2){
      bubbleSort(numbers10K);
    }
    else if(arraySortType == 1 && arrayNumValues == 3){
      bubbleSort(numbers100K);
    }
    else if(arraySortType == 1 && arrayNumValues == 4){
      bubbleSort(numbers1M);
    }
    
    //Insertion Sort
    else if(arraySortType == 2 && arrayNumValues == 0){
      insertionSort(numbers100);
    }
    else if(arraySortType == 2 && arrayNumValues == 1){
      insertionSort(numbers1K);
    }
    else if(arraySortType == 2 && arrayNumValues == 2){
      insertionSort(numbers10K);
    }
    else if(arraySortType == 2 && arrayNumValues == 3){
      insertionSort(numbers100K);
    }
    else if(arraySortType == 2 && arrayNumValues == 4){
      insertionSort(numbers1M);
    }
    
    //Quick Sort
    else if(arraySortType == 3 && arrayNumValues == 0){
      quickSort(numbers100);
    }
    else if(arraySortType == 3 && arrayNumValues == 1){
      quickSort(numbers1K);
    }
    else if(arraySortType == 3 && arrayNumValues == 2){
      quickSort(numbers10K);
    }
    else if(arraySortType == 3 && arrayNumValues == 3){
      quickSort(numbers100K);
    }
    else if(arraySortType == 3 && arrayNumValues == 4){
      quickSort(numbers1M);
    }
    
    //Merge Sort
    else if(arraySortType == 4 && arrayNumValues == 0){
      mergeSort(numbers100);
    }
    else if(arraySortType == 4 && arrayNumValues == 1){
      mergeSort(numbers1K);
    }
    else if(arraySortType == 4 && arrayNumValues == 2){
      mergeSort(numbers10K);
    }
    else if(arraySortType == 4 && arrayNumValues == 3){
      mergeSort(numbers100K);
    }
    else if(arraySortType == 4 && arrayNumValues == 4){
      mergeSort(numbers1M);
    }
    
    //Shell Sort
    else if(arraySortType == 5 && arrayNumValues == 0){
      shellSort(numbers100);
    }
    else if(arraySortType == 5 && arrayNumValues == 1){
      shellSort(numbers1K);
    }
    else if(arraySortType == 5 && arrayNumValues == 2){
      shellSort(numbers10K);
    }
    else if(arraySortType == 5 && arrayNumValues == 3){
      shellSort(numbers100K);
    }
    else if(arraySortType == 5 && arrayNumValues == 4){
      shellSort(numbers1M);
    }
  }
  
  if(simPressed == true){
    line(480,80,480,350);
    for(int i = 0; i < 6; i++){
      line(480,i*45 + 80,1075,i*45 + 80);
      line(480,350,1075,350);
      line(i*100 + 575,80,i*100 + 575,350);
      fill(0,0,0);
      text(sortType[i], 490, i*45 + 105);
      if(i < 5){
        text(numberOfValues[i], i*100 + 605, 80);
      }
    }
    selectionSort(numbers100);
    text(totalTime,605,105);
    delay(100);
    selectionSort(numbers1K);
    text(totalTime,705,105);
    delay(100);
    selectionSort(numbers10K);
    text(totalTime,805,105);
    delay(100);
    selectionSort(numbers100K);
    text(totalTime,905,105);
    delay(100);
    selectionSort(numbers1M);
    text(totalTime,1005,105);
    
    bubbleSort(numbers100);
    text(totalTime,605,150);
    delay(100);
    bubbleSort(numbers1K);
    text(totalTime,705,150);
    delay(100);
    bubbleSort(numbers10K);
    text(totalTime,805,150);
    delay(100);
    bubbleSort(numbers100K);
    text(totalTime,905,150);
    delay(100);
//    bubbleSort(numbers1M);
//    text(totalTime,1005,150);
    
    insertionSort(numbers100);
    text(totalTime,605,195);
    delay(100);
    insertionSort(numbers1K);
    text(totalTime,705,195);
    delay(100);
    insertionSort(numbers10K);
    text(totalTime,805,195);
    delay(100);
    insertionSort(numbers100K);
    text(totalTime,905,195);
    delay(100);
//    insertionSort(numbers1M);
//    text(totalTime,1005,195);
    
    quickSort(numbers100);
    text(totalTime,605,240);
    delay(100);
    quickSort(numbers1K);
    text(totalTime,705,240);
    delay(100);
    quickSort(numbers10K);
    text(totalTime,805,240);
    delay(100);
    quickSort(numbers100K);
    text(totalTime,905,240);
    delay(100);
//    quickSort(numbers1M);
//    text(totalTime,1005,240);
    
    mergeSort(numbers100);
    text(totalTime,605,285);
    delay(100);
    mergeSort(numbers1K);
    text(totalTime,705,285);
    delay(100);
    mergeSort(numbers10K);
    text(totalTime,805,285);
    delay(100);
    mergeSort(numbers100K);
    text(totalTime,905,285);
    delay(100);
//    mergeSort(numbers1M);
//    text(totalTime,1005,285);
    
    shellSort(numbers100);
    text(totalTime,605,330);
    delay(100);
    shellSort(numbers1K);
    text(totalTime,705,330);
    delay(100);
    shellSort(numbers10K);
    text(totalTime,805,330);
    delay(100);
    shellSort(numbers100K);
    text(totalTime,905,330);
    delay(100);
//    shellSort(numbers1M);
//    text(totalTime,1005,330);
//    delay(100);
  }

  sortPressed = false;
  simPressed = false;
}

void button(int a, int b, int c, int x, boolean overButton, int index){
  if(overButton == false){
    fill(a,b,c);
    rect(x,index*45 + 80, 100, 30,6);
  }
  if(overButton == true){
    fill(a,b,c);
    rect(x,index*45 + 80, 100, 30,6);
  }
}

int[] selectionSort(int[] data){
  int timeInitial = millis();
  int sto = 0;
  for(int i = 0; i < data.length; i++){
    for(int j = i; j < data.length; j++){
      if(data[i] > data[j]){
        sto = data[i];
        data[i] = data[j];
        data[j] = sto;
      }
    }
  }
  int timeFinal = millis();
  totalTime = timeFinal - timeInitial;
  fill(255,255,255);
  rect(200,400,150,-25);
  fill(0,0,0);
  text("Time: " + totalTime + " ms",200,400);
  println("selection");
  return data;
}

int[] bubbleSort(int[] data){
  int timeInitial = millis();
  int temp = 0;
  for(int i = 0; i<data.length; i++){
    for(int j = (data.length -1);j>=(i+1);j--){
      if(data[j]<data[j-1]){
        temp = data[j];
        data[j]=data[j-1];
        data[j-1] = temp;
      }
    }
  }
  int timeFinal = millis();
  totalTime = timeFinal - timeInitial;
  fill(255,255,255);
  rect(200,400,150,-25);
  fill(0,0,0);
  text("Time: " + totalTime + " ms",200,400);
  println("bubble");
  return data;
}

int[] insertionSort(int[] data){
  int timeInitial = millis();
  int len = data.length;
  int varKey = 0;
  int j = 0;
  for(int i = 1;i < len;i++){
    varKey = data[i];
    j = i-1;
    while(j>=0 && data[j]>varKey){
      data[j+1] = data[j];
      j = j-1;
      data[j+1]=varKey;
    }
  }
  int timeFinal = millis();
  totalTime = timeFinal - timeInitial;
  fill(255,255,255);
  rect(200,400,150,-25);
  fill(0,0,0);
  text("Time: " + totalTime + " ms",200,400);
  println("insertion");
  return data;
}

int[] quickSort(int[] data){
  int timeInitial = millis();
  int len = data.length;
  int pivot = 0;
  int ind = len/2;
  int i,j = 0, k = 0;
  if(len < 2){
    return data;
  }
  else{
    int[] L = new int[data.length];
    int[] R = new int[data.length];
    int[] sorted = new int[data.length];
    pivot = data[ind];
    for(i = 0; i < len; i++){
      if(i!=ind){
        if(data[i]<pivot){
          L[j] = data[i];
          j++;
        }
        else{
          R[k] = data[i];
          k++;
        }
      }
    }
    int[] sortedL = new int[j];
    int[] sortedR = new int[k];
    arrayCopy(L, 0, sortedL, 0, j);
    arrayCopy(R, 0, sortedR, 0, k);
    sortedL = quickSort(sortedL);
    sortedR = quickSort(sortedR);
    arrayCopy(sortedL, 0, sorted, 0, j);
    sorted[j] = pivot;
    arrayCopy(sortedR, 0, sorted, j+1, k);
    int timeFinal = millis();
    totalTime = timeFinal - timeInitial;
    fill(255,255,255);
    rect(200,400,150,-25);
    fill(0,0,0);
    text("Time: " + totalTime + " ms",200,400);
    println("quick");
    return sorted;
  }
}

int[] mergeSort(int[] data){
  int timeInitial = millis();
  int len = data.length;
  if(len <= 1){
    return data;
  }
  else{
    int[] sorted = new int[len];
    int middle = len/2;
    int rem = len-middle;
    int[] L = new int[middle];
    int[] R = new int[rem];
    arrayCopy(data, 0, L, 0, middle);
    arrayCopy(data, 0, R, 0, rem);
    L = this.mergeSort(L);
    R = this.mergeSort(R);
    sorted = merge(L, R);
    int timeFinal = millis();
    totalTime = timeFinal - timeInitial;
    fill(255,255,255);
    rect(200,400,150,-25);
    fill(0,0,0);
    text("Time: " + totalTime + " ms",200,400);
    println("merge");
    return sorted;
  }
}

int[] merge(int[] L, int[] R){
  int lenL = L.length;
  int lenR = R.length;
  int[] merged = new int[lenL + lenR];
  int i = 0;
  int j = 0;
  while(i < lenL || j < lenR){
    if(i < lenL & j < lenR){
      if(L[i] <= R[j]){
        merged[i + j] = L[i];
        i++;
      }
      else{
        merged[i + j] = R[j];
        j++;
      }
    }
    else if(i < lenL){
      merged[i + j] = L[i];
      i++;
    }
    else if(j<lenR){
      merged[i + j] = R[j];
      j++;
    }
  }
 return merged;
}

int[] shellSort(int[] data){
  int timeInitial = millis();
  int ind = data.length/2;
  while(ind>0){
    for(int i = ind; i < data.length; i++){
      int temp = data[i];
      int j = i;
      while(j >= ind && data[j-ind] > temp){
        data[j] = data[j-ind];
        j = j - ind;
      }
      data[j] = temp;
    }
    ind = (ind / 2);
  }
  int timeFinal = millis();
  totalTime = timeFinal - timeInitial;
  fill(255,255,255);
  rect(200,400,150,-25);
  fill(0,0,0);
  text("Time: " + totalTime + " ms",200,400);
  println("shell");
  return data;
}
