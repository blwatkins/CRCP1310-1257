// welcome screen
// cards
// - designs
// - color
// display cards in a grid
// hide the cards and flip the cards
// compare the cards
// remove matches and increase score
// decrease lives if no match
// display score at end of game

final int START_SCREEN = 0;
final int GAME_SCREEN = 1;
final int GAME_OVER_SCREEN = 2;
final int GAME_WIN_SCREEN = 3;

final int DESIGN_INDEX = 0;
final int COLOR_INDEX = 1;
final int FLIP_INDEX = 2;

final int DESIGN_UP = 0;
final int DESIGN_DOWN = 1;

int totalDesigns = 5;

color[] designColors = {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(255, 255, 0),
  color(255, 0, 255),
  color(0, 255, 255),
  color(0),
  color(255)
};

int currentScreen;

int rows;
int cols;

int highlightRow;
int highlightCol;

int[][][] cards;

int flippedRow1 = -1;
int flippedRow2 = -1;

int flippedCol1 = -1;
int flippedCol2 = -1;

int designNumber1 = -1;
int designNumber2 = -1;

int colorIndex1 = -1;
int colorIndex2 = -1;

int score = 0;
int lives = 3;

void setup() {
  size(500, 500);
  currentScreen = START_SCREEN;

  rows = (int)random(2, 6);
  cols = (int)random(2, 6);
  cards = new int[rows][cols][3];

  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      cards[row][col][DESIGN_INDEX] = -1;
      cards[row][col][COLOR_INDEX] = -1;
      cards[row][col][FLIP_INDEX] = DESIGN_DOWN;
    }
  }

  int totalCards = rows * cols;

  for (int i = 0; i < totalCards / 2; i++) {
    int designNumber = getRandomDesignNumber();
    int colorIndex = getRandomColorIndex();

    int randomRow = (int)random(rows);
    int randomCol = (int)random(cols);

    for (int card = 0; card < 2; card++) {
      boolean cardFound = false;
      while (!cardFound) {
        if (cards[randomRow][randomCol][DESIGN_INDEX] == -1) {
          cards[randomRow][randomCol][DESIGN_INDEX] = designNumber;
          cards[randomRow][randomCol][COLOR_INDEX] = colorIndex;
          cardFound = true;
        } else {
          randomRow = (int)random(rows);
          randomCol = (int)random(cols);
        }
      }
    }
  }

  highlightCol = 0;
  highlightRow = 0;
}

int getRandomDesignNumber() {
  return (int)random(1, totalDesigns + 1);
}

int getRandomColorIndex() {
  return (int)random(designColors.length);
}

void draw() {
  if (currentScreen == START_SCREEN) {
    startScreen();
  } else if (currentScreen == GAME_SCREEN) {
    gameScreen();
  } else if (currentScreen == GAME_WIN_SCREEN) {
    gameWinScreen();
  } else {
    gameOverScreen();
  }
}

void keyPressed() {
  if (currentScreen == START_SCREEN) {
    if (key == ENTER || key == RETURN) {
      currentScreen = GAME_SCREEN;
    }
  } else if (currentScreen == GAME_SCREEN) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        highlightCol = (highlightCol + 1) % cols;
      } else if (keyCode == LEFT) {
        highlightCol--;

        if (highlightCol < 0) {
          highlightCol = cols - 1;
        }
      } else if (keyCode == UP) {
        highlightRow--;

        if (highlightRow < 0) {
          highlightRow = rows - 1;
        }
      } else if (keyCode == DOWN) {
        highlightRow = (highlightRow + 1) % rows;
      }
    } else {
      if (key == ENTER || key == RETURN) {
        if (highlightCol >= 0 &&
          highlightCol < cols &&
          highlightRow >= 0 &&
          highlightRow < rows)
        {
          flipCard(highlightRow, highlightCol);
        }
      }
    }
  }
}

void flipCard(int row, int col) {
  int currentFlip = cards[row][col][FLIP_INDEX];
  int designNumber = cards[row][col][DESIGN_INDEX];
  int colorIndex = cards[row][col][COLOR_INDEX];

  if (currentFlip == DESIGN_DOWN
    && designNumber >= 1
    && colorIndex >= 0)
  {
    cards[row][col][FLIP_INDEX] = DESIGN_UP;

    if (designNumber1 == -1) {
      flippedCol1 = col;
      flippedRow1 = row;
      designNumber1 = cards[row][col][DESIGN_INDEX];
      colorIndex1 = cards[row][col][COLOR_INDEX];
    } else if (designNumber2 == -1) {
      flippedCol2 = col;
      flippedRow2 = row;
      designNumber2 = cards[row][col][DESIGN_INDEX];
      colorIndex2 = cards[row][col][COLOR_INDEX];
      checkForMatch();
    }
  }
}

void checkForMatch() {
  if (designNumber1 == designNumber2
    && colorIndex1 == colorIndex2) {
    score++;
    resetFlippedCards();
    checkForWin();
  } else {
    cards[flippedRow1][flippedCol1][FLIP_INDEX] = DESIGN_DOWN;
    cards[flippedRow2][flippedCol2][FLIP_INDEX] = DESIGN_DOWN;
    resetFlippedCards();
    lives--;
    score--;

    if (lives < 0) {
      currentScreen = GAME_OVER_SCREEN;
    }
  }
}

void resetFlippedCards() {
  flippedRow1 = -1;
  flippedRow2 = -1;

  flippedCol1 = -1;
  flippedCol2 = -1;

  designNumber1 = -1;
  designNumber2 = -1;

  colorIndex1 = -1;
  colorIndex2 = -1;
}

void checkForWin() {
  int designDownCount = 0;

  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      int flipValue = cards[row][col][FLIP_INDEX];
      if (flipValue == DESIGN_DOWN) {
        designDownCount++;
      }
    }
  }

  if (designDownCount < 2) {
    currentScreen = GAME_WIN_SCREEN;
  }
}

void startScreen() {
  background(0);
  fill(255);
  textSize(64);
  textAlign(CENTER, BOTTOM);
  text("Memory Game!", width / 2.0, height / 2.0);

  textAlign(CENTER, TOP);
  textSize(28);
  text("Press ENTER to start", width / 2.0, height / 2.0 + 25);
}

void gameScreen() {
  background(255);
  drawCards();
  textAlign(LEFT, TOP);
  textSize(24);
  fill(0);
  text("score: " + score, 10, 10);

  textAlign(RIGHT, TOP);
  text("lives remaining: " + lives, width - 10, 10);
}

void drawCards() {
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      drawCard(row, col);
    }
  }
}

void drawCard(int row, int col) {
  float xBuffer = 50;
  float gameBoardMinX = xBuffer;
  float gameBoardMaxX = width - xBuffer;
  float gameBoardWidth = gameBoardMaxX - gameBoardMinX;
  float xSpacing = gameBoardWidth / cols;
  float x = (col * xSpacing) + (xSpacing / 2.0) + gameBoardMinX;
  float w = xSpacing * 0.9;
  
  float yBuffer = 50;
  float gameBoardMinY = yBuffer;
  float gameBoardMaxY = height - yBuffer;
  float gameBoardHeight = gameBoardMaxY - gameBoardMinY;
  float ySpacing = gameBoardHeight / rows;
  float y = (row * ySpacing) + (ySpacing / 2.0) + gameBoardMinY;
  float h = ySpacing * 0.9;

  int designNumber = cards[row][col][DESIGN_INDEX];
  int colorIndex = cards[row][col][COLOR_INDEX];
  color designColor = selectDesignColor(colorIndex);
  int cardFlip = cards[row][col][FLIP_INDEX];

  if (cardFlip == DESIGN_UP) {
    drawCardDesign(
      designNumber,
      x,
      y,
      w,
      h,
      designColor);
  } else {
    drawCard(x, y, w, h);
  }

  if (col == highlightCol && row == highlightRow) {
    drawCardHighlight(x, y, w, h);
  }
}

void gameOverScreen() {
  background(0);
  fill(255);
  textSize(64);
  textAlign(CENTER, BOTTOM);
  text("Game Over", width / 2.0, height / 2.0);
  
  textAlign(CENTER, TOP);
  textSize(28);
  text("Thank you for playing!", width / 2.0, height / 2.0 + 25);
}

void gameWinScreen() {
  background(0);
  fill(255);
  textSize(64);
  textAlign(CENTER, BOTTOM);
  text("You Won!!!", width / 2.0, height / 2.0);
  
  textAlign(CENTER, TOP);
  textSize(28);
  text("Thank you for playing!", width / 2.0, height / 2.0 + 25);

  text("Final Score: " + score, width / 2.0, height / 2.0 + 75);
}
