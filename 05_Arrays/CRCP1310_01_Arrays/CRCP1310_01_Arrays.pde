import java.util.Arrays;

float x;
int totalSquares = 5;
float[] xs;
float[] ys;
String[] names = { "bob", "bill", "pam", "pat", "joe" };

void setup() {
  size(500, 500);
  println("x = " + x);
  println("xs = " + xs);
  println();

  xs = new float[totalSquares];
  ys = new float[totalSquares];
  println("xs = " + xs);
  println("ys = " + ys);
  println();

  println("xs[0] = " + xs[0]);
  println("xs[1] = " + xs[1]);
  println("xs[2] = " + xs[2]);
  println("xs[3] = " + xs[3]);
  println("xs[4] = " + xs[4]);
  println();

  xs[0] = 100;
  xs[1] = 200;
  xs[2] = 300;
  xs[3] = 400;
  xs[4] = 250;
  printArray(xs);
  println();

  for (int i = 0; i < ys.length; i++) {
    ys[i] = random(height);
  }

  String ysString = Arrays.toString(ys);
  System.out.println(ysString);
  println();
}

void mousePressed() {
  xs = new float[6]; 
  printArray(xs);
}

void draw() {
  background(255, 0, 0);

  rectMode(CENTER);
  fill(255);
  strokeWeight(1);
  stroke(0);
  rect(xs[0], ys[0], 75, 75);
  rect(xs[1], ys[1], 75, 75);
  rect(xs[2], ys[2], 75, 75);
  rect(xs[3], ys[3], 75, 75);
  rect(xs[4], ys[4], 75, 75);

  for (int i = 0; i < totalSquares; i++) {
    noFill();
    stroke(0, 255, 0);
    strokeWeight(5);
    rect(xs[i], ys[i], 50, 50);
    
    textAlign(CENTER, CENTER);
    fill(0);
    text(names[i], xs[i], ys[i]);
  }
}
