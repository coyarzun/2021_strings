int currentShader = 0;

void shaderSetup(){
  shaders = new PShader[3];
  shaders[0] = loadShader("../_data/shaders/stringsShader_001.glsl");
  shaders[1] = loadShader("../_data/shaders/stringsShader_002.glsl");
  shaders[2] = loadShader("../_data/shaders/stringsShader_003.glsl");
}
void shaderUpdate(){
  if(mode==0)
  currentShader = 0;
  else if(mode==1)
  currentShader = 1;
  else if(mode==2)
  currentShader = 2;
  else currentShader = int(random(shaders.length));
  
  shader(shaders[currentShader]);
  shaders[currentShader].set("resolution", float(width), float(height));
  shaders[currentShader].set("time", radians(millis())*timeScale);
  shaders[currentShader].set("textureMap", curves);
  shaders[currentShader].set("micIn", micIn);
  
  //if(currentShader==1){
    
    if(mode!=3){
    shaders[currentShader].set("a1", a1);
    shaders[currentShader].set("a2", a2);
    shaders[currentShader].set("a3", a3);
    shaders[currentShader].set("a4", a4);
    
    shaders[currentShader].set("a5", a5);
    shaders[currentShader].set("a6", a6);
    
    shaders[currentShader].set("a7", a7);//1+map(a7,0,200,0,8));
    shaders[currentShader].set("a8", a8);//1+map(a8,0,200,0,8));
    shaders[currentShader].set("a9", a9);//1+map(a9,0,200,0,8));
    shaders[currentShader].set("c5", c5);//1+map(c5,0,200,0,8));
    shaders[currentShader].set("c6", c6);//1+map(c6,0,200,0,8));
    
    shaders[currentShader].set("c1", c1);
    shaders[currentShader].set("c2", c2);
    shaders[currentShader].set("c3", c3);
    shaders[currentShader].set("c4", c4);
    

    
    shaders[currentShader].set("x1", x1);
    shaders[currentShader].set("x2", x2);
    shaders[currentShader].set("x3", x3);
    shaders[currentShader].set("x4", x4);
    
    shaders[currentShader].set("op", 0.5+abs(in.right.get(0))*8.0);
    
    }else{
    shaders[currentShader].set("a1", a7);
    shaders[currentShader].set("a2", a8);
    shaders[currentShader].set("a3", a3);
    shaders[currentShader].set("a4", a1);
    
    shaders[currentShader].set("a5", a5);
    shaders[currentShader].set("a6", a6);
    
    shaders[currentShader].set("c1", a8);
    shaders[currentShader].set("c2", a3);
    shaders[currentShader].set("c3", a1);
    shaders[currentShader].set("c4", a2);
    
    shaders[currentShader].set("a7", a7);//1+map(a7,0,200,0,8));
    shaders[currentShader].set("a8", a8);//1+map(a8,0,200,0,8));
    shaders[currentShader].set("a9", a9);//1+map(a9,0,200,0,8));
    shaders[currentShader].set("c5", c5);//1+map(c5,0,200,0,8));
    shaders[currentShader].set("c6", c6);//1+map(c6,0,200,0,8));
    
    shaders[currentShader].set("x1", a9);
    shaders[currentShader].set("x2", a1);
    shaders[currentShader].set("x3", a2);
    shaders[currentShader].set("x3", a3);
    
    shaders[currentShader].set("op", 0.5+abs(in.right.get(0))*8.0);
    }
  //}
  println(">>>>>>>>>>>>>>>>>>>>>>>"+ a7);
}
