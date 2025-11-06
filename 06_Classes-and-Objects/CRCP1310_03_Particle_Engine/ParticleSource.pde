class ParticleSource {
  Particle[] particles;
  
  ParticleSource(float x, float y, color fill, int particleTotal) {
    particles = new Particle[particleTotal];
    
    for (int i = 0; i < particles.length; i++) {
      particles[i] = new Particle(x, y, fill); 
    }
  }
  
  void render() {
    for (Particle p: particles) {
      p.render();
    }
  }
}
