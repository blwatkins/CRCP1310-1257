void setup() {
  size(500, 500);
  background(0, 200, 180);
}

void draw() {
  
}

void mousePressed() {
  stroke(constrain(mouseX, 0, 255), 0, 0);
  strokeWeight(3);
  noFill();
  ellipse(mouseX, mouseY, 50, 50);
  println(constrain(mouseX, 0, 255));
}
