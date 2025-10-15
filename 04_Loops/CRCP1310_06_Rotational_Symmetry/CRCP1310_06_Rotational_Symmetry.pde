int circleTotal1;
int circleTotal2;
int squareTotal;

void setup() {
  size(500, 500);
  circleTotal1 = (int)random(3, 50);
  circleTotal2 = (int)random(3, 50);
  squareTotal = (int)random(3, 50);
}

void draw() {
  drawRingByCount(circleTotal2);
  drawRingByAngle(circleTotal1);
  drawRingOfSquares(squareTotal);
}

void drawRingOfSquares(int squareTotal) {
  float centerX = width / 2.0;
  float centerY = height / 2.0;
  float ringRadius = 150;
  
  rectMode(CENTER);
  for (float theta = 0; theta < TWO_PI; theta += (TWO_PI / squareTotal)) {
    float x = (ringRadius * cos(theta)) + centerX;
    float y = (ringRadius * sin(theta)) + centerY;
    noStroke();
    fill(0, 180, 100, 75);
    rect(x, y, 50, 50);
  }
}

void drawRingByCount(int circleTotal) {
  // count circles
  float centerX = width / 2.0;
  float centerY = height / 2.0;
  float ringRadius = 200;
  float theta = 0;

  pushMatrix();
  translate(centerX, centerY);

  for (int i = 0; i < circleTotal; i++) {
    
    if (i % 2 == 0) {
      noFill();
      strokeWeight(3);
      stroke(0);
    } else {
      noStroke();
      fill(255, 255, 0);
    }
    
    pushMatrix();
    rotate(theta);
    ellipse(ringRadius, 0, 100, 100);
    popMatrix();
    theta += (TWO_PI / circleTotal);
  }

  popMatrix();
}

void drawRingByAngle(int circleTotal) {
  // "count" from 0-TWO_PI
  float centerX = width / 2.0;
  float centerY = height / 2.0;
  float ringRadius = 100;

  pushMatrix();
  translate(centerX, centerY);

  for (float theta = 0; theta < TWO_PI; theta += (TWO_PI / circleTotal)) {
    pushMatrix();
    rotate(theta);
    strokeWeight(1);
    stroke(0);
    fill(255, 0, 200);
    ellipse(ringRadius, 0, 25, 25);
    popMatrix();
  }

  popMatrix();
}
