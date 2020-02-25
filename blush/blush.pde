//*****************************************************************************************************
//Course        : Introduction to programming
//Game name     : Blush - catch heart beats
//Author        : Jeannette Shijie Ma - S2163004
//Date created  : 20190118
//Actions       : Click the red heart beats to get point; score > attempts average is success
//Version       : 1.0
//Disclaimer    : This game contains a sequence of sound effect (NOT music)
//To do         : Bugs: short quick clicks cause freezing; setup takes too much time when open the game
//*****************************************************************************************************
float w, h;                            //register canvas size 
float xBar, yBar;                      //Bar position
float topSpace = 100;                  //here doesn't have hearts
int curScore;                          //register current score
boolean scoreAdd=true;
boolean startGame = true;
float timer, startTime;
boolean timeUp = false;
boolean reset;
boolean music = true;                  //I mean sound effect sequence

Heart[] hearts = new Heart[84];               

void setup() {
  size(600, 400);
  startTime = millis();
  w=width;
  h=height;
  xBar = w/2;
  yBar = h/8.5;
//Sound effects setup
  tri1 = new TriOsc(this);
  tri2 = new TriOsc(this);
  tri3 = new TriOsc(this);
  tri4 = new TriOsc(this);
  right = new Pulse(this);
  wrong = new Pulse(this);
  changePitch();
  if (music) {
    thread("play");  
 }
}

void draw() {
  background(252);
  drawBar();
  for(int i=0; i<hearts.length; i++){ 
    hearts[i] = new Heart(i);
  }
  for(int i=0; i<hearts.length; i++){              // draw hearts
    hearts[i].blush();
    hearts[i].drawHearts();
  }
  if(timeUp) {                                     //stop music when game over
    music = false;
    timer();
  }
  if (reset) {
    reset();
  }
  fill(0);                                         //this is the score and goal displays
  text("Catched: "+curScore, 3*w/10,h/17);
  text("Goal: "+int(average+1), 6.5*w/10, h/17);   //goal changes based on attempts average
  
}

float[] scores = {5};                              // scores registration (change the basic pass/fail score here)
float average = 5;                                 // average score, default is 5
float sum, track;     
boolean best;

void timer() {   
//add score to array
  if (scoreAdd==true) { //this check might not be necessary in this game but my laziness kept it here
    scores = append(scores, curScore);
    track = curScore;
    for (int i=0; i<scores.length; i++) {
      sum += scores[i];
      if (track <= scores[i]) {//get the best value
        track = scores[i];
      }
    }
    if (track == curScore) {            
      best = true;
    } else {
      best = false;
    }
    average = sum/scores.length;  
    scoreAdd=false;
  }
drawResult();
}

boolean rightClick;                                          // true when catch the blush hearts
void checkCatched(){
  for (int i=0; i<84; i++){
    if (startGame && hearts[i].blush && dist(mouseX, mouseY, hearts[i].xPos, hearts[i].yPos) <30){
      curScore +=1;
      right.play(notes[88],1);                               //play a high 'right' sound
      delay(50);
      right.stop();
      rightClick = true;
    }else{
      rightClick = false;
    }
  }
}
void mousePressed() {
  checkCatched(); 
  if (!timeUp && !rightClick){                               //when clicked somewhere else
    wrong.play(notes[20],1);                                 //play a low 'wrong' sound
    delay(70);
    wrong.stop();
  }
  if (timeUp && dist(mouseX, mouseY, w/2, 0.9*h) <10) {      //check replay button clicked
    reset=true;
  }
  if (!startGame && dist(mouseX, mouseY, w/2, 0.9*h) <10) {  //could be made more consice 
    startGame=true; 
  }
}
void mouseReleased() {
  reset=false; 
}
void reset() {                                              //restart game while keeping the score history
  timer = 0;
  curScore = 0;
  sum = 0;
  startTime = millis();
  startGame = true;
  scoreAdd = true;
  timeUp = false;
  reset = false;
  music = true;
  thread("play"); 
}
