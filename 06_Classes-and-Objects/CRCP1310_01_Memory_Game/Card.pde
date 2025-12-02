class Card {
  int colorIndex;
  boolean isFlipped;
  CardDesign design = null;

  Card(int designNumber, int colorIndex) {
    isFlipped = false;
    this.colorIndex = colorIndex;

    if (colorIndex >= 0 && colorIndex < designColors.length) {
      color designColor = designColors[colorIndex];

      if (designNumber == 1) {
        design = new CardDesign1(designColor);
      } else if (designNumber == 2) {
        design = new CardDesign2(designColor);
      } else if (designNumber == 3) {
        design = new CardDesign3(designColor);
      } else if (designNumber == 4) {
        design = new CardDesign4(designColor);
      } else if (designNumber == 5) {
        design = new CardDesign5(designColor);
      }
    }
  }
  
  void displayCardBack(float x, float y, float w, float h) {
    imageMode(CENTER);
    image(cardBackImage, x, y, w, h);
  }

  void display(float x, float y, float w, float h, boolean isHighlighted) {
    if (!isFlipped) {
      displayCardBack(x, y, w, h);
    } else if (isFlipped && design != null) {
      rectMode(CENTER);
      fill(200);
      strokeWeight(4);
      stroke(0);
      rect(x, y, w, h, 25);
      design.display(x, y, w, h);
    }

    if (isHighlighted) {
      drawCardHighlight(x, y, w, h);
    }
  }

  void drawCardHighlight(float x, float y, float w, float h) {
    rectMode(CENTER);
    noFill();
    strokeWeight(6);
    stroke(255, 255, 0);
    rect(x, y, w, h, 25);
  }

  void flip() {
    isFlipped = !isFlipped;
  }

  boolean isFlippable() {
    boolean hasValidColor = colorIndex >= 0 && colorIndex < designColors.length;
    boolean hasValidDesign = design != null;
    return hasValidColor && hasValidDesign;
  }

  int getDesignNumber() {
    if (design != null) {
      return design.getDesignNumber();
    } else {
      return -1;
    }
  }
}
