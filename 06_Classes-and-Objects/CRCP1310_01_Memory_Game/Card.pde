class Card {
  int designNumber;
  color designColor;
  boolean isFlipped;

  Card() {
    designNumber = -1;
    designColor = color(0);
    isFlipped = false;
  }

  void display(float x, float y, float w, float h) {
    rectMode(CENTER);
    fill(200);
    strokeWeight(4);
    stroke(0);
    rect(x, y, w, h, 25);
  }
}
