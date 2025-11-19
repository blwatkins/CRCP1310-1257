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

Card[][] cards;

void setup() {
  size(800, 800);
  currentScreen = START_SCREEN;
  courierFont = loadFont("CourierNewPSMT-64.vlw");
  
  cards = new Card[3][3];
  
  for (int row = 0; row < cards.length; row++) {
    for (int col = 0; col < cards[row].length; col++) {
      cards[row][col] = new Card();
    }
  }
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
  }
}
