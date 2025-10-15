int rows;
int cols;

void setup() {
  size(500, 500);
  rows = 4;
  cols = 4;
}

void draw() {
  background(255, 200, 255);
  float w = width / (float)cols;
  float h = height / (float)rows;

  rectMode(CENTER);
  noStroke();

  for (int row = 0; row < rows; row++) {
    float s = min(w, h) * 0.75;
    float y = (row * h) + (h / 2.0);

    for (int col = 0; col < cols; col++) {
      float x = (col * w) + (w / 2.0);

      if (row % 2 == 0) {
        if (col % 3 == 0) {
          fill(0, 200, 0);
        } else if (col % 3 == 1) {
          fill(0, 0, 220);
        } else {
          fill(175, 0, 255);
        }

        rect(x, y, s, s);
      } else {

        if (col % 4 == 0) {
          fill (0);
        } else if (col % 4 == 1) {
          fill(0, 0, 220);
        } else if (col % 4 == 2) {
          fill(225);
        } else {
          fill(255);
        }

        ellipse(x, y, s, s);
      }
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    rows = (int)random(2, 50);
    cols = (int)random(2, 50);
  }
}
