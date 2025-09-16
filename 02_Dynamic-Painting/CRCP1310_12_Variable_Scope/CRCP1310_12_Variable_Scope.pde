float x;
float y;

void setup() {
  size(500, 500);
  x = 250;
  y = 250;
}

void draw() {
  background(0);
  design(x, y, 50, color(255, 0, 0));
  
  design(400, 250, 50, color(0, 255, 0));
  
  x = x + 1;
  y = y + 1;
  
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
}

void design(float x, float y, float s, color c) {
  stroke(c);
  noFill();
  line(x - s, y - s, x + s, y + s);
  line(x + s, y - s, x - s, y + s);
  ellipse(x, y, s, s);
  
  float x2 = x;
  float y2 = y - (s * 1.5);
  line(x2 - s, y2 - s, x2 + s, y2 + s);
  line(x2 + s, y2 - s, x2 - s, y2 + s);
  ellipse(x2, y2, s, s);
  
  float x3 = x;
  float y3 = y + (s * 1.5);
  line(x3 - s, y3 - s, x3 + s, y3 + s);
  line(x3 + s, y3 - s, x3 - s, y3 + s);
  ellipse(x3, y3, s, s);
}
