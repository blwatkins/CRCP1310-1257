void gameOverScreen() {
  background(0);
  displayEndOfGameText("Game Over!", "You have lost the memory game.");
}

void displayEndOfGameText(String header, String text) {
  fill(255);
  textFont(courierFont, 64);
  textAlign(CENTER, BOTTOM);
  text(header, width / 2.0, height / 2.0 - 100);
  
  textSize(32);
  rectMode(CENTER);
  text(text, width / 2.0, height / 2.0, width - 100, 100);
  
  textSize(32);
  rectMode(CENTER);
  text("Final Score: " + score, width / 2.0, height / 2.0 + 50, width - 100, 100);
  
  textSize(24);
  rectMode(CENTER);
  text("Press ENTER to see the high scores.", width / 2.0, height / 2.0 + 150, width - 100, 100);
}
