void setup() {
  size(800, 500);
}

void draw() {
  background(0);
  noFill();
  strokeWeight(10);
  float colorX = map(mouseX, 0, width, 0, 255);
  float colorY = map(mouseY, 0, height, 0, 255);
  stroke(colorX, 0, colorY);
  ellipse(mouseX, mouseY, 100, 100);
  
  stroke(0, colorX, colorY);
  ellipse(mouseX, mouseY, 50, 50);
}
