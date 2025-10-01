float x;
float y;
float d;

float speedX;
float speedY;

float g;
float damping;
float friction;

void setup() {
  size(500, 500);

  x = width / 2.0;
  y = height / 2.0;
  d = 50;

  speedX = 2;
  speedY = 0;

  g = 0.05;

  damping = 0.8;
  friction = 0.5;

  background(255);
}

void draw() {
  background(255);
  drawCircle();
  moveCircle();
  bounceCircle();
}

void drawCircle() {
  strokeWeight(2);
  stroke(0, 0, 225);
  noFill();
  ellipse(x, y, d, d);
}

void moveCircle() {
  x = x + speedX;
  y = y + speedY;

  speedY = speedY + g;
}

void bounceCircle() {
  if ((x + d / 2.0) >= width) {
    speedX = -speedX;
  } else if ((x - d / 2.0) <= 0) {
    speedX = -speedX;
  }

  if ((y + d / 2.0) >= height) {
    speedY = -speedY * damping;
    speedX = speedX * friction;
  } else if ((y - d / 2.0) <= 0) {
    speedY = -speedY * damping;
    speedX = speedX * friction;
  }
}
