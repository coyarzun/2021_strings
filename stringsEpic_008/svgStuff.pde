int currentShape = 0;

void shapesSetup(){
  shapes = new PShape[3];
  shapes[0] = loadShape("../_data/svg/linesTest_001.svg");
  shapes[1] = loadShape("../_data/svg/linesTest_002.svg");
  shapes[2] = loadShape("../_data/svg/linesTest_003.svg");
}
void shapesUpdate(){
  currentShape  = int(random(shapes.length));
}
