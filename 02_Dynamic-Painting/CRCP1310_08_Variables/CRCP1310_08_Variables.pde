// dataType varaiableName;

// Variable Declarations

// integer
int integerValue;
int integer_value;

// float
float floatValue;

// character
char characterValue;

// boolean
boolean booleanValue;

// String
String stringValue;

void setup() {
  size(500, 500);
  println("integerValue = " + integerValue);
  println("integer_value = " + integer_value);
  println("floatValue = " + floatValue);
  println("characterValue = " + characterValue);
  println("booleanValue = " + booleanValue);
  println("stringValue = " + stringValue);
  println();
  
  System.out.println("stringValue = " + stringValue);
  println();
  
  integerValue = 17430;
  integer_value = integerValue;
  floatValue = 4.2953108;
  characterValue = 'P';
  booleanValue = true;
  stringValue = "hello";
  
  println("integerValue = " + integerValue);
  println("integer_value = " + integer_value);
  println("floatValue = " + floatValue);
  println("characterValue = " + characterValue);
  println("booleanValue = " + booleanValue);
  println("stringValue = " + stringValue);
  println();
  
  integerValue = 60;
  
  println("integerValue = " + integerValue);
  println("integer_value = " + integer_value);
  println();
  
  float rainTotal = 1.5;
  println("rainTotal = " + rainTotal);
  println();
  
  //integerValue = "house"; // Error: Type Mismatch
}

void draw() {
  line(0, 0, width, height);
}
