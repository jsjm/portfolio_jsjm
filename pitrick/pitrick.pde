//*****************************************************************************************************
//Course        : Introduction to programming
//Game name     : Pitrick - make palatable soup 
//Author        : Jeannette Shijie Ma
//Date created  : 20190118
//Actions       : Add food to soup to match the map; difference < attempts average is success
//Version       : 1.0
//Disclaimer    : This game contains a looping background sequence of sound effect (NOT music)
//To do         : Add more visualization/explanations; fix problem: setup takes too much time when open the game
//*****************************************************************************************************
float w, h;//register canvas size
float xBar, yBar;
float xMap, yMap; 
float xPit, yPit; 
float xFood, yFood; 
float xSoup, ySoup; 
float pSour, pSweet, pBitter, pSpicy, pSalty, pUmami;   // Attributes' preference values
float sSour, sSweet, sBitter, sSpicy, sSalty, sUmami;   // Attributes values of soup
float dSour, dSweet, dBitter, dSpicy, dSalty, dUmami;   // Absolute p values - s values
float difference;                                       // Totall difference between prefered and soup
float[] scores = {55};                                  // score registration (change the basic success/fail score here)
float timer, startTime;                                 // timer related variables
float musicY = 120;                                     // button locating variable
boolean timeUp = false;
boolean startGame = true;
boolean karAdd, choAdd, beeAdd, chiAdd, droAdd, ketAdd; // check to add food
boolean reset;
boolean scoreAdd = true;
boolean music=false; //looping sequence of sound effect, default turned off
Food karnemelk = new Food(6, 1, 0, 0, 1, 2);            //fixed values of attributes for each food
Food chocolate = new Food(0, 8, 2, 0, 0, 0);
Food beer = new Food(1, 2, 8, 0, 0, 0);
Food chips = new Food(0, 1, 0, 8, 3, 1);
Food drops = new Food(0, 1, 1, 0, 7, 2);
Food ketchup = new Food(3, 2, 0, 0, 1, 8);

void setup(){
  size(500, 400);
  w=width;
  h=height;
  xBar = w/2;      // Bar position
  yBar = h/8;      
  xMap = w/2;      // Map position
  yMap = h/3;
  xPit = w*0.2;    // Pitrick position
  yPit = h*0.72;
  xFood = w/1.5;   // Food Position
  yFood = h*0.63;
  xSoup = w/1.5;   // Soup position
  ySoup = h*0.77;
  getPValue();
  startTime = millis();
//sound effect setup
  tri1 = new TriOsc(this);
  tri2 = new TriOsc(this);
  tri3 = new TriOsc(this);
  tri4 = new TriOsc(this);
  addSound = new PinkNoise(this);
  changePitch();
  if (music==true){             //this caused the music to play before drawing start, but I couldn't find a better way
    thread("play");
  }
}

void draw(){
  background(252);
//draw assets
  drawBar();
  drawMusic();
  drawMap();
  drawPitrick();
  drawFood();
  drawSoup();
  addScore();
  if (timeUp == true) {
    timer();
    startGame=false;
  }
  if (reset == true) {
    reset();
  }
}

class Food{
  float sour, sweet, bitter, spicy, salty, umami, amount;

  Food(float _sour, float _sweet, float _bitter, float _spicy, float _salty, float _umami) {
    sour = _sour;
    sweet = _sweet;
    bitter = _bitter;
    spicy = _spicy;
    salty = _salty;
    umami = _umami;
  }

  void add(){
    sSour += sour;
    sSweet += sweet;
    sBitter += bitter;
    sSpicy += spicy;
    sSalty += salty;
    sUmami += umami;
    addSound.play();                 //play a noise sound when adding food 
    delay(30);
    addSound.stop();
  }
}
                              
void getPValue(){                    //random prefered values generation
  pSour = random(50, 100);
  pSweet = random(50, 100);
  pBitter = random(50, 100);
  pSpicy = random(50, 100);
  pSalty = random(50, 100);
  pUmami = random(50, 100);
}

void keyPressed(){
  if (startGame && key == 's') {        
    karnemelk.add();
  } else if (startGame && key == 'd') { 
    chocolate.add();
  } else if (startGame && key == 'f') { 
    beer.add();
  } else if (startGame && key == 'j') { 
    chips.add();
  } else if (startGame && key == 'k') { 
    drops.add();
  } else if (startGame && key == 'l') { 
    ketchup.add();
  }
}

void addScore(){
  dSour = abs(pSour-sSour);
  dSweet = abs(pSweet-sSweet);
  dBitter = abs(pBitter-sBitter);
  dSpicy = abs(pSpicy-sSpicy);
  dSalty = abs(pSalty-sSalty);
  dUmami = abs(pUmami-sUmami);
  difference = dSour+dSweet+dBitter+dSpicy+dSalty+dUmami;
}

float sum, average, track;                                //handy variables for score management
boolean best;
void timer(){   
//add score to array
  if (scoreAdd) {
    scores = append(scores, difference);
    track = difference;
    for (int i=0; i<scores.length; i++) {
      sum += scores[i];
      if (track >= scores[i]) {                           //smaller score(difference) = better performance
        track = scores[i];
      }
    }
    if (track == difference) {
      best = true;
    } else {
      best = false;
    }
    average = sum/scores.length;                          //game gets more difficult when more people perform well(average higher)
    scoreAdd=false;
  }
drawResult();
}

void mousePressed() {
  if (timeUp && dist(mouseX, mouseY, w/2, 0.85*h) <10) {       //check restart button
    reset=true;
  }
  if (!startGame && dist(mouseX, mouseY, w/2, 0.85*h) <10) {
    startGame=true;
  }
  if (music == true && dist(mouseX, mouseY, w-30, 80) <20) {   //option to turn on and off the sound effect sequence
    music=false;
    musicY=120;
  }
  if (music == false && dist(mouseX, mouseY, w-30, 120) <20) {
    music=true;
    musicY=80;
    thread("play");
  }
}

void mouseReleased() {
  reset=false;
}

void reset() {                                                 //restart game
  getPValue();
  difference = 0;
  sum = 0;
  sSour = 0; 
  sSweet = 0; 
  sBitter = 0; 
  sSpicy = 0; 
  sSalty = 0; 
  sUmami = 0;
  dSour = 0; 
  dSweet = 0; 
  dBitter = 0; 
  dSpicy = 0; 
  dSalty = 0; 
  dUmami = 0;
  timer = 0;
  startTime = millis();
  startGame = true;
  scoreAdd = true;
  timeUp = false;
  reset = false;
}
