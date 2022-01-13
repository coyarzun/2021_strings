void oscSetup(){
  oscP5 = new OscP5(this, 12000);
  String ip = "localhost";
  myRemoteLocation = new NetAddress(ip, 12000);//

  oscP5.plug(this, "helloWorld",   "/helloWorld");
  oscP5.plug(this, "setL",  "/setL");
  oscP5.plug(this, "setR",  "/setR");
  oscP5.plug(this, "setT",  "/setT");
  oscP5.plug(this, "setB",  "/setB");
  
  oscP5.plug(this, "setLT",  "/setLT");
  oscP5.plug(this, "setRT",  "/setRT");
  oscP5.plug(this, "setRB",  "/setRB");
  oscP5.plug(this, "setLB",  "/setLB");
  
  oscP5.plug(this, "setMode",   "/setMode");

}
void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
   */
  if (theOscMessage.isPlugged()==false) {
    /* print the address pattern and the typetag of the received OscMessage */
    println("### received an osc message.");
    println("### addrpattern\t"+theOscMessage.addrPattern());
    println("### typetag\t"+theOscMessage.typetag());
  }
}
//////////////////////////////////////////////////////       
void helloWorld (float v){    if(v==1.0)println("helloWorld");   }
void setL       (float v){    L = int(map(v,0.0,1.0,0,width)); }
void setR       (float v){    R = int(map(v,0.0,1.0,0,width)); }
void setT       (float v){    println(">>"+T); T = int(map(v,0.0,1.0,0,height));  }
void setB       (float v){    B = int(map(v,0.0,1.0,0,height));}

void setLT      (float v, float w){ LT.x = map(v,0.0,1.0,0,width); LT.y = map(w,0.0,1.0,0,height);  };
void setRT      (float v, float w){ RT.x = map(v,0.0,1.0,0,width); RT.y = map(w,0.0,1.0,0,height);  };
void setRB      (float v, float w){ RB.x = map(v,0.0,1.0,0,width); RB.y = map(w,0.0,1.0,0,height);  };
void setLB      (float v, float w){ LB.x = map(v,0.0,1.0,0,width); LB.y = map(w,0.0,1.0,0,height);  };

void setMode    (float v){    mode   = int(v); println("set mode: "+v);   }
