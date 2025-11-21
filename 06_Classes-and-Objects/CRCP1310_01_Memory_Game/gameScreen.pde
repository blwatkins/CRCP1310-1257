void gameScreen() {
  background(255);
  fill(0);
  textAlign(CENTER, CENTER);
  text(playerName, width / 2.0, 25);
  textAlign(LEFT, CENTER);
  text("Score: " + score, 25, 25);
  textAlign(RIGHT, CENTER);
  text("Lives: " + livesRemaining, width - 25, 25);
  displayCards();
}

void gameScreenKeyPressed(char pressedKey, int codedKey) {
  if (pressedKey == CODED) {
    if (codedKey == RIGHT) {
      highlightCol = (highlightCol + 1) % cardColumns;
    } else if (codedKey == LEFT) {
      highlightCol--;

      if (highlightCol < 0) {
        highlightCol = cardColumns - 1;
      }
    } else if (codedKey == UP) {
      highlightRow--;

      if (highlightRow < 0) {
        highlightRow = cardRows - 1;
      }
    } else if (codedKey == DOWN) {
      highlightRow = (highlightRow + 1) % cardRows;
    }
  } else {
    if (pressedKey == ENTER || pressedKey == RETURN) {
      if (highlightCol >= 0 &&
        highlightCol < cardColumns &&
        highlightRow >= 0 &&
        highlightRow < cardRows)
      {
        flipCard(highlightRow, highlightCol);
      }
    }
  }
}

void displayCards() {
  float xBuffer = 50;
  float gameBoardMinX = xBuffer;
  float gameBoardMaxX = width - xBuffer;
  float gameBoardWidth = gameBoardMaxX - gameBoardMinX;
  float xSpacing = gameBoardWidth / cardColumns;
  float w = xSpacing * 0.9;

  float yBuffer = 100;
  float gameBoardMinY = yBuffer;
  float gameBoardMaxY = height - yBuffer;
  float gameBoardHeight = gameBoardMaxY - gameBoardMinY;
  float ySpacing = gameBoardHeight / cardRows;
  float h = ySpacing * 0.9;

  // cards Arrray Illustration
  // [ ] => [ Card(), Card(), Card() ]
  // [ ] => [ Card(), Card(), Card() ]
  // [ ] => [ Card(), Card(), Card() ]

  for (int row = 0; row < cards.length; row++) {
    for (int col = 0; col < cards[row].length; col++) {
      float x = (col * xSpacing) + (xSpacing / 2.0) + gameBoardMinX;
      float y = (row * ySpacing) + (ySpacing / 2.0) + gameBoardMinY;
      cards[row][col].display(x, y, w, h, isHighlighted(row, col));
    }
  }
}

boolean isHighlighted(int row, int col) {
  return row == highlightRow && col == highlightCol;
}

void flipCard(int row, int col) {
  Card card = cards[row][col];
  
  if (!card.isFlipped && card.isFlippable()) {
    if (flippedCard1 == null) {
      flippedCard1 = card;
      flippedCard1.flip();
    } else if (flippedCard2 == null) {
      flippedCard2 = card;
      flippedCard2.flip();
      checkForMatch();
    }
  }
}

void checkForMatch() {
  if (isPair(flippedCard1, flippedCard2)) {
    score++;
    
    if (isWinner()) {
      currentScreen = GAME_WIN_SCREEN; 
    }
  } else {
    livesRemaining--;
    flippedCard1.flip();
    flippedCard2.flip();
    
    if (livesRemaining < 0) {
      currentScreen = GAME_OVER_SCREEN; 
    }
  }
  
  flippedCard1 = null;
  flippedCard2 = null;
}

boolean isPair(Card card1, Card card2) {
  boolean sameColorIndex = card1.colorIndex == card2.colorIndex;
  boolean sameDesignNumber = card1.getDesignNumber() == card2.getDesignNumber();
  return sameColorIndex && sameDesignNumber;
}

boolean isWinner() {
  int totalCardsLeft = 0;
  
  for (int row = 0; row < cardRows; row++) {
    for (int col = 0; col < cardColumns; col++) {
      if (cards[row][col].isFlipped == false) {
        totalCardsLeft++; 
      }
    }
  }
  
  return totalCardsLeft < 2;
}
