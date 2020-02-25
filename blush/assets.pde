//12 light colors for the neutral state hearts
color[] heartCol = {#a3e4d7,#a2d9ce,#abebc6,#a9dfbf,#aed6f1,#a9cce3,#d7bde2,#d2b4de,#f9e79f,#fad7a0,#f5cba7,#edbb99};

class Heart{
  color col;
  int pitch;                                     //the hearts will blush corresponding to the bgm(sound effect sequence).
  float xPos, yPos;
  boolean blush = false;
  Heart(int _pitch){
   pitch = _pitch;
   col = heartCol[int(random(0,12))]; 
   for(int i=0; i<84; i++){                      //84 hearts corresponding to 84 notes of the 7 octaves
    xPos = (pitch%12+1)*w/12-w/24;
    yPos = (pitch%7+1)*(h-topSpace)/7+topSpace/2;
   }  
  }
  
  void drawHearts(){
    pushMatrix();
    rectMode(CENTER);
    translate(xPos,yPos);
    fill(col);
    if(blush){
      fill(#ff2b2b);
    }
    noStroke();
    float rW = w/20; //for input convinience                          
    float rH = 0.75*w/20;                     
    rect(0, 0, 0.95*w/20, 0.75*0.95*w/20);
    fill(252);
    triangle(0, rH/2, -rW/2, rH/2, -rW/2, 0);
    triangle(0, rH/2, rW/2, rH/2, rW/2, 0);
    triangle(0, -rW/4, -rW/8, -rH/2, rW/8, -rH/2);
    triangle(-rW/2, -rH/2, -rW/2, -rW/4, -rH/2, -rH/2);
    triangle(rW/2, -rH/2, rW/2, -rW/4, rH/2, -rH/2);
    popMatrix();
  }
  void blush(){ //check current playing notes -> light up the corresponding hearts
    if (pitch!=0 && (pitch == currentPitch[0] ||pitch == currentPitch[1] ||pitch == currentPitch[2] ||pitch == currentPitch[3])){
      blush = true;
    }
  }
}

void drawBar(){                                   
  pushMatrix();
  translate(xBar, yBar);
  rectMode(CENTER);
  noStroke();
  fill(190+10*timer, 210-10*timer, 70);           //bar color change from green to red
  rect(0, 0, w, h*0.03);                          //this is the timer bar
  if(timer < 10){
  timer = (millis()-startTime)/1000;
  } else {
    timeUp = true;
  }
  float xPointer = -w/2 + h*0.15 * timer;
  fill(0);
  rect(xPointer, 0, w*0.002, h*0.03);             //this is the pointer
  popMatrix();
 
}

void drawResult(){
  fill(252); 
  rect(0, 0, w*2, h*2);                           //cover the canvas
//success or fail (or being the best)
  pushMatrix();
  translate(w/2, h/2.2);
  rectMode(CENTER);
  if (best) {                                     // Best: red heart + crown when score the highest 
    fill(#ff0000);
    noStroke();
    rect(0, 0, 400, 298);
    fill(252);
    triangle(0, 150, -200, 150, -200, 0);
    triangle(0, 150, 200, 150, 200, 0);
    triangle(0, -100, -50, -150, 50, -150);
    triangle(-200, -150, -200, -100, -150, -150);
    triangle(200, -150, 200, -100, 150, -150);
//crown
    fill(#ffce00);
    triangle(-75, 25, -50, -50, -25, 25);
    triangle(75, 25, 50, -50, 25, 25);
    triangle(-25, 25, 0, -75, 25, 25);
    rect(0, 5, 100, 40);
    fill(#3c00ff);
    ellipse(0, 0, 20, 20);
    fill(#b000ff);
    ellipse(-50, 0, 10, 10);
    ellipse(50, 0, 10, 10);
  } else if (curScore > average) {                // Success: pinkish heart when score better than average
    fill(#ff4c4c);
    noStroke();
    rect(0, 0, 400, 298);
    fill(252);
    triangle(0, 150, -200, 150, -200, 0);
    triangle(0, 150, 200, 150, 200, 0);
    triangle(0, -100, -50, -150, 50, -150);
    triangle(-200, -150, -200, -100, -150, -150);
    triangle(200, -150, 200, -100, 150, -150);
  } else {                                        // Fail: heartbreak when score worse than average
    fill(255, 0, 0);
    noStroke();
    rect(0, 0, 400, 298);
    fill(252);
    triangle(0, 150, -200, 150, -200, 0);
    triangle(0, 150, 200, 150, 200, 0);
    triangle(0, -100, -50, -150, 50, -150);
    triangle(-200, -150, -200, -100, -150, -150);
    triangle(200, -150, 200, -100, 150, -150);
    stroke(252);
    strokeWeight(20);
    line(0, -115, 25, -75);
    line(25, -75, -25, -25);
    line(-25, -25, 25, 25);
    line(25, 25, -25, 75);
    line(-25, 75, 0, 150);
    strokeWeight(1);
  }
  popMatrix();
//restart button
  pushMatrix(); 
  translate(0, 0.4*h);
  stroke(0);
  noFill();
  arc(w/2, h/2, 20, 20, 0, 1.5*PI, OPEN);
  fill(0);
  triangle(w/2+5, h/2, w/2+15, h/2, w/2+10, h/2-5);
  popMatrix();
}
