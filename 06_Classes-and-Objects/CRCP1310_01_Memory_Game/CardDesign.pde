class CardDesign {
  color designColor;

  CardDesign(color designColor) {
    this.designColor = designColor;
  }

  int getDesignNumber() {
    return 0;
  }

  void display(float x, float y, float w, float h) {
    stroke(designColor);
    point(x, y);
    point(x + w, y + h);
  }
}

class CardDesign1 extends CardDesign {
  CardDesign1(color designColor) {
    super(designColor);
  }

  int getDesignNumber() {
    return 1;
  }

  void display(float x, float y, float w, float h) {
    float d = min(w, h) * 0.5;
    strokeWeight(5);
    stroke(designColor);
    noFill();
    ellipse(x, y, d, d);
  }
}

class CardDesign2 extends CardDesign {
  CardDesign2(color designColor) {
    super(designColor);
  }

  int getDesignNumber() {
    return 2;
  }

  void display(float x, float y, float w, float h) {
    float d = min(w, h) * 0.5;
    fill(designColor);
    noStroke();
    ellipse(x, y, d, d);
  }
}
