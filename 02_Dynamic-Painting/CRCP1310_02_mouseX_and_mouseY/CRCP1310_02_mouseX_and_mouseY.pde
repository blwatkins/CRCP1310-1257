void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  line(0, 0, mouseX, 500);
  line(500, 0, mouseX, 500);
  line(500, 0, 0, mouseY);
  line(500, 500, 0, mouseY);
  line(0, 0, mouseX, mouseY);
  line(500, 500, mouseX, mouseY);
}
