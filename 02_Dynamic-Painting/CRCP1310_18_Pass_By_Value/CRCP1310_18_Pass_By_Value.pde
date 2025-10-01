void setup() {
  int x = 7;
  println("x = " + x);
  twoTimesSquare(x);
  println("x = " + x);
}

void twoTimesSquare(int number) {
  println("number = " + number);
  number = (int)pow(number, 2) * 2;
  println("number = " + number);
}
