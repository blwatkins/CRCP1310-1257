float gravity = 0.05;

Particle p1;
Particle p2;

Particle p3;

Particle p4;

void setup() {
  size(800, 800);
  println(p1);
  p1 = new Particle();
  println(p1);
  
  p2 = p1;
  println(p2);
  
  p3 = new Particle(width / 2.0, height / 2.0);
  p4 = new Particle(100, 100, color(0, 255, 255, 175));
}

void draw() {
  background(0);
  p1.render();
  p3.render();
  p4.render();
}
