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

int currentScreen;

void setup() {
  size(500, 500);
  currentScreen = GAME_SCREEN;
}

void draw() {
  if (currentScreen == START_SCREEN) {
    startScreen();
  } else if (currentScreen == GAME_SCREEN) {
    gameScreen();
  } else {
    gameOverScreen();
  }
}

void keyPressed() {
  if (currentScreen == START_SCREEN) {
    if (key == ENTER || key == RETURN) {
      currentScreen = GAME_SCREEN;
    }
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
  drawCardDesign(1, width / 2.0, height / 2.0, 100, 150, color(0, 255, 0));
}

void gameOverScreen() {
  background(255, 255, 0);
}
