//*****************************************************************************************************
//Course        : Science and Humanities
//Game name     : Warm-Blooded
//Author        : Jeannette Shijie Ma - S2163004
//Last Modified : 20190125
//Actions       : Use left and right key, read texts and instructions
//Version       : 1.0
//To do         : polish representation; add one chapter
//*****************************************************************************************************
float w, h;//canvas size
//assets position
float manX, manY;
float springX, summerX, autumnX, winterX, seasonsY;
float thermometerX =0, thermometerY=0;
float dialogueX, dialogueY;
float tiSpr, tiSum, tiAut, tiWin, time; //register time in different seasons
float teSpr=20, teSum=40, teAut=15, teWin=-20, bodyTemp = 37.5, tChange; //temperatures
boolean cSpr, cSum, cAut, cWin, cAll; // seasons checked
boolean hasThermo = false, timer; //when get the thermometer
boolean[] d = new boolean[20]; // dialogues check
boolean knowIll, tbc; //storyline checks 
boolean cho1 = false, cho2 = false, induction = false, deduction = false, science = false, qi = false;
boolean brainWave=false, qiActive=false;
boolean reset;
String t = " "; //text of the dialogues
void setup (){
  size(500, 150);
  w = width; h = height;
  springX=w*0.3;summerX=w*0.5;autumnX=w*0.7;winterX=w*0.9;seasonsY=h*4/5;
  manX = w*0.1; manY = h*0.9;
  dialogueX = w/2; dialogueY = h*0.3;
  noDial();
}
void draw(){
  background(247);
  rectMode(CENTER);
  noStroke();
  checkDist();
  timer();
  if(!tbc){
  dialogues();
  drawSpring();
  drawSummer();
  drawAutumn();
  drawWinter();
  drawMan();
  learn();
  if(knowIll){
    if(!hasThermo){thermometerX = w*0.1; thermometerY = h*0.9;drawThermo();}
    if (dist(manX,manY,thermometerX,thermometerY) <= 20){hasThermo = true;}
  }
  if(hasThermo){thermoDisplay();}
  }else if(tbc){
    tbc();
    if(reset){reset();println("reset drawn");}
  }  
}
void checkDist(){
//check seasons
  if(abs(springX-manX) <= h-seasonsY+4){
     cSpr = true; 
     tiSpr = millis() - time;
     timer = false;
  }else if(abs(summerX-manX) <= h-seasonsY+4){
     cSum = true;
     tiSum = millis() - time;
     timer = false;
  }else if(abs(autumnX-manX) <= h-seasonsY+4){
     cAut = true;
     tiAut = millis() - time;
     timer = false;
  }else if(abs(winterX-manX) <= h-seasonsY+4){
     cWin = true;
     tiWin = millis() - time;
     timer = false;
     cAll = true;        //cAll used for the first time
  }else{
    cSpr = false;
    cSum = false;
    cAut = false;
    cWin = false;
    timer = true;
    bodyTemp = 37.5;
  }
}
void timer(){
  if(timer){
   time = millis();   
  }
}
void reset() {                                              
  noDial(); reset = false; knowIll = false; cho1 = false; cho2 = false;
  induction = false; deduction = false; science = false; qi = false;
  brainWave=false; qiActive=false; t=" "; hasThermo = false; manX = w*0.1; tbc = false; 
}
void keyPressed(){
  if(key == CODED){
   if(manX > 0 && keyCode == LEFT){
     manX -= 9;
     if(bodyTemp < 37.3){bodyTemp += 0.05;}
   }else if(manX < w && keyCode == RIGHT){
     manX += 9;
     if(bodyTemp < 37.3){bodyTemp += 0.05;}
   }  
  }
  if(cho1){
    if(key == 's' || key == 'S'){deduction = true; cho1 = false;}
    if(key == 'd' || key == 'D'){induction = true; cho1 = false;}
  }
  if(cho2){
    if(key == 'k' || key == 'K'){science = true; cho2 = false;}
    if(key == 'l' || key == 'L'){qi = true; cho2 = false;}
  }
}
void mousePressed() {
  if (tbc && dist(mouseX, mouseY, w/2, 0.7*h) <10) {      //check replay button clicked
    reset=true;
    println("press works");
  }
}
