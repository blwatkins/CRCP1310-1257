void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  redOval();
}

void mouseDragged() {
  yellowSquare();
}

void keyPressed() {
  background(0); 
}

void redOval() {
  noFill();
  stroke(255, 0, 0);
  strokeWeight(6);
  ellipse(250, 250, 100, 150);
}

void yellowSquare() {
  noFill();
  stroke(255, 255, 0);
  strokeWeight(3);
  rectMode(CENTER);
  rect(mouseX, mouseY, 25, 25);
}
