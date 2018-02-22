import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

float p1 ;
float p2 ;
float p3 ;
float p4 ;

float p1Old = 250;
float p2Old = 250;

color paintColor = color(0, 0, 0);
int paintWidth = 1;

void setup() {
  size(500, 500);
  background(255);
  stroke(0,0,0);
  
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
}
void draw() {
        strokeWeight(p3);
        stroke(paintColor);
        line(p1Old, 500-p2Old, p1, 500-p2);
        p1Old = p1;
        p2Old = p2;
  }
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
     if(theOscMessage.checkTypetag("ffff")) { //Now looking for 2 parameters
        p1 = theOscMessage.get(0).floatValue(); //get this parameter
        p2 = theOscMessage.get(1).floatValue(); //get 2nd parameter
        p3 = theOscMessage.get(2).floatValue(); //get third parameters
        p4 = theOscMessage.get(3).floatValue(); //get fourth parameter
        println("Received new params value from Wekinator");  
        
        //here is where we actually draw on the page
        if(p4 == 1) paintColor = color(0,0,0);
        else if(p4 == 2) paintColor = color(255,0,0);
        else if(p4 == 3) paintColor = color(0,255,0);
        else if(p4 == 4) paintColor = color(255,255,255);
        else paintColor = color(193, 27, 185);
        
      } else {
        println("Error: unexpected params type tag received by Processing");
      }
 }
}