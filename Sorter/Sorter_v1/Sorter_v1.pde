int[] number = {3,6,7,8,9,4,1};
int sto;
int k;


void setup(){
  sortMethod();
}

void sortMethod(){
    for(int i =0; i<7; i++){
      for(int j = i; j < 7; j++){
        if(number[i] > number[j]){
          sto = number[i];
          number[i] = number[j];
          number[j] = sto; 
        }
        println("i = " + i + "j = " + j);
      }
    }
  println(number);
}

