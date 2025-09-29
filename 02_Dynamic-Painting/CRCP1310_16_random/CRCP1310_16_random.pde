float x;
float y;
float s;

color color1;
color color2;

void setup() {
  size(500, 500);
  x = random(width);
  y = random(height);
  s = random(25, 150);
  background(255);
  
  color1 = randomColor();
  color2 = randomColor();
}

void draw() {
  fill(255);
  stroke(0);
  strokeWeight(1);
  
  ellipse(x, y, s, s);
}

void keyPressed() {
  float x = random(width);
  float y = random(height);
  float s = random(25, 150);
  rectMode(CENTER);
  noStroke();
  fill(randomColor());
  rect(x, y, s, s);
  
  color1 = randomColor();
  color2 = randomColor();
}

void mouseDragged() {
  gradientEllipse(); 
}

void gradientEllipse() {
  float percent = mouseX / (float)width;
  println("mouseX percent = " + percent);
  println();
  
  color c = lerpColor(color1, color2, percent);
  stroke(c);
  strokeWeight(5);
  noFill();
  ellipse(mouseX, mouseY, 50, 50);
}

color randomColor() {
  int red = (int)random(255);
  println("red = " + red);
  int green = (int)random(255);
  println("green = " + green);
  int blue = (int)random(255);
  println("blue = " + blue);
  int alpha = (int)random(75, 225);
  println("alpha = " + alpha);
  println();
  return color(red, green, blue, alpha);
}
