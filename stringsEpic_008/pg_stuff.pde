void pgSetup(){
  pg = createGraphics(width,height/2,P3D);
  pg.colorMode(HSB);
}
void nothing(){pg.beginDraw();pg.background(0);pg.endDraw();}

void drawPg(){
  if(submode==0){
    simpleStrokes_001();
  }else if(submode==1){
    simpleStrokes_002();
  }else if(submode==2){
    simpleStrokes_003();
  }else if(submode==3){
    simpleStrokes_004();
  }else if(submode==4){
    nothing();
  }else if(submode==5){
    float coin = random(100);
    if(coin<33)  simpleStrokes_001();
    else if(coin<66)  simpleStrokes_002();
    else simpleStrokes_004();
  }else if(submode==6){
    float coin = random(100);
    if(coin<20)  simpleStrokes_001();
    else if(coin<40)  simpleStrokes_002();
    else if(coin<60)  simpleStrokes_003();
    else if(coin<80)  simpleStrokes_004();
    else  simpleStrokes_005();
  }
  
}
void simpleStrokes_001(){
  float wscale = pg.height/8;
  int bg = doInvert? 255:0;
  bg = doBlink? (random(100)>50?0:255) : bg;
  int fg = bg==255? 0: 255; 
  pg.colorMode(HSB);
  pg.beginDraw();
  pg.background(bg);//,255,255);
  pg.noFill();
  pg.strokeWeight(4+c5*0.2);
  float u =  map(1,0,in.bufferSize(),0,pg.width);
  pg.beginShape();
  for(int i = 0; i < in.bufferSize() - 1; i++){
    float x = map(i,0,in.bufferSize(),0,pg.width);    
    pg.stroke(fg);
    pg.vertex( x, pg.height/2 + in.right.get(i)*wscale);
    //pg.vertex(, x+u, pg.height/2 + in.right.get(i+1)*wscale );
  }
  pg.endShape();
  pg.endDraw();
}
void simpleStrokes_002(){
  float wscale = pg.height;
  int bg = doInvert? 255:0;
  bg = doBlink? (random(100)>50?0:255) : bg;
  int fg = bg==255? 0: 255; 
  pg.colorMode(HSB);
  pg.beginDraw();
  pg.background(bg);//,255,255);
  pg.noFill();
  pg.strokeWeight(4+c5*0.2);
  float u =  map(1,0,in.bufferSize(),0,pg.width);
  for(int i = 0; i < in.bufferSize() - 1; i+=4){
    float x = map(i,0,in.bufferSize(),0,pg.width);    
    pg.stroke(fg);
    pg.line( x, 0, x , in.right.get(i)*wscale );
  }
  pg.endDraw();
}
void simpleStrokes_003(){
  float wscale = pg.height;
  int bg = doInvert? 255:0;
  bg = doBlink? (random(100)>50?0:255) : bg;
  int fg = bg==255? 0: 255; 
  pg.colorMode(HSB);
  pg.beginDraw();
  pg.background(0);//,255,255);
  pg.noFill();
  pg.strokeWeight(4+c5*0.2);
  float u =  map(1,0,in.bufferSize(),0,pg.width);
  for(int i = 0; i < in.bufferSize() - 1; i+=4){
    float x = map(i,0,in.bufferSize(),0,pg.width);    
    pg.stroke(random(255),255,255);
    pg.line( x, 0, x , in.right.get(i)*wscale );
  }
  pg.endDraw();
}
void simpleStrokes_004(){
  float wscale = pg.height;
  int bg = doInvert? 255:0;
  bg = doBlink? (random(100)>50?0:255) : bg;
  int fg = bg==255? 0: 255; 
  pg.colorMode(HSB);
  pg.beginDraw();
  pg.background(bg);//,255,255);
  pg.noFill();
  pg.strokeWeight(4+c5*0.2);
  float u =  map(1,0,in.bufferSize(),0,pg.width);
  for(int i = 0; i < in.bufferSize() - 1; i+=2){
    float x = map(i,0,in.bufferSize(),0,pg.width);    
    pg.stroke(fg);
    if(in.right.get(i)>0.5)    pg.line( x, 0, x , pg.height );
  }
  pg.endDraw();
}
void simpleStrokes_005(){
  float wscale = pg.height;
  int bg = doInvert? 255:0;
  bg = doBlink? (random(100)>50?0:255) : bg;
  int fg = bg==255? 0: 255; 
  pg.colorMode(HSB);
  pg.beginDraw();
  pg.background(bg);//,255,255);
  pg.noFill();
  pg.strokeWeight(4+c5*0.2);
  for(int i = 0; i < in.bufferSize() - 1; i+=2){
    float x = map(i,0,in.bufferSize(),0,pg.width);    
    pg.stroke(random(255),255,255);
    if(in.right.get(i)>0.5)    pg.line( x, 0, x , pg.height );
  }
  pg.endDraw();
}
























void doPGTriangles(){
  pg.beginDraw();
  pg.colorMode(RGB);
  pg.background(0);//,8);//255);
  pg.translate(pg.width/2,pg.height/2);
  //pg.rotateX(radians(30+frameCount));
  /*pg.scale(
        0.8+abs(in.right.get(0))*10
      );
  */
  //pg.rotateZ(radians(frameCount*0.5));
  //pg.box(200);
  float r = 240;
  float rr = r*sqrt(3);//2*r*sin(radians(30));
  
  int steps = 36;
  int vertex = 3;
  int mod = steps/vertex;
  int j = 0;//frameCount%36;
  int k = steps/3;//(frameCount+12)%36;
  int l = 2*steps/3;//(frameCount+24)%36;
  float a0 = 0;
  float a1 = TWO_PI/3;
  float a2 = 2*TWO_PI/3;
  float dA = TWO_PI/steps;
  float aaa;
  //
  PVector a, b, c, o, p, pp, q, qq, oo;
  a = new PVector(r*cos(a0),r*sin(a0));
  b = new PVector(r*cos(a1),r*sin(a1));
  c = new PVector(r*cos(a2),r*sin(a2));
  o = new PVector(0,0);
  
  pg.strokeWeight(2);
  pg.noFill(); pg.stroke(0,255,0);
  pg.ellipse(0,0,2*r,2*r);
  pg.triangle(a.x,a.y,b.x,b.y,c.x,c.y);
   pg.stroke(0,0,255);  
  pg.ellipse(a.x,a.y,2*rr,2*rr);
  pg.ellipse(b.x,b.y,2*rr,2*rr);
  pg.ellipse(c.x,c.y,2*rr,2*rr);
  pg.noStroke();pg.fill(255,0,0);
  pg.box(10);
  
  for(int i=0; i<steps; i++){
    p = new PVector(r*cos(i*dA),r*sin(i*dA));
    pp = new PVector();
    aaa = i*dA*0.5+PI;//radians(30);//*.5;
    
    int pseudoI = (frameCount/4)%steps;
    float D;
    q = new PVector();
    if(i>=j && i<k){
     oo = c;
     q = intersect(a,b,o,p);
     pp.x = oo.x + rr*cos(aaa);
     pp.y = oo.y + rr*sin(aaa);
     qq = intersect(a,b,oo,pp);
    }else if(i>=k && i<l){
     oo = a;
     q = intersect(b,c,o,p);
     pp.x = oo.x + rr*cos(aaa);
     pp.y = oo.y + rr*sin(aaa);
     qq = intersect(b,c,oo,pp);
    }else{
     oo = b;
     q = intersect(a,c,o,p);
     pp.x = oo.x + rr*cos(aaa);
     pp.y = oo.y + rr*sin(aaa);
     qq = intersect(c,a,oo,pp);
    }
    if(i==pseudoI){
      pg.stroke(255,0,0);
      pg.line(o.x,o.y,p.x,p.y);
      pg.line(oo.x,oo.y,pp.x,pp.y);
      
      pg.pushMatrix();
      pg.translate(q.x,q.y);
      pg.noStroke();pg.fill(0,0,255);
      pg.box(10);
      pg.popMatrix();
    }
    pg.noStroke();
    pg.pushMatrix();
    pg.fill(i==pseudoI? color(255,0,0):255);
    pg.translate(p.x,p.y);pg.box(10);
    pg.popMatrix();
    
    pg.pushMatrix();
    pg.fill(i==pseudoI? color(0,255,255):255);
    pg.translate(pp.x,pp.y);pg.box(10);
    pg.popMatrix();
  }
  //pg.filter(INVERT);
  pg.endDraw();
}
PVector intersect(PVector a, PVector b, PVector o, PVector p){
  PVector q = new PVector();
  float D = (a.x-b.x)*(o.y-p.y)-(a.y-b.y)*(o.x-p.x);
  q.x = ((a.x*b.y-a.y*b.x)*(o.x-p.x)-(a.x-b.x)*(o.x*p.y-o.y*p.x))/D;
  q.y = ((a.x*b.y-a.y*b.x)*(o.y-p.y)-(a.y-b.y)*(o.x*p.y-o.y*p.x))/D;
  return q;
}void drawBasics(PGraphics pg){
  
}
