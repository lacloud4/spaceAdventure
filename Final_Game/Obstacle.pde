class Obstacle {

  int x;
  int y;
  int l;
  int w;
  int color1;
  int xSpeed;
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  // constructor for obstacle
  Obstacle (int xT, int yT, int wT, int lT) {
    x = xT;
    y = yT;
    w = wT;
    l = lT;
    color1 = (0);

    xSpeed = 5;

    topBound = y;
    bottomBound = y + l;
    leftBound = x;
    rightBound = x + w;
  }

  void render() {
    strokeWeight(4);
    stroke(255, 0, 0);
    fill(color1);
    rect(x, y, w, l);
  }

  void move() {
    x -= xSpeed;
  }

  void reset() {
    if (x - w + 100 < 0) {
      x = width;
      l = int(random(40, 200));
      y = int(random(height));
    }
  }

  void resetPBoundaries() {
    topBound = y;
    bottomBound = y + l;
    leftBound = x;
    rightBound = x + w;
  }

  void collisionDetect(Player p) {

    if (p.rightBound > leftBound) {
      if (p.bottomBound > topBound) {
        if (p.leftBound < rightBound) {
          if (p.topBound < bottomBound) {
            player1.shouldObsMove = false;
            player1.scoreUp = false;
            switchVal = '2';
          }
        }
      }
    } else {
      player1.scoreUp = true;
    }
  }

  void score() {
    fill(255);
    textSize(32);
    text("Score:" + score, width - 210, 40);

    if (player1.scoreUp == true) {
      score += 1;
    }
  }
}
