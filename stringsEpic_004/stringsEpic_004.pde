import ddf.minim.*;
import oscP5.*;
import netP5.*;
//////////////////////////////////////////////
Minim       minim;
AudioInput  in;
OscP5       oscP5;
NetAddress  myRemoteLocation;
//////////////////////////////////////////////
PShader[] shaders;
PShape[]  shapes;
PImage    curves;
PImage    micIn;
PGraphics pg;
//////////////////////////////////////////////
int L, R, T, B;
PVector LT, RT, RB, LB;
int mode;
//////////////////////////////////////////////
void setup(){
  size(1920,540,P3D);
  colorMode(HSB,256);
  L = 0; R = width; T = 0; B = height;
  LT = new PVector(L, T);
  RT = new PVector(R, T);
  RB = new PVector(R, B);
  LB = new PVector(L, B);
  shapesSetup();
  shaderSetup();
  pgSetup();
  oscSetup();
}
void draw(){
  background(0);//192,255,255);
  drawPg();
  shapesUpdate();
  shaderUpdate();
  noStroke();
  noFill();fill(255);
  textureMode(NORMAL);
  beginShape();
  if(currentShader!=1)texture(pg);
  vertex(LT.x, LT.y,0.0,0.0);
  vertex(RT.x, RT.y,1.0,0.0);
  vertex(RB.x, RB.y,1.0,1.0);
  vertex(LB.x, LB.y,0.0,1.0);
  endShape(CLOSE);
  //translate(width/2,height/2);
  shapeMode(CENTER);
  shape(shapes[currentShape]);
}
