// welcome screen
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

int currentScreen;

void setup() {
  size(800, 800);
  currentScreen = START_SCREEN;
}

void draw() {
  if (currentScreen == START_SCREEN) {
    startScreen(); 
  }
}
