// [x] welcome screen
// game screen
// - cards
// - - image back
// - - colorful design from image pixels
// game over screen
// game win screen
// - sprite animation celebration
// high score system
// - save high scores with player names

final int START_SCREEN = 0;
final int GAME_SCREEN = 1;
final int GAME_OVER_SCREEN = 2;
final int GAME_WIN_SCREEN = 3;
final int HIGH_SCORE_SCREEN = 4;

int currentScreen;

String playerName = "";

PFont courierFont;

int cardColumns;
int cardRows;

Card[][] cards;

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

int highlightCol;
int highlightRow;

Card flippedCard1 = null;
Card flippedCard2 = null;

int score = 0;
int livesRemaining = 3;

void setup() {
  size(800, 800);
  currentScreen = START_SCREEN;
  courierFont = loadFont("CourierNewPSMT-64.vlw");

  cardColumns = (int)random(2, 6);
  cardRows = (int)random(2, 6);
  cards = new Card[cardRows][cardColumns];

  buildCards();

  highlightCol = 0;
  highlightRow = 0;
}

void draw() {
  if (currentScreen == START_SCREEN) {
    startScreen();
  } else if (currentScreen == GAME_SCREEN) {
    gameScreen();
  } else if (currentScreen == GAME_OVER_SCREEN) {
    gameOverScreen();
  } else if (currentScreen == GAME_WIN_SCREEN) {
    gameWinScreen();
  } else if (currentScreen == HIGH_SCORE_SCREEN) {
    highScoreScreen();
  }
}

void keyPressed() {
  if (currentScreen == START_SCREEN) {
    startScreenKeyPressed(key);
  } else if (currentScreen == GAME_SCREEN) {
    gameScreenKeyPressed(key, keyCode);
  }
}

void buildCards() {
  int minDesignNumber = 1;
  int maxDesignNumber = 5;

  int totalCards = cardColumns * cardRows;
  int totalPairs = totalCards / 2;

  for (int i = 0; i < totalPairs; i++) {
    int designNumber = (int)random(minDesignNumber, maxDesignNumber + 1);
    int colorIndex = (int)random(designColors.length);
    int cardsPlaced = 0;

    while (cardsPlaced < 2) {
      int row = (int)random(cardRows);
      int col = (int)random(cardColumns);

      if (cards[row][col] == null) {
        cards[row][col] = new Card(designNumber, colorIndex);
        cardsPlaced++;
      }
    }
  }

  for (int row = 0; row < cardRows; row++) {
    for (int col = 0; col < cardColumns; col++) {
      if (cards[row][col] == null) {
        cards[row][col] = new Card(-1, -1);
      }
    }
  }
}
