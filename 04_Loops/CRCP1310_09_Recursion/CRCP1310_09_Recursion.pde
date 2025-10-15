color c1 = color(255, 0, 0);
color c2 = color(0, 0, 255);

void setup() {
  size(500, 500);
}

void draw() {
  recursiveCircles(
    width / 2.0,
    height / 2.0,
    150);
}

void recursiveCircles(float x, float y, float d) {
  // base case
  boolean isOnScreenX = x >= 0 && x <= width;
  boolean isOnScreenY = y >= 0 && y <= height;
  boolean hasMinDiam = d > 10;
  
  if (isOnScreenX && isOnScreenY && hasMinDiam) {
    strokeWeight(3);
    float percentage = x / width;
    color stroke = lerpColor(c1, c2, percentage);
    stroke(stroke);
    noFill();
    ellipse(x, y, d, d);
    
    float theta = 0;
    for (int i = 0; i < 2; i++) {
      float cx = x + (cos(theta) * (d / 2.0));
      float cy = y + (sin(theta) * (d / 2.0));
      
      if (x > width / 2.0 && cx > x) {
        recursiveCircles(cx, cy, d * 0.8);
      } else if (x < width / 2.0 && cx < x) {
        recursiveCircles(cx, cy, d * 0.8);
      } else if (x == width / 2.0) {
        recursiveCircles(cx, cy, d * 0.8);
      }
     
      theta += TWO_PI / 2;
    }
  }
}
