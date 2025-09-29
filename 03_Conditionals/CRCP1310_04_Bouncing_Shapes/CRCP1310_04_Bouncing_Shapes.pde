float x;
float y;
float d;

float xSpeed;
float ySpeed;

float squareX;
float squareY;

float squareXSpeed;
float squareYSpeed;

void setup() {
  size(500, 500);
  x = random(width);
  y = random(height);
  d = random(10, 125);
  
  xSpeed = random(-4, 4);
  ySpeed = random(-4, 4);
  
  squareX = random(width);
  squareY = random(height);
  
  squareXSpeed = random(-4, 4);
  squareYSpeed = random(-4, 4);
}

void draw() {
  drawCircle();
  moveCircle();
  bounceCircle();
  
  drawSquare();
  moveSquare();
  bounceSquare();
}

void drawCircle() {
  noFill();
  stroke(0, 50, 220, 100);
  strokeWeight(3);
  ellipse(x, y, d, d);
}

void drawSquare() {
  noStroke();
  fill(200, 0, 0, 75);
  rectMode(CENTER);
  rect(squareX, squareY, 100, 100);
}

void moveCircle() {
  x = x + xSpeed;
  y = y + ySpeed;
}

void moveSquare() {
  squareX = squareX + squareXSpeed;
  squareY = squareY + squareYSpeed;
}

void bounceCircle() {
  if (x >= width) {
    xSpeed = -xSpeed;
    // xSpeed = xSpeed * -1;
  } else if (x <= 0) {
    xSpeed = -xSpeed;
  }
  
  if (y >= height) {
    ySpeed = -ySpeed; 
  } else if (y <= 0) {
    ySpeed = -ySpeed;
  }
}

void bounceSquare() {
  if (squareX >= width) {
    squareXSpeed = random(-4, -0.25);
  } else if (squareX <= 0) {
    squareXSpeed = random(0.25, 4);
  }
  
  if (squareY >= height) {
    squareYSpeed = random(-4, -0.25);
  } else if (squareY <= 0) {
    squareYSpeed = random(0.25, 4);
  }
}
