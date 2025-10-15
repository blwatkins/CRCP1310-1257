void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  polygon(
    width / 2.0,
    height / 2.0,
    75,
    5,
    color(0, 0, 255));
  star(
    width / 2.0,
    height / 2.0 + 120,
    50,
    5,
    color(175, 20, 220));
}

void mousePressed() {
  int type = (int)random(2);
  float radius = random(5, 75);
  int sides = (int)random(-3, 13);
  int green = (int)random(255);

  if (type == 0) {
    polygon(
      mouseX,
      mouseY,
      radius,
      sides,
      color(0, green, 0));
  } else {
    star(
      mouseX,
      mouseY,
      radius,
      sides,
      color(0, green, 0, 150));
  }
}

void polygon(
  float x,
  float y,
  float radius,
  int sides,
  color stroke)
{
  if (sides >= 3) {
    float theta = 0;

    pushMatrix();
    translate(x, y);
    noFill();
    strokeWeight(3);
    stroke(stroke);

    beginShape();

    for (int i = 0; i < sides; i++) {
      float vx = cos(theta) * radius;
      float vy = sin(theta) * radius;
      vertex(vx, vy);
      theta += TWO_PI / sides;
    }

    endShape(CLOSE);

    popMatrix();
  } else {
    rectMode(CENTER);
    fill(255, 0, 0);
    noStroke();
    rect(x, y, radius * 2, radius * 2);
  }
}

void star(
  float x,
  float y,
  float radius,
  int points,
  color fill) {
  if (points >= 3) {
    float theta = 0;

    pushMatrix();
    translate(x, y);

    noStroke();
    fill(fill);

    beginShape();

    for (int i = 0; i < points * 2; i++) {
      float vr = radius;

      if (i % 2 == 0) {
        vr = radius / 2;
      }

      float vx = cos(theta) * vr;
      float vy = sin(theta) * vr;
      vertex(vx, vy);
      theta += (TWO_PI / (points * 2));
    }

    endShape(CLOSE);
    popMatrix();
  } else {
    rectMode(CENTER);
    stroke(255, 0, 0);
    strokeWeight(5);
    noFill();
    rect(x, y, radius * 2, radius * 2);
  }
}
