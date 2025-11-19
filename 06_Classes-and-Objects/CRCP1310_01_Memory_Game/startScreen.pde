void startScreen() {
  background(0);
  fill(255);
  textFont(courierFont, 64);
  textAlign(CENTER, BOTTOM);
  text("Memory Game!", width / 2.0, height / 2.0 - 100);

  textSize(32);
  rectMode(CENTER);
  text("Please enter your name, then press ENTER to continue.", width / 2.0, height / 2.0, width - 100, 100);

  text("Player Name: ", width / 2.0, height / 2.0 + 150);
  text(playerName + "_", width / 2.0, height / 2.0 + 200);
}

void startScreenKeyPressed(char pressedKey) {
  if (isValidNameCharacter(pressedKey) &&
    playerName.length() < 20) {
    playerName += pressedKey;
  } else if (pressedKey == BACKSPACE ||
    pressedKey == DELETE) {
    if (!playerName.isEmpty()) {
      playerName = playerName.substring(0, playerName.length() - 1);
    }
  } else if (pressedKey == ENTER ||
    pressedKey == RETURN) {
      if (playerName.isEmpty() || playerName.isBlank()) { 
        playerName = "No Name";
      }
      
      currentScreen = GAME_SCREEN;
  }
}

boolean isValidNameCharacter(char c) {
  return Character.isAlphabetic(c) ||
    Character.isDigit(c) ||
    c == ' ';
}
