boolean isOn;

float x;
float y;
float w;
float h;

float cx;
float cy;
float cd;

void setup() {
  size(500, 500);
  isOn = false;

  x = width / 2.0;
  y = height / 2.0;
  w = 150;
  h = 150;
  
  cx = 50;
  cy = 50;
  cd = 50;
}

void draw() {
  if (isOn) {
    background(255, 255, 0);
  } else {
    background(0);
  }

  drawButton();
  drawCircleButton();
}

void mousePressed() {
  if (mouseInButton()) {
    isOn = !isOn;
  }
  
  if (mouseInCircleButton()) {
    randomizeButton();
  }
}

void drawButton() {
  rectMode(CENTER);
  rect(x, y, w, h);
}

void randomizeButton() {
  w = random(10, 200);
  h = random(10, 200);
  x = random(w / 2.0, width - (w / 2.0));
  y = random(h / 2.0, height - (h / 2.0));
}

void drawCircleButton() {
  ellipse(cx, cy, cd, cd);
}

boolean mouseInButton() {
  float minX = x - (w / 2.0);
  float maxX = x + (w / 2.0);
  float minY = y - (h / 2.0);
  float maxY = y + (h / 2.0);
  boolean greaterThanMinX = mouseX > minX;
  boolean lessThanMaxX = mouseX < maxX;
  boolean greaterThanMinY = mouseY > minY;
  boolean lessThanMaxY = mouseY < maxY;
  boolean isWithinXBounds = greaterThanMinX && lessThanMaxX;
  boolean isWithinYBounds = greaterThanMinY && lessThanMaxY;
  return  isWithinXBounds && isWithinYBounds;
}

boolean mouseInCircleButton() {
  float distance = dist(cx, cy, mouseX, mouseY);
  float radius = cd / 2.0;
  return (distance <= radius);
}
