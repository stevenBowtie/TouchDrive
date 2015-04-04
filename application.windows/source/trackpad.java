import processing.core.*; 
import processing.xml.*; 

import processing.net.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class trackpad extends PApplet {


String xPos="0";
String yPos="0";
int value = 0;
PImage b;

public void setup() {
  size(800, 800);
  b = loadImage("trackpad.png");
}


public void draw() {
  //  triangle(800, 800, 0, 0, 0, 800);
  image(b, 0, 0, 800, 800);
  text(xPos+", "+yPos, 0, 20);
  if (mousePressed){
    if (370<mouseX && mouseX<430) {
    xPos=str(0);
  }  else{
  xPos=str(PApplet.parseFloat(mouseX-370)/370*255);
  }
  if (370<mouseY && mouseY<430) {
    yPos=str(0);
  }  else{
  yPos=str(PApplet.parseFloat(-(mouseY-370))/370*255);
  }
  }
  else {
  xPos="0";
  yPos="0";
  }
}

/*void mouseDragged() {
  if (370<mouseX && mouseX<430) {
    xPos=str(0);
  }  else{
  xPos=str(float(mouseX-370)/370*255);
  }
  if (370<mouseY && mouseY<430) {
    yPos=str(0);
  }  else{
  yPos=str(float(-(mouseY-370))/370*255);
  }
}
//x/400*255
*/
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "trackpad" });
  }
}
