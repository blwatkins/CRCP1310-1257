color backgroundColor;

void setup() {
  size(500, 500);
  backgroundColor = color(0);
}

void draw() {
  background(backgroundColor);

  if (mouseX > (width / 2.0)) {
    noFill();
    stroke(220, 0, 0);
    strokeWeight(3);
    rectMode(CENTER);
    rect(mouseX, mouseY, 150, 50);
  }
  
  if (mouseY < height / 2.0) {
    fill(255, 0, 0); 
  } else {
    fill(0, 0, 255); 
  }
  
  noStroke();
  ellipse(width / 4.0, height / 2.0, 100, 100);
  
  fill(255);
  
  if (mouseX < (width / 2.0)) {
    fill(0, 255, 255); 
  } else {
    fill(255, 0, 255); 
  }
  
  noStroke();
  rectMode(CENTER);
  rect(3.0 * (width / 4.0), height / 2.0, 100, 100);
}

void keyPressed() {
  println("key = " + key);

  if (key == 'a') {
    backgroundColor = getRandomBlue();
  } else {
    backgroundColor = color(0); 
  }
}

color getRandomBlue() {
  int red = (int)random(75);
  int green = (int)random(75);
  int blue = (int)random(100, 255);
  return color(red, green, blue);
}
