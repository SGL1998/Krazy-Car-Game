//Adam Whitley
//Stefan LeClair
//CSCI 182 002
// 5-4-19
// Description: This code is designed to provide a challenging experience avoiding obstacles while controlling a car 
// using the X-axis, while also providing  powerups such as health regeneration and shields. Players must collect 4 points to win the game.



PImage Racecar;
PImage MenuCar;
PImage rulePhoto;
PFont titleFont;
PFont statusFont;
PFont ruleFont;
PFont ruleFont2;
int carX1;
int carY1;
int timer;
int [] X = new int[150];
int [] Y = new int[150];
int carXspeed;
int timeLimit;
int obstacleX1;
int obstacleY1;
int obstacleX2;
int obstacleY2;
int obstacleX3;
int obstacleY3;
int obstacleX4;
int obstacleY4;
int obstacleY5;
int obstacleX5;
int obstacleX6;
int obstacleY6;
int robX1, robX2, robX3, robX4, robX5, robX6;
int robY1, robY2, robY3, robY4, robY5, robY6;
int potHoleX1, potHoleX2, potHoleX3, potHoleX4;
int potHoleY1, potHoleY2, potHoleY3, potHoleY4;
int diamondX1, diamondX2, diamondX3, diamondX4;
int diamondY1, diamondY2, diamondY3, diamondY4;
boolean obstacle1 = true;
boolean obstacle2 = true;
boolean obstacle3 = true;
boolean obstacle4 = true;
boolean obstacle5 = true;
boolean obstacle6 = true;
boolean diamond1 = true;
boolean diamond2 = true;
boolean diamond3 = true;
boolean diamond4 = true;
boolean Rob1 = false;
boolean Rob2 = false;
boolean Rob3 = false;
boolean Rob4 = false;
boolean Rob5 = false;
boolean Rob6 = false;
boolean pothole1 = true;
boolean pothole2 = true;
boolean pothole3 = true;
boolean pothole4 = true;
boolean point1 = true;
boolean point2 = true;
boolean point3 = true;
boolean point4 = true;
boolean counter1 = true;
boolean shield = false;
int roadLineY1;
int roadLineY2;
int roadLineY3;
int roadLineY4;
int roadLineY5;
int roadLineY6;
int roadLineY7;
int roadLineY8;
int counter;
int objectSpeed ;
int carMovement ;
int gameState ;
int pointCounter;
int deathCounter;
boolean powerup1 = false;
boolean powerup2 = false;


void setup() {
  size(1000, 600);
  smooth();
  frameRate(60);
  rectMode(CENTER);
  //roadblock array
  for (int i = 0; i<X.length; i++) {
    X[i] = (int) random(0, 1000);
    Y[i] = 0;
  }

  counter =0;
  roadLineY1= -100;
  roadLineY2= -200;
  roadLineY3 = -300;
  roadLineY4 = -400;
  roadLineY5 = -500;
  roadLineY6 = -600;
  roadLineY7 = -700;
  roadLineY8 = -800;
  obstacleX1 = 100;
  obstacleY1 = -100;
  obstacleX2 = (int) random(100, 800);
  obstacleY2 = -100;
  obstacleX3 =(int) random(50, 850);
  obstacleY3 = -300;
  obstacleX4 =(int) random(0, 900);
  obstacleY4 =(int) random(0, 400);
  robX1 = (int) random (0, 900);
  robY1 = -100;
  robX2 = (int) random(0, 900);
  robY1 = -100;
  robX3 = (int) random(0, 900);
  robY3 = (int) random(-100, -500);
  robX4 = (int) random(0, 900);
  robY4 = (int) random(0, 900);
  objectSpeed =1;
  carMovement =1;
  gameState = 0;
  objectSpeed =1;
  carMovement =1;
  gameState = 0;
  titleFont = loadFont("Calibri-BoldItalic-110.vlw");
  statusFont = loadFont("CenturyGothic-Bold-36.vlw");
  ruleFont = loadFont("RussoOne-Regular-36.vlw");
  rulePhoto = loadImage("CasePhoto.jpg");
  Racecar = loadImage("Racecar.png");
  MenuCar = loadImage("Menu photo.jpg");
  ruleFont2 = loadFont("RussoOne-Regular-26.vlw");
  pointCounter =0;
  deathCounter = 5;
} 

void draw() {
  // race car

  switch(gameState) {
  case 0:
    //opening screen
    background(79, 115, 173);
    image(MenuCar, 0, 0);
    textFont(titleFont);
    fill(255, 0, 0);
    text("Krazy Car!", 350, 100);
    textFont(ruleFont);
    text("V1.0", 100, 550);
    if (counter<=50) {
      text("Press s to start!", 500, 550);
    }
    if (counter>=100) {
      counter=0;
    }
    counter++;
    break;
  case 1:
    image(rulePhoto, 0, 0);
    fill(255, 255, 255);
    textFont(ruleFont);
    text("General Rules", 410, 90);
    textFont(ruleFont2);
    text("Pick up 4 blue Diamonds to proceed to the next level!", 10, 150);
    text("1.You have 10 health points.", 10, 200);
    text("Avoid the orange pylons,each one will  decrease your health by 1!", 10, 250);
    text("2. Blue and red pylons are power-ups so run `em over!", 10, 300);
    fill(0, 0, 255);
    text(" Blue powerup = Extra health", 10, 350);
    fill(0, 255, 0);
    text(" Green powerup = Less obstacles", 10, 400);
    fill(255, 255, 255);
    text("3. Hitting potholes = death!", 10, 450);
    text("4. Hitting roadblocks = death! Press S to activate Shield.",10,500);
    textFont(ruleFont);
    text("Press p to play!", 400, 550);
    potHoleY1 =-100;
    potHoleY2 = -200;
    potHoleY3 = -300;
    potHoleY4 = -400;
    obstacleY1 = -100;
    obstacleY2 = -100;
    obstacleY3 = -300;
    obstacleY5 = (int) random(-10, -400);
    obstacleY6 = (int) random(-10, -300);
    pointCounter = 0;
    diamondY1 = (int) random(-100, -500);
    diamondY2 = (int) random(-50, -300);
    diamondY3 = (int) random(-50, -400);
    diamondY4 = (int) random(-50, -500);
    shield = false;
    break;

  case 2:
    //game on!

    //level 1
    //Road surface
    background(78, 81, 86);

    // AD key car movement controls
    carXspeed = 3;
    if (keyPressed && (key == 'a' || key == 'A')) {
      carX1 -=carXspeed;
    }
    if (keyPressed && (key == 'd' || key == 'D')) {
      carX1 +=carXspeed;
    }
//teleportation for roadblock
    addtoElement(Y, 2);
    for ( int i=0; i< Y.length; i++) {
      drawSquares(X[i], Y[i]);
      if (Y[i] >=600) {
        Y[i] -=1100;
      }
      if ((Y[i] >=0) && (Y[i] < 600)) {
        Y[i] +=3;
      }
      if ((carY1 == Y[i]) && (shield == false )) {
        gameState = 3;
        Y[i] =0;
      }
      
    }
// conditional for shield
  if(keyPressed && key == 's') {
    shield = true;
}

    //Median lines
    fill(252, 234, 32);
    rect(550, roadLineY1, 10, 30);
    rect(570, roadLineY1, 10, 30);
    rect(550, roadLineY2, 10, 30);
    rect(570, roadLineY2, 10, 30);
    rect(550, roadLineY3, 10, 30);
    rect(570, roadLineY3, 10, 30);
    rect(550, roadLineY4, 10, 30);
    rect(570, roadLineY4, 10, 30);
    rect(550, roadLineY5, 10, 30);
    rect(570, roadLineY5, 10, 30);
    rect(550, roadLineY6, 10, 30);
    rect(570, roadLineY6, 10, 30);
    rect(550, roadLineY7, 10, 30);
    rect(570, roadLineY7, 10, 30);
    rect(550, roadLineY8, 10, 30);
    rect(570, roadLineY8, 10, 30);

    // Traffic cone obstacles (point deductors)
    // obstacle1 =  power-up1 (restores health to 10)
    if ( obstacle1 == true) {
      if (counter<200) {
        fill(229, 115, 22);
        triangle(obstacleX1, obstacleY1, obstacleX1+30, obstacleY1, obstacleX1+15, obstacleY1-50);
      } 
      if (counter>200 && counter<600) {
        fill(0, 255, 0);
        triangle(obstacleX1, obstacleY1, obstacleX1+30, obstacleY1, obstacleX1+15, obstacleY1-50);
        powerup1 = true;
      } else {
        fill(0, 0, 255);
        triangle(obstacleX1, obstacleY1, obstacleX1+30, obstacleY1, obstacleX1+15, obstacleY1-50);
        powerup2 = true;
      }
    }
    // obstacle 2
    if (obstacle2 == true) {
      fill(229, 115, 22);
      triangle(obstacleX2, obstacleY2, obstacleX2+30, obstacleY2, obstacleX2+15, obstacleY2-50);
    }
    //obstacle 3
    if (obstacle3 == true) {
      fill(229, 115, 22);
      triangle(obstacleX3, obstacleY3, obstacleX3+30, obstacleY3, obstacleX3+15, obstacleY3-50);
    }
    //obstacle 4
    if (obstacle4 == true) {
      fill(229, 115, 22);
      triangle(obstacleX4, obstacleY4, obstacleX4+30, obstacleY4, obstacleX4+15, obstacleY4-50);
    }
    if (obstacle5 == true) {
      fill(229, 115, 22);
      triangle(obstacleX5, obstacleY5, obstacleX5+30, obstacleY5, obstacleX5+15, obstacleY5-50);
    }

    //Replacements
    //rob1
    if (Rob1 == true) {
      fill(229, 115, 22);
      triangle(robX1, robY1, robX1+30, robY1, robX1+15, robY1-50);
    }
    //rob2
    if (Rob2 == true) {
      fill(229, 115, 22);
      triangle(robX2, robY2, robX2+30, robY2, robX2+15, robY2-50);
    }
    //rob3
    if (Rob3 == true) {
      fill(229, 115, 22);
      triangle(robX3, robY3, robX3+30, robY3, robX3+15, robY3-50);
    }
    //rob4
    if (Rob4 == true) {
      fill(229, 115, 22);
      triangle(robX4, robY4, robX4+30, robY4, robX4+15, robY4-50);
    }
    // obstacle 5
    if (Rob5 == true) {
      fill(229, 115, 22);
      triangle(robX5, robY5, robX5+30, robY5, robX5+15, robY5-50);
    }




    // potholes (deathtraps)
    if (pothole1 == true) {
      fill(10);
      ellipse(potHoleX1, potHoleY1, 80, 80);
    }
    if (pothole2 == true) {
      fill(50);
      ellipse(potHoleX2, potHoleY2, 80, 80);
    }
    if (pothole3 == true) {
      fill(50);
      ellipse(potHoleX3, potHoleY3, 80, 80);
    }
    if (pothole4 == true) {
      fill(50);
      ellipse(potHoleX4, potHoleY4, 80, 80);
    }

    //Diamond Points
    if (diamond1 == true) {
      fill(0, 0, 255);
      quad(diamondX1, diamondY1, diamondX1+20, diamondY1-15, diamondX1+40, diamondY1, diamondX1+20, diamondY1);
    }
    if (diamond2 == true) {
      fill(0, 0, 255);
      quad(diamondX2, diamondY2, diamondX2+20, diamondY2-15, diamondX2+40, diamondY2, diamondX2+20, diamondY2);
    }
    if (diamond3 == true) {
      fill(0, 0, 255);
      quad(diamondX3, diamondY3, diamondX3+20, diamondY3-15, diamondX3+40, diamondY3, diamondX3+20, diamondY3);
    }
    if (diamond4 == true) {
      fill(0, 0, 255);
      quad(diamondX4, diamondY4, diamondX4+20, diamondY4-15, diamondX4+40, diamondY4, diamondX4+20, diamondY4);
    }

    //Racecar
    carY1 = 350;
    image(Racecar, carX1, carY1);

    //On-screen Health indicator
    textFont(statusFont);
    if (deathCounter<= 5) {
      fill(50);
      text("Health:" + deathCounter, 100, 580);
    }      
    if (deathCounter<=3) {
      fill(226, 122, 24);
      text("Health:" + deathCounter, 100, 580);
    }
    if (deathCounter<=2) {
      fill(255, 0, 0);
      text("Health:" + deathCounter, 100, 580);
    } 
    
    //On screen points indicator
    fill(50);
    text("Points:" + pointCounter,500,580);

    //median lines speed
    roadLineY1++;
    roadLineY2++;
    roadLineY3++;
    roadLineY4++;
    roadLineY5++;
    roadLineY6++;
    roadLineY7++;
    roadLineY8++;
    roadLineY1 +=4;
    roadLineY2 +=4;
    roadLineY3 +=4;
    roadLineY4 +=4;
    roadLineY5 +=4;
    roadLineY6 +=4;
    roadLineY7 +=4;
    roadLineY8 +=4;
    
    if (counter1 == true) {
  
      //pothole Speeds
      potHoleY1 +=5;
      potHoleY2 +=5;
      potHoleY3 +=5;
      potHoleY4 +=5;
      
      //obstacle speeds
      obstacleY1 +=5;
      obstacleY2 +=5;
      obstacleY3 +=5;
      obstacleY4 +=5;
      obstacleY5 +=5;

      //diamond point speeds
      diamondY1 +=5;
      diamondY2 +=5;
      diamondY3 +=5;
      diamondY4 +=5;

      //replacement obstacle speeds
      robY1 +=5;
      robY2 +=5;
      robY3 +=5;
      robY4 +=5;
      robY5 +=5;
    }

    // obstacle 1
    if (obstacle1 == true && powerup1 == true) {
      if (carX1+30 >= obstacleX1 && carX1+30<= obstacleX1+30 && carY1+10<=obstacleY1 && carY1 >= obstacleY1-50) {
        timeLimit++;

        if (timeLimit<4000) {
          fill(255, 0, 0);
          text("PowerUp Engaged!", 500, 500);
          carXspeed = 10;
        }
      }
    }
    if (obstacle1 == true && powerup2 == true) {
      if (carX1+30 >= obstacleX1 && carX1+30<= obstacleX1+30 && carY1+10<=obstacleY1 && carY1 >= obstacleY1-50) {
        fill(255, 0, 0);
        text("Health Boost!", 500, 500);
        deathCounter =5;
      }
    }

    //Obstacle 2    
    if (obstacle2 == true) {
      //front hit detectors
      if ((carX1+30>= obstacleX2 && carX1+30 <= obstacleX2+30 && carY1+10<=obstacleY2 && carY1 >= obstacleY2-50)|| 
        (carX1+10>=obstacleX2 && carX1 +10 <= obstacleX2+30 && carY1+10 <= obstacleY2 && carY1 >= obstacleY2-50)||
        (carX1+45>=obstacleX2 && carX1 +45 <= obstacleX2+30 && carY1+10 <= obstacleY2 && carY1 >= obstacleY2-50)||
        (carX1>=obstacleX2 && carX1 <= obstacleX2+30 && carY1+10 <= obstacleY2 && carY1 >= obstacleY2-50) ||
        // rear hit detectors
        (carX1+30>= obstacleX2 && carX1+30 <= obstacleX2+30 && carY1+100<=obstacleY2 && carY1 >= obstacleY2-50)|| 
        (carX1+10>=obstacleX2 && carX1 +10 <= obstacleX2+30 && carY1+100 <= obstacleY2 && carY1 >= obstacleY2-50)||
        (carX1+45>=obstacleX2 && carX1 +45 <= obstacleX2+30 && carY1+100 <= obstacleY2 && carY1 >= obstacleY2-50)||
        (carX1>=obstacleX2 && carX1 <= obstacleX2+30 && carY1+100 <= obstacleY2 && carY1 >= obstacleY2-50)) {
        deathCounter --;
        obstacle2 = false;
        Rob1 = true;
      }
    }
    //Obstacle 3

    if (obstacle3 == true) {
      // front hit detector
      if ((carX1+30 >= obstacleX3 && carX1+30 <= obstacleX3+30 && carY1+10<= obstacleY3 && carY1 >= obstacleY3-50)||
        (carX1+10 >= obstacleX3 && carX1+10 <= obstacleX3+30 && carY1+10<= obstacleY3 && carY1 >= obstacleY3-50)||
        (carX1+45 >= obstacleX3 && carX1+45 <= obstacleX3+30 && carY1+10<= obstacleY3 && carY1 >= obstacleY3-50)||
        (carX1 >= obstacleX3 && carX1 <= obstacleX3+30 && carY1+10<= obstacleY3 && carY1 >= obstacleY3-50)||
        //rear hit detector
        (carX1+30 >= obstacleX3 && carX1+30 <= obstacleX3+30 && carY1+100<= obstacleY3 && carY1 >= obstacleY3-50)||
        (carX1+10 >= obstacleX3 && carX1+10 <= obstacleX3+30 && carY1+100<= obstacleY3 && carY1 >= obstacleY3-50)||
        (carX1+45 >= obstacleX3 && carX1+45 <= obstacleX3+30 && carY1+100<= obstacleY3 && carY1 >= obstacleY3-50)||
        (carX1 >= obstacleX3 && carX1 <= obstacleX3+30 && carY1+100<= obstacleY3 && carY1 >= obstacleY3-50)) {
        deathCounter --;
        obstacle3 = false;
        Rob2 = true;
      }
    }
    // Obstacle 4
    if (obstacle4 == true) {
      // front hit detectors
      if ((carX1+30>= obstacleX4 && carX1+30 <= obstacleX4+30 && carY1+10 <= obstacleY4 && carY1 >= obstacleY4-50)||
        (carX1+10>= obstacleX4 && carX1+10 <= obstacleX4+30 && carY1+10 <= obstacleY4 && carY1 >= obstacleY4-50)||
        (carX1+45>= obstacleX4 && carX1+45 <= obstacleX4+30 && carY1+10 <= obstacleY4 && carY1 >= obstacleY4-50)||
        (carX1>= obstacleX4 && carX1 <= obstacleX4+30 && carY1+60 <= obstacleY4 && carY1 >= obstacleY4-50) ||
        //rear hit detectors 
        (carX1+30>= obstacleX4 && carX1+30 <= obstacleX4+30 && carY1+100 <= obstacleY4 && carY1 >= obstacleY4-50)||
        (carX1+10>= obstacleX4 && carX1+10 <= obstacleX4+30 && carY1+100 <= obstacleY4 && carY1 >= obstacleY4-50)||
        (carX1+45>= obstacleX4 && carX1+45 <= obstacleX4+30 && carY1+100 <= obstacleY4 && carY1 >= obstacleY4-50)||
        (carX1>= obstacleX4 && carX1 <= obstacleX4+30 && carY1+100 <= obstacleY4 && carY1 >= obstacleY4-50)
        ) {
        deathCounter --;
        obstacle4 = false;
        Rob4 = true;
      }
    }
    //Obstacle 5
    if (obstacle5 == true) {
      //front hit detectors
      if ((carX1+30 >= obstacleX5 && carX1+30 <= obstacleX5+30 && carY1+10 <= obstacleY5 && carY1 >= obstacleY5-50)||
        (carX1+10 >= obstacleX5 && carX1+10 <= obstacleX5+30 && carY1+10 <= obstacleY5 && carY1 >= obstacleY5-50)||
        (carX1+45 >= obstacleX5 && carX1+45 <= obstacleX5+30 && carY1+10 <= obstacleY5 && carY1 >= obstacleY5-50)||
        (carX1 >= obstacleX5 && carX1 <= obstacleX5+30 && carY1+10 <= obstacleY5 && carY1 >= obstacleY5-50) ||
        //rear hit detectors
        (carX1+30 >= obstacleX5 && carX1+30 <= obstacleX5+30 && carY1+100 <= obstacleY5 && carY1 >= obstacleY5-50)||
        (carX1+10 >= obstacleX5 && carX1+10 <= obstacleX5+30 && carY1+100 <= obstacleY5 && carY1 >= obstacleY5-50)||
        (carX1+45 >= obstacleX5 && carX1+45 <= obstacleX5+30 && carY1+100 <= obstacleY5 && carY1 >= obstacleY5-50)||
        (carX1 >= obstacleX5 && carX1 <= obstacleX5+30 && carY1+100 <= obstacleY5 && carY1 >= obstacleY5-50)
        ) {
        deathCounter --;
        obstacle5 = false;
        Rob5 = true;
      }
    }

    //replace Obstacle 2
    if (Rob2 == true) {
      //front hit detectors
      if ((carX1+30>= robX2 && carX1+30 <= robX2+30 && carY1+10<=robY2 && carY1 >= robY2-50)|| 
        (carX1+10>=robX2 && carX1 +10 <= robX2+30 && carY1+10 <= robY2 && carY1 >= robY2-50)||
        (carX1+45>=robX2 && carX1 +45 <= robX2+30 && carY1+10 <= robY2 && carY1 >= robY2-50)||
        (carX1>=robX2 && carX1 <= robX2+30 && carY1+10 <= robY2 && carY1 >= robY2-50) ||
        // rear hit detectors
        (carX1+30>= robX2 && carX1+30 <= robX2+30 && carY1+100<=robY2 && carY1 >= robY2-50)|| 
        (carX1+10>=robX2 && carX1 +10 <= robX2+30 && carY1+100 <= robY2 && carY1 >= robY2-50)||
        (carX1+45>=robX2 && carX1 +45 <= robX2+30 && carY1+100 <= robY2 && carY1 >= robY2-50)||
        (carX1>=robX2 && carX1 <= robX2+30 && carY1+100 <= robY2 && carY1 >= robY2-50)) {
        deathCounter --;
        obstacle2 = true;
        Rob2 = false;
      }
    }

    //replace Obstacle 3

    if (Rob3 == true) {
      // front hit detector
      if ((carX1+30 >= robX3 && carX1+30 <= robX3+30 && carY1+10<= robY3 && carY1 >= robY3-50)||
        (carX1+10 >= robX3 && carX1+10 <= robX3+30 && carY1+10<= robY3 && carY1 >= robY3-50)||
        (carX1+45 >= robX3 && carX1+45 <= robX3+30 && carY1+10<= robY3 && carY1 >= robY3-50)||
        (carX1 >= robX3 && carX1 <= robX3+30 && carY1+10<= robY3 && carY1 >= robY3-50)||
        //rear hit detector
        (carX1+30 >= robX3 && carX1+30 <= robX3+30 && carY1+100<= robY3 && carY1 >= robY3-50)||
        (carX1+10 >= robX3 && carX1+10 <= robX3+30 && carY1+100<= robY3 && carY1 >= robY3-50)||
        (carX1+45 >= robX3 && carX1+45 <= robX3+30 && carY1+100<= robY3 && carY1 >= robY3-50)||
        (carX1 >= robX3 && carX1 <= robX3+30 && carY1+100<= robY3 && carY1 >= robY3-50)) {
        deathCounter --;
        obstacle3 = true;
        Rob3 = false;
      }
    }

    // replace Obstacle 4
    if (Rob4 == true) {
      // front hit detectors
      if ((carX1+30>= robX4 && carX1+30 <= robX4+30 && carY1+10 <= robY4 && carY1 >= robY4-50)||
        (carX1+10>= robX4 && carX1+10 <= robX4+30 && carY1+10 <= robY4 && carY1 >= robY4-50)||
        (carX1+45>= robX4 && carX1+45 <= robX4+30 && carY1+10 <= robY4 && carY1 >= robY4-50)||
        (carX1>= robX4 && carX1 <= robX4+30 && carY1+60 <= robY4 && carY1 >= robY4-50) ||
        //rear hit detectors 
        (carX1+30>= robX4 && carX1+30 <= robX4+30 && carY1+100 <= robY4 && carY1 >= robY4-50)||
        (carX1+10>= robX4 && carX1+10 <= robX4+30 && carY1+100 <= robY4 && carY1 >= robY4-50)||
        (carX1+45>= robX4 && carX1+45 <= robX4+30 && carY1+100 <= robY4 && carY1 >= robY4-50)||
        (carX1>= robX4 && carX1 <= robX4+30 && carY1+100 <= robY4 && carY1 >= robY4-50)) {
        deathCounter --;
        obstacle4 = true;
        Rob4 = false;
      }
    }
    //replace Obstacle 5
    if (Rob5 == true) {
      //front hit detectors
      if ((carX1+30 >= robX5 && carX1+30 <= robX5+30 && carY1+10 <= robY5 && carY1 >= robY5-50)||
        (carX1+10 >= robX5 && carX1+10 <= robX5+30 && carY1+10 <= robY5 && carY1 >= robY5-50)||
        (carX1+45 >= robX5 && carX1+45 <= robX5+30 && carY1+10 <= robY5 && carY1 >= robY5-50)||
        (carX1 >= obstacleX5 && carX1 <= obstacleX5+30 && carY1+10 <= obstacleY5 && carY1 >= obstacleY5-50) ||
        //rear hit detectors
        (carX1+30 >= robX5 && carX1+30 <= robX5+30 && carY1+100 <= robY5 && carY1 >= robY5-50)||
        (carX1+10 >= robX5 && carX1+10 <= robX5+30 && carY1+100 <= robY5 && carY1 >= robY5-50)||
        (carX1+45 >= robX5 && carX1+45 <= robX5+30 && carY1+100 <= robY5 && carY1 >= robY5-50)||
        (carX1 >= robX5 && carX1 <= robX5+30 && carY1+100 <= robY5 && carY1 >= robY5-50)) {
        deathCounter --;
        obstacle5 = true;
        Rob5 = false;
      }
    }

    // Pothole hit detection
    if ( pothole1 == true ) {
      //pothole 1
      if (( carX1 +30 >= potHoleX1-40 && carX1+30<=potHoleX1+40 && carY1+10<=potHoleY1+40 && carY1 +10 >=potHoleY1-40)||
        (carX1 +10>= potHoleX1-40 && carX1+10<= potHoleX1+40 && carY1+10<= potHoleY1+40 && carY1+10>=potHoleY1-40)||
        (carX1 +45>= potHoleX1-40 && carX1+45<= potHoleX1+40 && carY1+10<= potHoleY1+40 && carY1+10>=potHoleY1-40)||
        (carX1 >= potHoleX1-40 && carX1<= potHoleX1+40 && carY1+10<= potHoleY1+40 && carY1+10>=potHoleY1-40)) {
        gameState = 3;
      }
    }
    //pothole 2
    if ( pothole2 == true ) {
      if (( carX1 +30 >= potHoleX2-40 && carX1+30<=potHoleX2+40 && carY1+10<=potHoleY2+40 && carY1 +10 >=potHoleY2-40)||
        (carX1 +10>= potHoleX2-40 && carX1+10<= potHoleX2+40 && carY1+10<= potHoleY2+40 && carY1+10 >=potHoleY2-40)||
        (carX1 +45>= potHoleX2-40 && carX1+45<= potHoleX2+40 && carY1+10<= potHoleY2+40 && carY1+10 >=potHoleY2-40)||
        (carX1 >= potHoleX2-40 && carX1<= potHoleX2+40 && carY1+10<= potHoleY1+40 && carY1+10 >=potHoleY1-40)) {
        gameState = 3;
      }
    }
    //pothole 3
    if ( pothole3 == true ) {
      if (( carX1 +30 >= potHoleX3-40 && carX1+30<=potHoleX3+40 && carY1+10<=potHoleY3+40 && carY1 +10>=potHoleY3-40)||
        (carX1 +10>= potHoleX3-40 && carX1+10<= potHoleX3+40 && carY1+10<= potHoleY3+40 && carY1+10>=potHoleY3-40)||
        (carX1 +45>= potHoleX3-40 && carX1+45<= potHoleX3+40 && carY1+10<= potHoleY3+40 && carY1+10>=potHoleY3-40)||
        (carX1 >= potHoleX3-40 && carX1<= potHoleX3+40 && carY1+10<= potHoleY3+40 && carY1+10>=potHoleY3-40)) {
        gameState = 3;
      }
    }
    //pothole 4
    if ( pothole4 == true ) {
      if (( carX1 +30 >= potHoleX4-40 && carX1+30<= potHoleX4+40 && carY1+10<=potHoleY4+40 && carY1 +10>=potHoleY4-40)||
        (carX1 +10>= potHoleX4-40 && carX1+10<= potHoleX4+40 && carY1+10<= potHoleY4+40 && carY1+10>=potHoleY4-40)||
        (carX1 +45>= potHoleX4-40 && carX1+45<= potHoleX4+40 && carY1+10<= potHoleY4+40 && carY1+10>=potHoleY4-40)||
        (carX1 >= potHoleX4-40 && carX1<= potHoleX4+40 && carY1+10<= potHoleY4+40 && carY1+10>=potHoleY4-40)) {
        gameState = 3;
      }
    }

    // Diamond Points
    if (diamond1 == true) {
      //front hit detectors
      if ((carX1+30 >= diamondX1 && carX1+30 <= diamondX1+40 && carY1+10 <= diamondY1+15 && carY1 >= diamondY1-15)||
        (carX1+10 >= diamondX1 && carX1+10 <= diamondX1+40 && carY1+10 <= diamondY1+15 && carY1 >= diamondY1-15)||
        (carX1+45 >= diamondX1 && carX1+45 <= diamondX1+40 && carY1+10 <= diamondY1+15 && carY1 >= diamondY1-15)||
        (carX1 >= diamondX1 && carX1 <= diamondX1+40 && carY1+10 <= diamondY1+15 && carY1 >= diamondY1-50)||
        //rear hit detection
        (carX1+30 >= diamondX1 && carX1+30 <= diamondX1+40 && carY1+100 <= diamondY1+15 && carY1 >= diamondY1-15)||
        (carX1+10 >= diamondX1 && carX1+11 <= diamondX1+40 && carY1+100 <= diamondY1+15 && carY1 >= diamondY1-15)||
        (carX1+45 >= diamondX1 && carX1+45 <= diamondX1+40 && carY1+100 <= diamondY1+15 && carY1 >= diamondY1-15)||
        (carX1 >= diamondX1 && carX1 <= diamondX1+40 && carY1+100 <= diamondY1+15 && carY1 >= diamondY1-15)) {
        diamond1 =false;
        pointCounter+=1;
      }
    }
    if (diamond2 == true) {
      //front hit detectors
      if ((carX1+30 >= diamondX2 && carX1+30 <= diamondX2+40 && carY1+10 <= diamondY2+15 && carY1 >= diamondY2-15)||
        (carX1+10 >= diamondX2 && carX1+10 <= diamondX2+40 && carY1+10 <= diamondY2+15 && carY1 >= diamondY2-15)||
        (carX1+45 >= diamondX2 && carX1+45 <= diamondX2+40 && carY1+10 <= diamondY2+15 && carY1 >= diamondY2-15)||
        (carX1 >= diamondX2 && carX1 <= diamondX2+40 && carY1+10 <= diamondY2+15 && carY1 >= diamondY2-50)||
        //rear hit detection
        (carX1+30 >= diamondX2 && carX1+30 <= diamondX2+40 && carY1+100 <= diamondY2+15 && carY1 >= diamondY2-15)||
        (carX1+10 >= diamondX2 && carX1+11 <= diamondX2+40 && carY1+100 <= diamondY2+15 && carY1 >= diamondY2-15)||
        (carX1+45 >= diamondX2 && carX1+45 <= diamondX2+40 && carY1+100 <= diamondY2+15 && carY1 >= diamondY2-15)||
        (carX1 >= diamondX2 && carX1 <= diamondX2+40 && carY1+100 <= diamondY2+15 && carY1 >= diamondY2-15)) {
        diamond2 =false;
        pointCounter +=1;
      }
    }
    if (diamond3 == true) {
      //front hit detectors
      if ((carX1+30 >= diamondX3&& carX1+30 <= diamondX3+40 && carY1+10 <= diamondY3+15 && carY1 >= diamondY3-15)||
        (carX1+10 >= diamondX3 && carX1+10 <= diamondX3+40 && carY1+10 <= diamondY3+15 && carY1 >= diamondY3-15)||
        (carX1+45 >= diamondX3 && carX1+45 <= diamondX3+40 && carY1+10 <= diamondY3+15 && carY1 >= diamondY3-15)||
        (carX1 >= diamondX3 && carX1 <= diamondX3+40 && carY1+10 <= diamondY2+15 && carY1 >= diamondY2-50)||
        //rear hit detection
        (carX1+30 >= diamondX3 && carX1+30 <= diamondX3+40 && carY1+100 <= diamondY3+15 && carY1 >= diamondY3-15)||
        (carX1+10 >= diamondX3 && carX1+11 <= diamondX3+40 && carY1+100 <= diamondY3+15 && carY1 >= diamondY3-15)||
        (carX1+45 >= diamondX3 && carX1+45 <= diamondX3+40 && carY1+100 <= diamondY3+15 && carY1 >= diamondY3-15)||
        (carX1 >= diamondX3 && carX1 <= diamondX3+40 && carY1+100 <= diamondY3+15 && carY1 >= diamondY3-15)) {
        diamond3 =false;
        pointCounter +=1;
      }
    } 
    if (diamond4 == true) {
      //front hit detectors
      if ((carX1+30 >= diamondX4&& carX1+30 <= diamondX4+40 && carY1+10 <= diamondY4+15 && carY1 >= diamondY4-15)||
        (carX1+10 >= diamondX4 && carX1+10 <= diamondX4+40 && carY1+10 <= diamondY4+15 && carY1 >= diamondY4-15)||
        (carX1+45 >= diamondX4 && carX1+45 <= diamondX4+40 && carY1+10 <= diamondY4+15 && carY1 >= diamondY4-15)||
        (carX1 >= diamondX4 && carX1 <= diamondX4+40 && carY1+10 <= diamondY4+15 && carY1 >= diamondY4-50)||
        //rear hit detection
        (carX1+30 >= diamondX4 && carX1+30 <= diamondX4+40 && carY1+100 <= diamondY4+15 && carY1 >= diamondY4-15)||
        (carX1+10 >= diamondX4 && carX1+11 <= diamondX4+40 && carY1+100 <= diamondY4+15 && carY1 >= diamondY4-15)||
        (carX1+45 >= diamondX4 && carX1+45 <= diamondX4+40 && carY1+100 <= diamondY4+15 && carY1 >= diamondY4-15)||
        (carX1 >= diamondX4 && carX1 <= diamondX4+40 && carY1+100 <= diamondY4+15 && carY1 >= diamondY4-15)) {
        diamond4 =false;
        pointCounter +=1;
      }
    } 

    //pothole teleportation

    if ( potHoleY2 >= height+80) {
      potHoleX2 =(int) random(260, 500);
      potHoleY2 = (int) random(-100, -800);
    }
    if (potHoleY3 >= height+100) {
      potHoleX3 = (int) random(510, 750);
      potHoleY3 = (int) random(-100, -800);
    }
    if (potHoleY4 >= height+120) {
      potHoleX4 = (int) random(760, 950);
      potHoleY4 = (int) random(-100, -800);
    }

    //Rob teleportation
    if (robY2>= (int) random(725, 710)) {
      robY2= -100;
      robX2= (int) random(10, 950);
    }      
    if (robY3>= 760) {
      robY3 = -100;
      robX3 = (int) random(10, 950);
    }
    if (robY4>= 800) {
      robY4 = -100;
      robX4 = (int) random(10, 950);
    }
    if (robY5>= 850) {
      robY5 = -100;
      obstacleX5 = (int) random(10, 950);
    }


    // Diamonds (for picking up!)
    if (diamondY1 >=760) {
      diamondY1 = -600;
      diamondX1 = (int) random(10, 950);
    }
    if (diamondY2>= 720) {
      diamondY2=-300;
      diamondX2= (int) random(10, 950);
    }      
    if (diamondY3>= 760) {
      diamondY3 = -400;
      diamondX3 = (int) random(10, 950);
    }
    if (diamondY4>= 8050) {
      diamondY4 = -500;
      diamondX4 = (int) random(10, 950);
    }

    //obstacle teleportation
    if (obstacleY1 >=760) {
      obstacleY1 = -100;
      obstacleX1 = (int) random(10, 950);
    }
    if (obstacleY2>= 720) {
      obstacleY2=-300;
      obstacleX2= (int) random(10, 950);
    }      
    if (obstacleY3>= 760) {
      obstacleY3 = -200;
      obstacleX3 = (int) random(10, 950);
    }
    if (obstacleY4>= 800) {
      obstacleY4 = -100;
      obstacleX4 = (int) random(10, 950);
    }
    if (obstacleY5>= 850) {
      obstacleY5 = -500;
      obstacleX5 = (int) random(10, 950);
    }

    //median lines teleportation
    if (roadLineY1>= 760) {
      roadLineY1 = -100;
    }
    if (roadLineY2>= 760) {
      roadLineY2 = -100;
    }
    if (roadLineY3>= 760) {
      roadLineY3 = -100;
    }
    if (roadLineY4>= 760) {
      roadLineY4 = -100;
    }
    if (roadLineY5>= 760) {
      roadLineY5 = -100;
    }
    if (roadLineY6>= 760) {
      roadLineY6 = -100;
    }
    if (roadLineY7>= 760) {
      roadLineY7 = -100;
    }
    if (roadLineY8>= 760) {
      roadLineY8 = -100;
    }
    if (deathCounter <= 0) {
      gameState = 3;
    }
    if (pointCounter == 4) {
      gameState = 4;
    }
    //game state 1 variable reset
    if (( gameState == 1) && key == 'p') {
      counter =0;      
      pointCounter =0;
      deathCounter = 10;
      obstacle1 = true;
      obstacle2 = true;
      obstacle3 = true;
      obstacle4 = true;
      obstacle5 = true;
      obstacle6 = true;
      diamond1 = true;
      diamond2 = true;
      diamond3 = true;
      diamond4 = true;
      Rob1 = false;
      Rob2 = false;
      Rob3 = false;
      Rob4 = false;
      Rob5 = false;
      Rob6 = false;
      pothole1 = true;
      pothole2 = true;
      pothole3 = true;
      pothole4 = true;
      obstacleX1 = 100;
      obstacleY1 = -100;
      obstacleX2 = (int) random(100, 800);
      obstacleY2 = -100;
      obstacleX3 =(int) random(50, 850);
      obstacleY3 = -300;
      obstacleX4 =(int) random(0, 900);
      obstacleY4 =(int) random(0, 400);
      robX1 = (int) random (0, 900);
      robY1 = -100;
      robX2 = (int) random(0, 900);
      robY1 = -100;
      robX3 = (int) random(0, 900);
      robY3 = (int) random(-100, -500);
      robX4 = (int) random(0, 900);
      robY4 = (int) random(0, 900);
      potHoleX1 = (int) random(0, 900);
      potHoleX2 = (int) random(0, 900);
      potHoleX3 = (int) random(0, 900);
      potHoleX4 = (int) random(0, 900);
      potHoleY1 = -100;
      potHoleY2 = -200;
      potHoleY3 = -300;
      potHoleY4 = -400;
    }

    break;
  case 3:
    //"game over" screen
    background(255, 255, 255);
    textFont(ruleFont);
    fill(50);
    text("Game Over", 370, 200);
    text("Thanks for Playing!", 300, 300);
    textFont(ruleFont2);
    text("Developed with Java by Stefan LeClair and Nick Brower in Processing", 10, 400);
    textFont(ruleFont);
    text("Press r to return to start menu", 200, 500);
    break;
  case 4:
    //"winning" endgame screen
    background(255, 255, 255);
    textFont(ruleFont);
    text("Winner!", 370,100);
    text("End of Game", 370, 200);
    text("Thanks for Playing!", 300, 300);
    textFont(ruleFont2);
    text("Developed with Java by Stefan LeClair and Nick Brower in Processing", 10, 400);
    text("Press r to return to start menu", 200, 500);
  }
}

//roadblock is comprised of 150 squares
void drawSquares( int X, int Y) {
  fill(50);
  rect(X, Y, 20, 20);
}

//roadblock speed
void addtoElement(int [] a, int increase) {
  for (int i= 0; i< a.length; i++) {
    a[i] +=increase;
  }
}

void keyPressed() {
  //level progression from screen to screen
  
  //conditional for start screen to rule screen
  if (gameState == 0 && key == 's') {
    gameState = 1;
    timer =0;
  }
  //conditional for rule screen to level 1 
  if ( gameState == 1 && key == 'p') {
    gameState =2 ;
    counter1 = true;
  }
  //conditional for return to start menu from "game over" screen
  if ( gameState == 3 && key == 'r') {
    counter1 = false;
    counter=0;
    gameState =0;
    pointCounter =0;
    deathCounter =5;
    obstacle1 = true;
    obstacle2 = true;
    obstacle3 = true;
    obstacle4 = true;
    obstacle5 = true;
    obstacle6 = true;
    diamond1 = true;
    diamond2 = true;
    diamond3 = true;
    diamond4 = true;
    Rob1 = false;
    Rob2 = false;
    Rob3 = false;
    Rob4 = false;
    Rob5 = false;
    Rob6 = false;
    pothole1 = true;
    pothole2 = true;
    pothole3 = true;
    pothole4 = true;
  }
  //conditional for return to start menu from Endgame screen
  if (gameState == 4 && key == 'r') {
    counter1 = false;
    pointCounter =0;
    deathCounter =5;
    counter=0;
    gameState =0;
    obstacle1 = true;
    obstacle2 = true;
    obstacle3 = true;
    obstacle4 = true;
    obstacle5 = true;
    obstacle6 = true;
    diamond1 = true;
    diamond2 = true;
    diamond3 = true;
    diamond4 = true;
    Rob1 = false;
    Rob2 = false;
    Rob3 = false;
    Rob4 = false;
    Rob5 = false;
    Rob6 = false;
    pothole1 = true;
    pothole2 = true;
    pothole3 = true;
    pothole4 = true;
  }
  
}
