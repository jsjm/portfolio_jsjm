void learn(){ //this is the function to manage the storyline
  if(!hasThermo){
    if(cWin && !d[1]){d[0] = true;}
    if(d[0]){if(bodyTemp < 35 || bodyTemp > 39){    // learn when get ill
      knowIll = true;d[1] = true; shutUp(1);
    }}  
  }else {
    if(d[1]){d[2] = true;shutUp(2);}
    if(d[2]){if(bodyTemp < 35 || bodyTemp > 39){d[3] = true;shutUp(3);}}
  }
  if(d[3]){text("?",w*0.1,h*0.9);}
  if(d[3] && abs(manX - w*0.1) <= 5){d[4] = true; shutUp(4);} 
  if(d[4]){choice1();} 
  if(deduction){d[5] = true;shutUp(5);}
  if(induction){shutUp(6);}
  if(induction || d[5]){
    if(cSpr && bodyTemp < 37.45){d[6] = true;shutUp(6);}
    if(cSum && d[6] & bodyTemp > 39){d[7] = true;shutUp(7);}//else if(!cSum){noDial();}
    if(cAut && d[7] & bodyTemp < 37.3){d[8] = true;shutUp(8);}//else if(!cAut){noDial();}
    if(cWin && d[8] & bodyTemp < 36){d[9] = true;shutUp(9);}//else if(!cWin){noDial();} 
}
  if(d[9]||d[10]||d[11]){text("?",w*0.1,h*0.9);}
  if(d[9] && cAut && deduction){d[10] = true; shutUp(10);}
  if(d[9] && cAut && induction){d[11] = true; shutUp(11);}
  if(d[10] || d[11]){ 
    if(abs(manX - w*0.1) <= 5){d[12] = true; shutUp(12);}
  }
  if(d[12]){choice2();}
  if(science){shutUp(13);}
  if(science && brainWave){d[13] = true;}
  if(d[13] && !d[14] && !d[17]){fill(0);text("?",w*0.6,h*0.9);}
  if(d[13] && abs(manX - w*0.6) <= 5){d[14] = true; shutUp(14);}
  if(qi){shutUp(15);}
  if(qi && qiActive){d[15] = true;}
  if(d[15] && !d[16] && !d[17]){text("?",w*0.6,h*0.9);}
  if(d[15] && abs(manX - w*0.6) <= 5){d[16] = true; shutUp(16);}
  if(d[14] || d[16]){fill(0);text("!",w*0.1,h*0.9);if(abs(manX - w*0.1) <= 5){d[17] = true; shutUp(17);}}
  if(d[17]){fill(#b61919); rect(0,h,10,4*(h-seasonsY));if(abs(manX) <= 5){tbc = true;println("hi");}}
}
void tbc(){
  rectMode(CENTER);
  textAlign(CENTER);
  fill(0);
  rect(w/2,h/2,w,h);
  textSize(20);
  fill(#ffc100);
  textLeading(25);
  text("So as yours\nMy warm-blooded friend",w/2,h*0.3);
  textSize(12);
//restart button
  pushMatrix(); 
  translate(0, 0.2*h);
  stroke(255);
  noFill();
  arc(w/2, h/2, 20, 20, 0, 1.5*PI, OPEN);
  fill(255);
  triangle(w/2+5, h/2, w/2+15, h/2, w/2+10, h/2-5);
  popMatrix();
}
void shutUp(int n){         //I mean, don't show the former dialogues anymore
  for (int i=0; i<n; i++){
    d[i] = false;
  }
  t=" ";
}
void choice1(){
  cho1=true;
  fill(0,0,250);
  textAlign(CENTER);
  text("Let me think", w*0.2, h*0.3);
  text("let me try", w*0.8, h*0.3);
  noFill();
  fill(0);
  text("[Press key 'S']", w*0.2, h*0.4);
  text("[Press key 'D']", w*0.8, h*0.4);
}
void choice2(){
  cho2=true;
  fill(0,0,250);
  textAlign(CENTER);
  text("Learn about brain", w*0.2, h*0.3);
  text("Learn about Qi", w*0.8, h*0.3);
  noFill();
  fill(0);
  text("[Press key 'K']", w*0.2, h*0.4);
  text("[Press key 'L']", w*0.8, h*0.4);
}
void noDial(){
  for (int i=0;i<d.length;i++){
    d[i] = false;
  }
}
void dialogues(){
  pushMatrix();
  translate(dialogueX, dialogueY);
  fill(0);
  textAlign(CENTER);  
  if(d[19]){t = "My warm-blooded friend";}
  else if(d[18]){t = "So as yours";}
  else if(d[17]){t = "My adventure continues from here";}
  else if(d[16]){t = "I need more practices";}
  else if(d[15]){t = "I will be able to control my body to generate heat whenever and wherever I want";}
  else if(d[14]){t = "I need more researches";}
  else if(d[13]){t = "Coldness triggered my brain to signal my brown adipose tissue to generate heat";}
  else if(d[12]){t = "I need to learn more";}
  else if(d[11]){t = "My survival depends on my ability to generate heat";}
  else if(d[10]){t = "I should compose a new rule based on new observations";}
  else if(d[9]){t = "I get too weak to keep moving";}
  else if(d[8]){t = "I get a bit warmer when I move";}
  else if(d[7]){t = "Being quiet doesn't always make me cooler";}
  else if(d[6]){t = "I become a bit colder when I stay very quiet";}
  else if(d[5]){t = "I calculated the rule of body temperature, let me test it out";}
  else if(d[4]){t = "How did my temperature change?";}
  else if(d[3]){t = "I was wrong. It was my own temperature changes that make me ill";}
  else if(d[2]){t = "I found a new way to measure warmness and coldness";}
  else if(d[1]){t = "Hot or cold places make me ill";}
  else if(d[0]){t = "These places give me different feelings"; }
  text(t,0,0);
  popMatrix();
}
void thermoDisplay(){
  textAlign(CENTER);
  if(cSpr){text(nf(teSpr,2,0)+" C", springX,2*seasonsY-h);}
  if(cSum){text(nf(teSum,2,0)+" C", summerX,2*seasonsY-h);}
  if(cAut){text(nf(teAut,2,0)+" C", autumnX,2*seasonsY-h);}
  if(cWin){text(nf(teWin,2,0)+"C", winterX,2*seasonsY-h);}
  text(nf(bodyTemp,2,1)+" C", manX,manY-20);
}
void drawMan(){
  pushMatrix();
  translate(manX, manY);
  fill(0);
  if(cSpr){tChange = tiSpr*0.007+100;fill(0,0,tChange);if(bodyTemp >= teSpr){bodyTemp -= tChange*0.000001;}if(qi && bodyTemp<37.45){qiActive =true;}}
  if(cSum){tChange = tiSum*0.01+100;fill(tChange,0,0);if(bodyTemp <= teSum){bodyTemp += tChange*0.0001;}}
  if(cAut){tChange = tiAut*0.007+100;fill(0,0,tChange);if(bodyTemp >= teAut){bodyTemp -= tChange*0.00001;}}
  if(cWin){tChange = tiWin*0.01+100;fill(0,0,tChange);if(bodyTemp >= teWin){bodyTemp -= tChange*0.0001;}if(science && bodyTemp<35){brainWave =true;}}
  if(qi && qiActive){stroke(#ff66e1); strokeWeight(1);}
  ellipse(0,-12,10,10);
  rect(0,0,8,12);
  triangle(-1,7,1,7,0,15); 
  if(science && brainWave){
    fill(0,200,0);
    rect(-8,-12,3,7);
    rect(8,-12,3,7);
  }
  noStroke();
  popMatrix();
}
void drawThermo(){
 pushMatrix();
 if(!hasThermo){
 translate(thermometerX, thermometerY);
 }else if (hasThermo){
 translate(17,13);
 }
 rotate(PI/3);
 noStroke();
 fill(200);
 rect(0,0,3,30);
 fill(222,0,0);
 rect(0,15,3,3);
 fill(0);
 for (int i=0; i<15; i++){
   rect(0.5, 15-2*i, 1.5,0.5);
 }
 popMatrix();
}
void drawSpring(){
  pushMatrix();
  translate(springX, seasonsY);
  fill(#f0d0cd);
  rect(0,0, 2*(h-seasonsY),2*(h-seasonsY));
  popMatrix();
}
void drawSummer(){
  pushMatrix();
  translate(summerX, seasonsY);
  fill(#ecee21);
  rect(0,0, 2*(h-seasonsY),2*(h-seasonsY));
  popMatrix();
}
void drawAutumn(){
  pushMatrix();
  translate(autumnX, seasonsY);
  fill(#e3a40c);
  rect(0,0, 2*(h-seasonsY),2*(h-seasonsY));
  popMatrix();
}
void drawWinter(){
  pushMatrix();
  translate(winterX, seasonsY);
  fill(#aed0ea);
  rect(0,0, 2*(h-seasonsY),2*(h-seasonsY));
  popMatrix();
}
