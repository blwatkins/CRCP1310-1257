int totalParticles;

float[] xs;
float[] ys;
float[] ds;

float[] speedXs;
float[] speedYs;

float g;

void setup() {
  size(500, 500);
  totalParticles = 100;
  g = 0.05;

  xs = new float[totalParticles];
  ys = new float[totalParticles];
  ds = new float[totalParticles];
  speedXs = new float[totalParticles];
  speedYs = new float[totalParticles];

  for (int i = 0; i < totalParticles; i++) {
    xs[i] = width / 2.0;
    ys[i] = 50;
    ds[i] = random(5, 25);
    speedXs[i] = random(-3, 3);
    speedYs[i] = random(-5, 1);
  }
}

void draw() {
  background(0);
  renderParticles();
}

void renderParticles() {
  for (int i = 0; i < totalParticles; i++) {
    drawParticle(i);
    moveParticle(i);
    recoverParticle(i);
  }
}

void drawParticle(int index) {
  float x = xs[index];
  float y = ys[index];
  float d = ds[index];
  noStroke();
  fill(255, 150);
  ellipse(x, y, d, d);
}

void moveParticle(int index) {
  xs[index] += speedXs[index];
  ys[index] += speedYs[index];
  speedYs[index] += g;
}

void recoverParticle(int index) {
  float y = ys[index];
  float d = ds[index];
  
  if (y > height + d) {
    xs[index] = width / 2.0;
    ys[index] = 50;
    speedYs[index] = random(-5, 1);
  }
}
