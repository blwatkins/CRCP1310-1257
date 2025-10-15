void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  daisy(width / 2.0, height / 2.0, 100, 8);
}

void daisy(float x, float y, float size, int petalTotal) {
  pushMatrix();
  translate(x, y);
  float theta = 0;
  float radius = size / 4.0;
  
  for (int i = 0; i < petalTotal; i++) {
    float petalHeight = size / 2.0;
    float petalX = radius * cos(theta);
    float petalY = radius * sin(theta);
    pushMatrix();
    translate(petalX, petalY);
    rotate(HALF_PI + theta);
    noStroke();
    fill(255);
    ellipse(0, 0, petalHeight / 5.0, petalHeight);
    popMatrix();
    theta += (TWO_PI / petalTotal);
  }
  
  noStroke();
  fill(255, 255, 0);
  ellipse(0, 0, size / 10, size / 10);
  
  popMatrix();
}

void keyPressed() {
  if (key == ' ') {
    daisy(random(width), random(height), random(5, 100), (int)random(4, 10)); 
  }
}
