void setup() {
  size(500, 500);
}

void draw() {
  
}

void mouseDragged() {
  float speed = mouseSpeed();
  strokeWeight(speed);
  line(pmouseX, pmouseY, mouseX, mouseY); 
}

float mouseSpeed() {
  float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
  float speed = constrain(distance, 1, 20);
  return speed;
}
