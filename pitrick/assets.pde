//12 light colors for the magic soup
color[] soupCol = {#a3e4d7,#a2d9ce,#abebc6,#a9dfbf,#aed6f1,#a9cce3,#d7bde2,#d2b4de,#f9e79f,#fad7a0,#f5cba7,#edbb99};

void drawBar(){
  pushMatrix();
  translate(xBar, yBar);
  rectMode(CENTER);
  noStroke();
  fill(190+10*timer, 210-10*timer, 70);
  rect(0, 0, width, height*0.03);                              //this is the timer bar
  if(timer < 10){
  timer = (millis()-startTime)/1000;
  } else {
    timeUp = true;
  }
  float xPointer = -width/2 + width*0.1 * timer;
  fill(0);
  rect(xPointer, 0, width*0.002, height*0.03);                 //this is the pointer
  popMatrix();
}

void drawMusic(){                                              //button to turn on and off the looping sound sequence
  fill(22);
  stroke(0);
  strokeWeight(0.9);
  rectMode(CENTER);
  rect(w-30,musicY,5,5);
  triangle(w-30,musicY, w-20,musicY-10, w-20, musicY+10);
  if(music == true){
    line(w-17,musicY+4,w-9,musicY-4);
    line(w-17,musicY-4,w-9,musicY+4);
  }else{
    line(w-17,musicY+4,w-9,musicY+7);
    line(w-17,musicY,w-9,musicY);
    line(w-17,musicY-4,w-9,musicY-7);
  }
}

void drawMap(){
  pushMatrix();
  translate(xMap, yMap);
  noStroke(); 
//preferance
  fill(#f2f4ce); //yellow sour-sweet
    triangle(0,0,-40*pSour/100,-40*sqrt(3)*pSour/100,40*pSweet/100,-40*sqrt(3)*pSweet/100); 
  fill(#eacef4); //violet sweet-bitter
    triangle(0,0,40*pSweet/100,-40*sqrt(3)*pSweet/100,80*pBitter/100,0);
  fill(#cef4d3); //green bitter-spicy
    triangle(0,0,80*pBitter/100,0,40*pSpicy/100,40*sqrt(3)*pSpicy/100);
  fill(#f4cece); //red spicy-salty
    triangle(0,0,40*pSpicy/100,40*sqrt(3)*pSpicy/100,-40*pSalty/100,40*sqrt(3)*pSalty/100);
  fill(#cee2f4); //blue salty-umami
    triangle(0,0,-40*pSalty/100,40*sqrt(3)*pSalty/100,-80*pUmami/100,0);
  fill(#f4e3ce); //brown umami-sour
    triangle(0,0,-80*pUmami/100,0,-40*pSour/100, -40*sqrt(3)*pSour/100);
//soup content
  fill(#fdff2a); //sour-sweet
    triangle(0,0,-40*sSour/100,-40*sqrt(3)*sSour/100,40*sSweet/100,-40*sqrt(3)*sSweet/100);
  fill(#e830ff); //sweet-bitter
    triangle(0,0,40*sSweet/100,-40*sqrt(3)*sSweet/100,80*sBitter/100,0); 
  fill(#3fd428); //bitter-spicy
    triangle(0,0,80*sBitter/100,0,40*sSpicy/100,40*sqrt(3)*sSpicy/100);
  fill(#d43128); //spicy-salty
    triangle(0,0,40*sSpicy/100,40*sqrt(3)*sSpicy/100,-40*sSalty/100,40*sqrt(3)*sSalty/100);
  fill(#2893d4); //salty-umami
    triangle(0,0,-40*sSalty/100,40*sqrt(3)*sSalty/100,-80*sUmami/100,0);
  fill(#b86600); //umami-sour
    triangle(0,0,-80*sUmami/100,0,-40*sSour/100, -40*sqrt(3)*sSour/100);
 popMatrix();
}

void drawPitrick(){                //pure representation: fox Pitrick is too cute to be useful:)
  pushMatrix();
  translate(xPit, yPit);
  rectMode(CENTER);
//ears 
  fill(#ab3e16);
  triangle(0,-30,-15,-60,15,-45);
  triangle(15,-45,45,-45,45,-75);
//face
  fill(#efaa52);
  quad(0,-30,15,-45,45,-45,30,-15);
//eyes
  fill(0);
  ellipse(15,-30,2.5,2.5);
  ellipse(32.5,-37,2.5,2.5);
//arms
  fill(#f8f3e6);
  stroke(#e7cc8f);
  strokeWeight(0.01);
  triangle(0,-30,30,-15,45,30);
  triangle(45,30,45,-45,30,-15);
//body
  fill(#e7cc8f);
  quad(0,-30,-30,0,0,45,45,30);
//tail
  fill(#400f0c);
  triangle(-30,0,-30,45,15,60);
  popMatrix();
}

void drawFood(){
float i = 75/4;                                      //length of one block in the translated cordination
  pushMatrix();
  translate(xFood, yFood);
  fill(255);
//keys
  textSize(15);
  textAlign(CENTER, BOTTOM);
  fill(0);
  text("S", -5*i, i);
  text("D", -3*i, i);
  text("F", -i, i);
  text("J", i, i);
  text("K", 3*i, i);
  text("L", 5*i, i);  
//karnemelk
  fill(#ff2828);                                             //left square       
  quad(-5.5*i,-0.5*i,-5*i,-0.5*i,-5*i,-i,-5.5*i,-i); 
  fill(#a50000);                                             //right square
  quad(-5*i,-0.5*i,-4.5*i,-0.5*i,-4.5*i,-i,-5*i,-i);
  fill(#3c0000);                                             //left triangle
  triangle(-5*i,-i,-5.5*i,-i,-5.25*i,-1.25*i);
  fill(#ffb8b8);                                             //right quad
  quad(-5*i,-i,-5.25*i,-1.25*i,-4.75*i,-1.25*i,-4.5*i,-i);
  fill(100);                                                 //top quad
  rect(-5*i,-1.3*i,10,2.5);
//chocolate
  fill(#9f6204);                                             //chocolate bar
  rect(-3*i, -0.95*i, 0.7*i,i);
  fill(#492100);                                             //squares on the bar
  rect(-3.2*i,-1.25*i,2.5,2.5);
  rect(-3*i,-1.25*i,2.5,2.5);
  rect(-2.8*i,-1.25*i,2.5,2.5);
  rect(-3.2*i,-1.05*i,2.5,2.5);
  rect(-3*i,-1.05*i,2.5,2.5);
  rect(-2.8*i,-1.05*i,2.5,2.5);
  rect(-3.2*i,-0.85*i,2.5,2.5);
  rect(-3*i,-0.85*i,2.5,2.5);
  rect(-2.8*i,-0.85*i,2.5,2.5);
  fill(#94137b);                                             //package paper
  noStroke();
  triangle(-3.35*i,-i,-3.35*i,-0.45*i,-2.65*i,-0.45*i);
  quad(-3*i,-i,-2.65*i,-i,-2.65*i,-0.45*i,-3*i,-0.45*i);
  triangle(-2.65*i,-i,-2.65*i,-1.5*i,-2.8*i,-i);
//beer
  fill(#ffdd75);
  stroke(0);
  strokeWeight(0.05);
  quad(-1.25*i,-i,-0.75*i,-i,-0.75*i,-0.42*i,-1.25*i,-0.42*i);       //bottle
  quad(-1.25*i,-i,-0.75*i,-i,-0.9*i,-1.2*i,-1.1*i,-1.2*i);
  fill(#0f2881);                                                     //label
  quad(-1.25*i,-i,-0.75*i,-i,-0.75*i,-0.75*i,-1.25*i,-0.75*i);
  fill(0);                                                           //bottle cap
  quad(-0.9*i,-1.2*i,-1.1*i,-1.2*i, -1.1*i,-1.45*i,-0.9*i,-1.45*i);
//chips
  fill(#f0e57b);                                                     //chips
  stroke(#ab3e16);
  strokeWeight(0.1);
  ellipse(0.7*i,-i,6,10); ellipse(0.75*i,-i,5,15); ellipse(0.8*i,-i,3,8); ellipse(0.85*i,-i,5,17);
  ellipse(0.9*i,-i,5,11); ellipse(0.95*i,-i,7,17); ellipse(i,-i,8,9); ellipse(1.05*i,-i,5,16);
  ellipse(1.1*i,-i,4,17); ellipse(1.15*i,-i,8,12); ellipse(1.2*i,-i,9,14); ellipse(1.25*i,-i,5,10);
  ellipse(1.3*i,-i,3,17);
  fill(#ff9389);                                                     //bag
  quad(0.5*i,-i,1.5*i,-i,1.5*i,-0.5*i,0.5*i,-0.5*i);
  fill(#653819);                                                     //bag opening
  quad(0.5*i,-i,1.5*i,-i,1.5*i,-0.75*i,0.5*i,-0.75*i);
//drops
  fill(#9ae1dd);                                                     //container
  quad(2.5*i,-i,3.5*i,-i,3.5*i,-0.5*i,2.5*i,-0.5*i);
  quad(2.5*i,-i,3.5*i,-i,3.15*i,-1.2*i,2.85*i,-1.2*i);
  fill(0);                                                           //container cap
  quad(3.15*i,-1.2*i,2.85*i,-1.2*i,2.85*i,-1.3*i,3.15*i,-1.3*i);
  fill(0);                                                           //drops
  stroke(#98a4cc);
  strokeWeight(0.01);
  ellipse(2.6*i,-0.65*i,3,3);ellipse(2.8*i,-0.62*i,3,3);ellipse(3*i,-0.65*i,3,3);ellipse(3.2*i,-0.79*i,3,3);ellipse(3.4*i,-0.8*i,3,3);
  ellipse(2.65*i,-0.8*i,3,3);ellipse(2.85*i,-0.82*i,3,3);ellipse(3.05*i,-0.8*i,3,3);ellipse(3.22*i,-0.69*i,3,3);ellipse(3.4*i,-0.6*i,3,3);
//ketchup
  fill(#ff2b2b);                                                     //bottle
  quad(4.5*i,-1.4*i,5.5*i,-1.4*i,5.3*i,-0.6*i,4.7*i,-0.6*i);
  fill(0);                                                           //bottle cap
  quad(5.15*i,-0.6*i,4.85*i,-0.6*i,4.85*i,-0.5*i,5.15*i,-0.5*i);
  fill(#fdb900);                                                     //label
  quad(4.55*i,-1.2*i,5.45*i,-1.2*i,5.35*i,-0.75*i,4.65*i,-0.75*i);
  fill(#329600);                                                     //tomato leaves
  triangle(4.75*i,-i,5.25*i,-i,5*i,-1.15*i);
  fill(255,0,0);                                                     //tomato
  ellipse(5*i,-0.95*i,7,3);
popMatrix();
}

void drawSoup(){
  pushMatrix();
  translate(xSoup, ySoup);
  fill(soupCol[int(random(0,12))]);                                  //random colors of the soup
  float i = 75/4;                                                    //length of one block in the cordinate
  quad(-7*i,-i,7*i,-i,5*i,2*i,-5*i,2*i);
  fill(0);
  rect(0,2*i,10*i,1);
  stroke(0);
  strokeWeight(1);
  line(-5*i,2*i,-7*i,-i);
  line(5*i,2*i,7*i,-i);
//bowl decorations left
  line(-7*i,-i,-7*i,-2*i);
  line(-7*i,-2*i,-6*i,-2*i);
  line(-6*i,-2*i,-6*i,-1.1*i);
  line(-6*i,-1.1*i,-6.6*i,-1.1*i);
  line(-6.6*i,-1.1*i,-6.6*i,-1.6*i);
  line(-6.6*i,-1.6*i,-6.35*i,-1.6*i);
  line(-6.35*i,-1.6*i,-6.35*i,-1.35*i);
//bowl decorations right
  line(7*i,-i,7*i,-2*i);
  line(7*i,-2*i,6*i,-2*i);
  line(6*i,-2*i,6*i,-1.1*i);
  line(6*i,-1.1*i,6.6*i,-1.1*i);
  line(6.6*i,-1.1*i,6.6*i,-1.6*i);
  line(6.6*i,-1.6*i,6.35*i,-1.6*i);
  line(6.35*i,-1.6*i,6.35*i,-1.35*i);
  popMatrix();
//magic snow in soup
  pushMatrix();
  translate(xSoup, ySoup+102.5);
  rotate(PI);
  float randX, randY;
  for (int s=0; s<5000; s++) {                                               //add more snow by making 's<number' bigger
    randY=random(-120, -68);
    randX=random(0.7*randY-43, -0.7*randY+43);
    if (s%2 == 0) {                                                          //add more snow by making the '%number' smaller      
      noStroke();
      fill(abs(mouseX*255/400), abs(mouseY*255/740), abs(mouseX*255/400));
      ellipse(randX, -randY, 1, 1);
    }
  }
  popMatrix();
}

void drawResult(){
  fill(252);                                              //cover the canvas
  rect(0, 0, w*2.2, h*2.2);
  drawMusic();

  //success or fail
  pushMatrix();
  translate(w/2, h/2.4);
  rectMode(CENTER);
  if (best == true) {                                     //Best: red heart + crown when score the highest 
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
  } else if (difference < average) {                      //Success: pinkish heart when score better than average
    fill(#ff4c4c);
    noStroke();
    rect(0, 0, 400, 298);
    fill(252);
    triangle(0, 150, -200, 150, -200, 0);
    triangle(0, 150, 200, 150, 200, 0);
    triangle(0, -100, -50, -150, 50, -150);
    triangle(-200, -150, -200, -100, -150, -150);
    triangle(200, -150, 200, -100, 150, -150);
  } else {                                                //Fail: heartbreak when score worse than average
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
  translate(0, h*0.35);
  stroke(0);
  noFill();
  arc(w/2, h/2, 20, 20, 0, 1.5*PI, OPEN);
  fill(0);
  triangle(w/2+5, h/2, w/2+15, h/2, w/2+10, h/2-5);
  popMatrix();
}
