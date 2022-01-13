void doMask(){
  if(maskMode==0) doTriangleUp();
  else if(maskMode==1) doHalfHorizontal();
  else if(maskMode==2) doFullHorizontal();
  else if(maskMode==3) doTriangleDown();
  else if(maskMode==4) doOctogon();
  else if(maskMode==5) doSomeRandom();
}
void doTriangleUp(){
  L = 0; R = width; T = 0; B = height;
  LT = new PVector(width/2, T);
  RT = new PVector(width/2, T);
  RB = new PVector(0.9*width, B);
  LB = new PVector(0.1*width, B);
}
void doHalfHorizontal(){
  L = 0; R = width; T = height/4; B = 0.75*height;
  LT = new PVector(L, T);
  RT = new PVector(R, T);
  RB = new PVector(R, B);
  LB = new PVector(L, B);
}
void doFullHorizontal(){
  L = 0; R = width; T = 0; B = height;
  LT = new PVector(L, T);
  RT = new PVector(R, T);
  RB = new PVector(R, B);
  LB = new PVector(L, B);
}
void doTriangleDown(){
  L = 0; R = width; T = 0; B = height;
  LT = new PVector(0.1*width, T);
  RT = new PVector(0.9*width, T);
  RB = new PVector(width/2, B);
  LB = new PVector(width/2, B);
}
void doOctogon(){
  L = 0; R = width; T = 0; B = height;
  LT = new PVector(L, T);
  RT = new PVector(R, T);
  RB = new PVector(R, B);
  LB = new PVector(L, B);
}
void doSomeRandom(){
   float coin = random(100);
    if(coin<20)  doTriangleUp();
    else if(coin<40)  doHalfHorizontal();
    else if(coin<60)  doFullHorizontal();
    else if(coin<80)  doTriangleDown();
    else  doOctogon();
}
