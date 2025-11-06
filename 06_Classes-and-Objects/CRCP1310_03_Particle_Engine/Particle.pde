class Particle {
  PVector position;
  PVector origin;
  PVector speed;
  
  float diameter;
  color fill;
  
  Particle() {
    position = new PVector(random(width), random(height));
    origin = position.copy();
    speed = new PVector(0, random(3));
    diameter = 10;
    fill = color(255, 0, 0, 175);
  }
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    origin = position.copy();
    speed = new PVector(0, 0);
    this.diameter = random(5, 50);
    this.fill = color(0, 0, 255, 175);
  }
  
  Particle(float _x, float _y, color _fill) {
    position = new PVector(_x, _y);
    origin = position.copy();
    speed = new PVector(random(-3, 3), random(-3, 3));
    diameter = random(5, 25);
    fill = _fill;
  }
  
  void render() {
    display();
    move();
    recover();
  }
  
  void display() {
    noStroke();
    fill(fill);
    ellipse(position.x, position.y, diameter, diameter);
  }
  
  void move() {
    position.add(speed);
    speed.y += gravity;
  }
  
  void recover() {
    if (position.y > height + diameter) {
      position.set(origin);
      speed = new PVector(random(-3, 3), random(-3, 3));
    }
  }
}
