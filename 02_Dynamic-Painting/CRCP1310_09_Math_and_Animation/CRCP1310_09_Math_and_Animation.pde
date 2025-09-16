float x;
float y;

void setup() {
  size(500, 500);
  x = 0;
  y = 0;
}

void draw() {
  background(0, 0, 180);
  strokeWeight(5);
  noFill();
  stroke(0);
  ellipse(x, 250, 50, 50);
  
  stroke(255, 0, 0);
  ellipse(250, y, 50, 50);
  
  stroke(0, 255, 0);
  ellipse(x, y, 50, 50);
  
  x = x + 2;
  y = y + 3;
}

void keyPressed() {
  x = 0;
  y = height / 2.0;
}
