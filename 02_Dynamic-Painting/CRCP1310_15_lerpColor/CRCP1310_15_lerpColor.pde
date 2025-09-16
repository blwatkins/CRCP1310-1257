void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  
}

void mousePressed() {
  color color1 = color(#F0A383);
  color color2 = color(#2590BA);
  //float percentX = mouseX / (float)width;
  float percentX = map(mouseX, 0, width, 0, 1);
  color fillColor = lerpColor(color1, color2, percentX);
  fill(fillColor);
  noStroke();
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);
}
