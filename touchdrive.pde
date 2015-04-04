import processing.net.*; 

Client myClient; 
String xPos="0";
String yPos="0";
int deadzoneX=50;
int deadzoneY=50;
int invX=1;
int invY=-1;
int lowerX;
int upperX;
int lowerY;
int upperY;
boolean returnToZero=true;
boolean useNetwork=false;

void setup() {
  size(800, 800);
  if (useNetwork) {
    myClient = new Client(this, "127.0.0.1", 9099);
  }
  int[] deadx=deadZone(deadzoneX);
  lowerX=deadx[0];
  upperX=deadx[1];
  int[] deady=deadZone(deadzoneY);
  lowerY=deady[0];
  upperY=deady[1];
}

void draw() {
  background(50);
  fill(204, 102, 0);
  rect(lowerX, lowerY, deadzoneX, deadzoneY);
  //  text(mouseX+", "+mouseY, 10, 20);
  text(xPos+", "+yPos, 10, 20);
  position();
  if (useNetwork) {
    myClient.write(xPos+","+yPos+"\n");
  }
}

void position() {
  if (mousePressed) {
    if (mouseX<lowerX) {
      xPos=str(int(float(mouseX-lowerX)/lowerX*255*invX));
    } 
    else if (mouseX>upperX) {
      xPos=str(int(float(mouseX-upperX)/lowerX*255*invX));
    } 
    else {
      xPos="0";
    }

    if (mouseY<lowerY) {
      yPos=str(int(float(mouseY-lowerY)/lowerY*255*invY));
    } 
    else if (mouseY>upperY) {
      yPos=str(int(float(mouseY-upperY)/lowerY*255*invY));
    } 
    else {
      yPos="0";
    }
  } 
  else if (returnToZero) {
    xPos="0";
    yPos="0";
  }
}

int[] deadZone(int x) {
  int lower=(800-x)/2;
  int upper=800-lower;
  int[] data=new int[2];
  data[0]=lower;
  data[1]=upper;
  return data;
}

void keyReleased() {
  switch (key) {
  case 'n':
    if (useNetwork) {
      useNetwork=false; 
    } 
    else {
      useNetwork=true;
      setup();
    }
    break;
  case 'y':
    if (invY==-1) {
      invY=1;
    } 
    else {
      invY=-1;
    }
    break;
  case 'x':
    if (invX==-1) {
      invX=1;
    } 
    else {
      invX=-1;
    }
    break;
  }
}

