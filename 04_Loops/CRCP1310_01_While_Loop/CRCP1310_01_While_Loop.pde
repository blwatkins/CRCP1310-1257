void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  float x = 25;
  
  while(x < width) {
    ellipse(x, height / 2.0, 25, 25);
    x = x + 25;
  }
}
