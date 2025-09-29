color color1;
color color2;
color color3;
color color4;

void setup() {
  size(500, 500);
  color1 = color(255, 0, 0);
  color2 = color(0, 255, 0);
  color3 = color(0, 0, 255);
  color4 = getRandomColor();
}

void draw() {
  if (mouseY < (height / 4.0)) {
    background(color1);
  } else if (mouseY < (2.0 * (height / 4.0))) {
    background(color2);
  } else if (mouseY < (3.0 * (height / 4.0))) {
    background(color3);
  } else {
    background(color4);
  }

  noStroke();
  fill(color1);
  rect(0, 0, 25, height / 4.0);

  fill(color2);
  rect(0, height / 4.0, 25, height / 4.0);

  fill(color3);
  rect(0, 2.0 * (height / 4.0), 25, height / 4.0);

  fill(color4);
  rect(0, 3.0 * (height / 4.0), 25, height / 4.0);
}

void keyPressed() {
  if (key == 'r') {
    color1 = getRandomColor(); 
  } else if (key == 'g') {
    color2 = getRandomColor();
  } else if (key == 'b') {
   color3 = getRandomColor(); 
  }
}

color getRandomColor() {
  int r = (int)random(255);
  int g = (int)random(255);
  int b = (int)random(255);
  return color(r, g, b);
}
