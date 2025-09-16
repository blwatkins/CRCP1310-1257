void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  strokeWeight(10);
  ellipse(250, 250, 200, 200);
}

void keyPressed() {
  background(0);
  stroke(0);
}

void mouseDragged() {
  stroke(0, mouseX, mouseY);
  strokeWeight(2);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
