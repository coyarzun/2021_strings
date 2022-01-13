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
  shaders[currentShader].set("time", radians(millis())*0.01);
  //shaders[currentShader].set("textureMap", curves);
  /*
  shader.set("micIn", micIn);
  */
}
