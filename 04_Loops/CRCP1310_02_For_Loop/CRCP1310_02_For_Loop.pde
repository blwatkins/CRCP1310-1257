float y;
float d;

void setup() {
  size(500, 500);
  int circleCount = (int)random(2, 100);
  d = width / (float)circleCount;
  y = -d;
}

void draw() {
  background(0);

  for (float x = (d / 2.0); x < width; x = x + d) {
    strokeWeight(3);
    noFill();
    stroke(0, 200, 0);
    ellipse(x, y, d, d);
  }

  y = y + 1;

  if ((y - d) > height) {
    int circleCount = (int)random(2, 100);
    d = width / (float)circleCount;
    y = -d;
  }
}
