boolean isOn;

float x;
float y;
float w;
float h;

void setup() {
  size(500, 500);
  isOn = false;

  x = width / 2.0;
  y = height / 2.0;
  w = 150;
  h = 150;
}

void draw() {
  if (isOn) {
    background(255, 255, 0);
  } else {
    background(0);
  }

  drawButton();
}

void mousePressed() {
  if (mouseInButton()) {
    isOn = !isOn;
  }
}

void drawButton() {
  rectMode(CENTER);
  rect(x, y, w, h);
}

boolean mouseInButton() {
  float minX = x - (w / 2.0);
  float maxX = x + (w / 2.0);
  boolean greaterThanMinX = mouseX > minX;
  boolean lessThanMaxX = mouseX < maxX;
  return greaterThanMinX && lessThanMaxX;
}
