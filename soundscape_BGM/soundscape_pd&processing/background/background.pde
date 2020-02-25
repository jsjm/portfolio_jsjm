import netP5.*;
import oscP5.*;
int bgm1, bgm2, bgm3, bgm4, bgm5, bgm6, bgm7, bgm8, bgm9, bgm10, bgm0;
float n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
int mute;
boolean muteClicked;

OscP5 osc;

NetAddress puredata;

boolean pressed;
float rectX = random(0,395);
float rectY = random(0,395);
float lineX1, lineX2, lineY1, lineY2;
PImage img , ear;

void setup() {
  size(1008,720);  
  osc = new OscP5(this, 12000);
  // PureData address
  puredata = new NetAddress("localhost",8000);
  img = loadImage("img.png");
  ear = loadImage("ear.png");
}

void draw() {
  image(img, 0, 0, width, height);
  image(ear, mouseX-25, mouseY-25, 50, 50);
  check();
  addBgm();
  //ellipse(120, 100, 220, 220); //1
  //ellipse(460, 110, 220, 220); //2
  //ellipse(680, 130, 220, 220); //3
  //ellipse(890, 200, 220, 220); //4
  //ellipse(170, 350, 270, 270); //5
  //ellipse(460, 350, 220, 220); //6
  //ellipse(900, 460, 220, 220); //7
  //ellipse(150, 670, 300, 300); //8
  //ellipse(500, 590, 250, 250); //9
  //ellipse(750, 650, 220, 220); //10
  
  if (muteClicked){
    fill(#aa706a);
    ellipse(975, 30, 20, 20);
  }else if(!muteClicked){
    fill(#5d5d5d);
    ellipse(975, 30, 20, 20);
  }
}

void mute(){
   bgm1 = 0; bgm2 = 0; bgm3 = 0; bgm4 = 0; bgm5 = 0; bgm6 = 0; 
   bgm7 = 0; bgm8 = 0; bgm9 = 0; bgm10 = 0; bgm0 = 0; 
   n1 = 0; n2 = 0; n3 = 0; n4 = 0; n5 = 0; n6 = 0; n7 = 0; 
   n8 = 0; n9 = 0; n10 = 0; 
}

void check() {
  if (dist(mouseX, mouseY, 120,100 ) <= 110){           //area 1
   mute();
   bgm1 = 1;
   n1 = 1 - (dist(mouseX, mouseY, 120,100)/110);
  }else if (dist(mouseX, mouseY, 460,110 ) <= 110){     //area 2
   mute();
   bgm2 = 1;
   n2 = 1 - (dist(mouseX, mouseY, 460,110)/110);
  }else if (dist(mouseX, mouseY, 680,130 ) <= 110){     //area 3
   mute();
   bgm3 = 1;
   n3 = 1 - (dist(mouseX, mouseY, 680,130)/110);
  }else if (dist(mouseX, mouseY, 890,200 ) <= 110){     //area 4
   mute();
   bgm4 = 1;
   n4 = 1 - (dist(mouseX, mouseY, 890,200)/110);
  }else if (dist(mouseX, mouseY, 170,350 ) <= 135){     //area 5
   mute();
   bgm5 = 1;
   n5 = 1 - (dist(mouseX, mouseY, 170,350)/135);
  }else if (dist(mouseX, mouseY, 460,350 ) <= 110){     //area 6
   mute();
   bgm6 = 1;
   n6 = 1 - (dist(mouseX, mouseY, 460,350)/110);
  }else if (dist(mouseX, mouseY, 900,460 ) <= 110){     //area 7
   mute();
   bgm7 = 1;
   n7 = 1 - (dist(mouseX, mouseY, 900,460)/110);
  }else if (dist(mouseX, mouseY, 150,670 ) <= 150){     //area 8
   mute();
   bgm8 = 1;
   n8 = 1 - (dist(mouseX, mouseY, 150,670)/150);
  }else if (dist(mouseX, mouseY, 500,590 ) <= 125){     //area 9
   mute();
   bgm9 = 1;
   n9 = 1 - (dist(mouseX, mouseY, 500,590)/125);
  }else if (dist(mouseX, mouseY, 750,650 ) <= 110){     //area 10
   mute();
   bgm10 = 1;
   n10 = 1 - (dist(mouseX, mouseY, 750,650)/110);
  }else{                                                //other areas
   mute();
   bgm0 = 1;
  }
}

void addBgm(){
  OscMessage myMessage = new OscMessage("/bgm1");
    myMessage.add(bgm1);
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm2");
    myMessage.add(bgm2); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm3");
    myMessage.add(bgm3); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm4");
    myMessage.add(bgm4); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm5");
    myMessage.add(bgm5); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm6");
    myMessage.add(bgm6); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm7");
    myMessage.add(bgm7); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm8");
    myMessage.add(bgm8); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm9");
    myMessage.add(bgm9); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm10");
    myMessage.add(bgm10); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/bgm0");
    myMessage.add(bgm0); 
    osc.send(myMessage, puredata);
  
  myMessage = new OscMessage("/n1");                  //noises
    myMessage.add(n1); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n2");
    myMessage.add(n2); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n3");
    myMessage.add(n3); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n4");
    myMessage.add(n4); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n5");
    myMessage.add(n5); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n6");
    myMessage.add(n6); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n7");
    myMessage.add(n7); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n8");
    myMessage.add(n8); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n9");
    myMessage.add(n9); 
    osc.send(myMessage, puredata);
  myMessage = new OscMessage("/n10");
    myMessage.add(n10); 
    osc.send(myMessage, puredata);
}

void mousePressed(){
  if (dist (mouseX, mouseY, 975, 30) < 10 && !muteClicked){
    muteClicked = true;
    mute = 1;
  }else if (dist (mouseX, mouseY, 975, 30) < 10 && muteClicked){
    muteClicked = false;
    mute = 0;
  }
   OscMessage myMessage = new OscMessage("/mute");
   myMessage.add(mute); 
   osc.send(myMessage, puredata);
}

//void mouseReleased() {
// pressed = false; 
// OscMessage myMessage = new OscMessage("/mute");
// myMessage.add(0); 
// osc.send(myMessage, puredata);
//}

void mouseMoved() {
    // send 2 osc messages with address /mousex and /mousey 
    // when the mouse is moved
  OscMessage myMessage = new OscMessage("/mouseX");
  myMessage.add(mouseX); /* add an int to the osc message */
    osc.send(myMessage, puredata);
    
  myMessage = new OscMessage("/mouseY");
  myMessage.add(mouseY); /* add an int to the osc message */
    osc.send(myMessage, puredata);
}
