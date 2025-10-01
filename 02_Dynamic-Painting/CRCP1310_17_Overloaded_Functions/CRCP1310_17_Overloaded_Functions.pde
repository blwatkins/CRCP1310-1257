float x;
float y;

float speedX;
float speedY;

void setup() {
  size(500, 500);
  background(0);
  x = width / 2.0;
  y = height / 2.0;
  
  speedX = random(-4, 4);
  speedY = random(-4, 4);
}

void draw() {
  color c = getColorFromPosition(x, y);
  drawCircle(x, y, c);
  
  x = x + speedX;
  y = y + speedY;
}

void mousePressed() {
  drawCircle(mouseX, mouseY);
}

void keyPressed() {
  drawCircle(); 
}

color getColorFromPosition(float x, float y) {
  int red = (int)map(x, 0, width, 0, 255);
  int green = (int)map(y, 0, height, 0, 255);
  int blue = (int)map(mouseX, 0, width, 0, 255);
  return color(red, green, blue);
}

void drawCircle(float x, float y) {
  strokeWeight(3);
  stroke(255, 0, 0);
  noFill();
  ellipse(x, y, 50, 50);
}

void drawCircle(float x, float y, color c) {
  strokeWeight(5);
  stroke(c);
  noFill();
  ellipse(x, y, 75, 75);
}

void drawCircle() {
  float x = random(width);
  float y = random(height);
  fill(0, 255, 0, 175);
  noStroke();
  ellipse(x, y, 100, 100);
}
