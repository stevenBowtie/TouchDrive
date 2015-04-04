import processing.net.*;
String xPos="0";
String yPos="0";
int value = 0;
PImage b;

void setup() {
  size(800, 800);
  b = loadImage("trackpad.png");
}


void draw() {
  //  triangle(800, 800, 0, 0, 0, 800);
  image(b, 0, 0, 800, 800);
  text(xPos+", "+yPos, 0, 20);
  if (mousePressed){
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
