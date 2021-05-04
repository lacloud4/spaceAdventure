class Player {

  // variables
  int x;
  int y;
  int w;
  color color1;
  int upSpeed;
  int fallSpeed;
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  boolean movingDown;
  boolean movingUp;
  boolean shouldObsMove;
  boolean scoreUp;

  // constructor for player
  Player (int xP, int yP, int wP) {
    x = xP;
    y = yP;
    w = wP;
    color1 = color (0);

    upSpeed = 5;
    fallSpeed = 6;

    topBound = y;
    bottomBound = y + w;
    leftBound = x;
    rightBound = x + w;

    movingDown = false;
    movingUp = false;
    shouldObsMove = true;
  }

  // rendering player
  void render() {
    fill (color1);
    square (x, y, w);
  }

  // function to move player up
  void moveUp() {
    if (movingUp == true) {
      y -= upSpeed;
    }
  }

  // function to move player down
  void moveDown() {
    if (movingDown == true) {
      y += fallSpeed;
    }
  }

  // function to reset boundaries
  void resetBoundaries() {
    topBound = y;
    bottomBound = y + w;
    leftBound = x;
    rightBound = x + w;
  }
}
