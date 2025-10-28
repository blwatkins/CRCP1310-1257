void drawCardDesign(int designNumber, float x, float y, float w, float h, color c) {
  if (designNumber == 1) {
    cardDesign1(x, y, w, h, c);
  } else if (designNumber == 2) {
    cardDesign2(x, y, w, h, c);
  } else if (designNumber == 3) {
    cardDesign3(x, y, w, h, c);
  } else if (designNumber == 4) {
    cardDesign4(x, y, w, h, c);
  } else if (designNumber == 5) {
    cardDesign5(x, y, w, h, c);
  } else {
    drawCard(x, y, w, h);
  }
}

void drawCard(float x, float y, float w, float h) {
  rectMode(CENTER);
  fill(200);
  strokeWeight(4);
  stroke(0);
  rect(x, y, w, h, 25);
}

void cardDesign1(float x, float y, float w, float h, color c) {
  drawCard(x, y, w, h);

  float d = min(w, h) * 0.5;
  strokeWeight(5);
  stroke(c);
  noFill();
  ellipse(x, y, d, d);
}

void cardDesign2(float x, float y, float w, float h, color c) {
  drawCard(x, y, w, h);

  float d = min(w, h) * 0.5;
  fill(c);
  noStroke();
  ellipse(x, y, d, d);
}

void cardDesign3(float x, float y, float w, float h, color c) {
  drawCard(x, y, w, h);

  float d = min(w, h) * 0.5;
  float r = d / 2.0;
  strokeWeight(5);
  stroke(c);
  noFill();
  ellipse(x, y, d, d);
  line(x - r, y - r, x + r, y + r);
}

void cardDesign4(float x, float y, float w, float h, color c) {
  drawCard(x, y, w, h);

  float d = min(w, h) * 0.5;
  float r = d / 2.0;
  strokeWeight(5);
  stroke(c);
  noFill();
  ellipse(x, y, d, d);
  line(x + r, y - r, x - r, y + r);
}

void cardDesign5(float x, float y, float w, float h, color c) {
  drawCard(x, y, w, h);

  float d = min(w, h) * 0.5;
  float r = d / 2.0;
  strokeWeight(5);
  stroke(c);
  noFill();
  ellipse(x, y, d, d);
  line(x - r, y - r, x + r, y + r);
  line(x + r, y - r, x - r, y + r);
}
