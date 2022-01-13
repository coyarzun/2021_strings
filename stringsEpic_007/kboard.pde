void keyPressed() {
  if (key=='1') mode = 0;
  if (key=='2') mode = 1;
  if (key=='3') mode = 2;
  if (key=='4') mode = 3;
  //if(key=='5') mode = 4;

  if (key=='q') submode = 0;
  if (key=='w') submode = 1;
  if (key=='e') submode = 2;
  if (key=='r') submode = 3;
  if (key=='t') submode = 4;
  if (key=='y') submode = 5;
  if (key=='u') submode = 6;

  if (key=='a') maskMode = 0;
  if (key=='s') maskMode = 1;
  if (key=='d') maskMode = 2;
  if (key=='f') maskMode = 3;
  if (key=='g') maskMode = 4;
  if (key=='h') maskMode = 5;

  if (key=='r') shaderSetup();
  if (key=='i') doInvert=!doInvert;
  if (key=='k') doBlink=!doBlink;
}
