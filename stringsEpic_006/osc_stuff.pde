void oscSetup(){
  oscP5 = new OscP5(this, 6448);
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
  
  oscP5.plug(this, "xtraInput_00", "/f1/s1");
  oscP5.plug(this, "xtraInput_01", "/f1/s2");
  oscP5.plug(this, "xtraInput_02", "/f1/s3");
  oscP5.plug(this, "xtraInput_03", "/f1/s4");

  oscP5.plug(this, "xtraInput_04", "/f2/s1");
  oscP5.plug(this, "xtraInput_05", "/f2/s2");
  oscP5.plug(this, "xtraInput_06", "/f2/s3");
  oscP5.plug(this, "xtraInput_07", "/f2/s4");
  
  oscP5.plug(this, "xtraInput_08", "/f3/s1");
  oscP5.plug(this, "xtraInput_09", "/f3/s2");
  oscP5.plug(this, "xtraInput_10", "/f3/s3");
  oscP5.plug(this, "xtraInput_11", "/f3/s4");
  /*
  [17:00, 12/06/2021] Andrés Rivera: OSC-route /f1
[17:00, 12/06/2021] Andrés Rivera: OSC-route /f2
[17:00, 12/06/2021] Andrés Rivera: v
[17:00, 12/06/2021] Andrés Rivera: OSC-route /f3
[17:00, 12/06/2021] Andrés Rivera: OSC-route /s1 /s2 /s3 /s4
  */

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
float a1,a2,a3,a4,c1,c2,c3,c4,x1,x2,x3,x4;

void xtraInput_00(float v){ println("f1/s1 "+v); x1 = v; }
void xtraInput_01(float v){ println("f1/s2 "+v); x2 = v;}
void xtraInput_02(float v){ println("f1/s3 "+v); x3 = v;}
void xtraInput_03(float v){ println("f1/s4 "+v); x4 = v;}

void xtraInput_04(float v){ println("f2/s1 "+v); c1 = v;}
void xtraInput_05(float v){ println("f2/s2 "+v); c2 = v;}
void xtraInput_06(float v){ println("f2/s3 "+v); c3 = v;}
void xtraInput_07(float v){ println("f2/s4 "+v); c4 = v;}

void xtraInput_08(float v){ println("f3/s1 "+v); a1 = v;}
void xtraInput_09(float v){ println("f3/s2 "+v); a2 = v;}
void xtraInput_10(float v){ println("f3/s3 "+v); a3 = v;}
void xtraInput_11(float v){ println("f3/s4 "+v); a4 = v;}
