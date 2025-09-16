void setup() {
  size(500, 500);
  background(255, 255, 0);
}

void draw() {
  line(pmouseX, pmouseY, mouseX, mouseY);
}
