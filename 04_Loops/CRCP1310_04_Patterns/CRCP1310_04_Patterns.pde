int totalRects;

void setup() {
  size(500, 500);
  totalRects = 20;
}

void draw() {
  background(0);
  float w = width / (float)totalRects;
  rectMode(CENTER);

  for (int i = 0; i < totalRects; i++) {
    float h = 200;

    if (i % 4 == 0) {
      h = 100;
    } else if (i % 4 == 1) {
      h = 75;
    } else if (i % 4 == 2) {
      h = 50;
    } else {
      h = 25;
    }

    if (i % 3 == 0) {
      fill(255, 0, 0);
    } else if (i % 3 == 1) {
      fill(0, 255, 255);
    } else {
      fill(255, 255, 0);
    }

    float x = (i * w) + (w / 2.0);

    rect(x, height / 2, w, h);
  }
}

void mousePressed() {
  totalRects = (int)random(1, 500);
}
