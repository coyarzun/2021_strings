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
  
  if(currentShader==1){
    shaders[currentShader].set("a1", a1);
    shaders[currentShader].set("a2", a2);
    shaders[currentShader].set("a3", a3);
    shaders[currentShader].set("a3", a4);
    
    shaders[currentShader].set("c1", c1);
    shaders[currentShader].set("c2", c2);
    shaders[currentShader].set("c3", c3);
    shaders[currentShader].set("c3", c4);
    
    shaders[currentShader].set("x1", x1);
    shaders[currentShader].set("x2", x2);
    shaders[currentShader].set("x3", x3);
    shaders[currentShader].set("x3", x4);
    
    shaders[currentShader].set("op", abs(in.right.get(06))*2.0);
  }
}
