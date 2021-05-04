// INSTRUCTIONS: up arrow controls player
// hold to rise & let go to fall

PImage startImage;
PImage backgroundImage;
PImage[] shipImages = new PImage[4]; 
Player player1;
Animation ship;
Obstacle obstacle1;
int score;
char switchVal;

Obstacle[] obstacleArray = new Obstacle[5];

void setup() {
  size (700, 700);
  backgroundImage = loadImage("fg background.jpeg");
  startImage = loadImage("homeScreen.png");

  player1 = new Player(50, height - height/2, 25); // make player

  ship = new Animation (shipImages, .3, 3); // make turbo animation

  ship.fillImages();

  for (int i=0; i<obstacleArray.length; i ++) {
    Obstacle obstacle1 = new Obstacle(500*i, int(random(height)), 50, int(random(50, 300)));
    obstacleArray[i] = obstacle1;
  }
  switchVal = '0';
}

void draw() {
  switch(switchVal) {
  case '0':
    image(backgroundImage, 0, 0, width, height);
    image(startImage, 200, 100, 125, 125);
    fill(255, 255, 0);
    textSize(25);
    text("Press spacebar to play", 375, 500);
    break;
  case '1':
    player1.render();
    player1.moveUp();
    player1.moveDown();
    player1.resetBoundaries();

    ship.backgroundAnimation();
    ship.display(player1.x + player1.w, player1.y + player1.w);

    for (int i=0; i<obstacleArray.length; i ++) {
      obstacleArray[i].render(); 

      if (player1.shouldObsMove == true) {
        obstacleArray[i].move();
      }

      obstacleArray[i].reset();
      obstacleArray[i].resetPBoundaries();
      obstacleArray[i].collisionDetect(player1);
      obstacleArray[i].score();
    }

    break;
  case '2':
    fill(255, 255, 0);
    textSize(100);
    text ("Game Over", 100, 200);
    break;
  }
}

void keyPressed() {
  // if statements making player move up    
  if (keyCode == UP) {
    player1.movingUp = true;
    player1.movingDown = false;
    ship.isAnimating = true;
  }
  if (keyCode == ' ') {
    switchVal = '1';
  }
}

void keyReleased() {
  // if statements making player move down
  if (keyCode == UP) {
    player1.movingUp = false;
    player1.movingDown = true;
  }
}
