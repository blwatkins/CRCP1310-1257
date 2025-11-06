float gravity = 0.05;
Particle[] particles;

ArrayList<ParticleSource> sources;

void setup() {
  size(800, 800);
  printArray(particles);
  println();
  
  int count = (int)random(25, 100);
  particles = new Particle[count];
  printArray(particles);
  println();
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(); 
  }
  
  printArray(particles);
  println();
  
  sources = new ArrayList<ParticleSource>();
}

void draw() {
  background(0);
  
  for (int i = 0; i < particles.length; i++) {
    particles[i].render(); 
  }
  
  for (int i = 0; i < sources.size(); i++) {
    ParticleSource s = sources.get(i);
    s.render();
  }
}

void mousePressed() {
  ParticleSource s = new ParticleSource(mouseX, mouseY, color(0, 255, 0, 150), 25);
  sources.add(s);
}
