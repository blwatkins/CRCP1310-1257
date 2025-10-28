int totalParticles;

float[] xs;
float[] ys;
float[] ds;
float[] speedXs;
float[] speedYs;
color[] colors;

int totalCircles;
float[] circleXs;
float[] circleYs;
float[] circleDs;
color[] circleColors;

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
  colors = new color[totalParticles];

  for (int i = 0; i < totalParticles; i++) {
    xs[i] = width / 2.0;
    ys[i] = 50;
    ds[i] = random(5, 25);
    speedXs[i] = random(-3, 3);
    speedYs[i] = random(-5, 1);
    colors[i] = color(255, 150);
  }
  
  totalCircles = 5;
  circleXs = new float[totalCircles];
  circleYs = new float[totalCircles];
  circleDs = new float[totalCircles];
  circleColors = new color[totalCircles];
  
  color c1 = color(255, 0, 0);
  color c2 = color(0, 0, 255);
  
  for (int i = 0; i < totalCircles; i++) {
    circleXs[i] = random(width);
    circleYs[i] = random(height);
    circleDs[i] = random(100, 250);
    float percent = (float)i / (totalCircles - 1);
    circleColors[i] = lerpColor(c1, c2, percent);
  }
}

void draw() {
  background(0);
  renderParticles();
  renderCirlces();
}

void renderParticles() {
  for (int i = 0; i < totalParticles; i++) {
    checkParticlePosition(i);
    drawParticle(i);
    moveParticle(i);
    recoverParticle(i);
  }
}

void renderCirlces() {
  for (int i = 0; i < totalCircles; i++) {
    drawCircle(i);
  }
}

void checkParticlePosition(int index) {
  for (int i = 0; i < totalCircles; i++) {
    if (isParticleTouchingCircle(index, i)) {
      colors[index] = circleColors[i];
      break;
    } else {
      colors[index] = color(255, 150);
    }
  }
}

boolean isParticleTouchingCircle(int particleIndex, int circleIndex) {
  float px = xs[particleIndex];
  float py = ys[particleIndex];
  float pd = ds[particleIndex];
  float cx = circleXs[circleIndex];
  float cy = circleYs[circleIndex];
  float cd = circleDs[circleIndex];
  float distance = dist(px, py, cx, cy);
  return (distance < ((pd / 2.0) + (cd / 2.0)));
}

void drawParticle(int index) {
  float x = xs[index];
  float y = ys[index];
  float d = ds[index];
  color c = colors[index];
  noStroke();
  fill(c);
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

void drawCircle(int index) {
  float x = circleXs[index];
  float y = circleYs[index];
  float d = circleDs[index];
  color c = circleColors[index];
  stroke(c);
  strokeWeight(4);
  noFill();
  ellipse(x, y, d, d);
}
