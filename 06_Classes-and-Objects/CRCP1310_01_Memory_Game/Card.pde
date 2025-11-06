class Card {
  int designNumber;
  color designColor;
  boolean isFlipped;

  Card() {
    designNumber = -1;
    designColor = color(0);
    isFlipped = false;
  }

  void display() {
    rectMode(CENTER);
    fill(200);
    strokeWeight(4);
    stroke(0);
    rect(width / 2.0, height / 2.0, 50, 100, 25);
  }
}
