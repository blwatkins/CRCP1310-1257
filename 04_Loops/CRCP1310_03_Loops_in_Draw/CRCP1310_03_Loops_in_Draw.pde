int verticalLineCount;
int totalLines;
int visibleLines;
int timerStart;
int timerDurationMillis;

void setup() {
  size(500, 500);
  verticalLineCount = (int)random(2, 50);
  totalLines = verticalLineCount;
  visibleLines = 0;
  timerStart = millis();
  timerDurationMillis = 2_000;
}

void draw() {
  background(255);
  drawVerticalLines(verticalLineCount);
  drawHorizontalLines(totalLines, visibleLines);
  
  if (isTimerDone()) {
    increaseVisibleLines();
    resetTimer();
  }
}

void mousePressed() {
  increaseVisibleLines(); 
}

void drawVerticalLines(int lineCount) {
  strokeWeight(3);
  stroke(0);
  
  for (int i = 1; i <= lineCount; i++) {
    float x = i * (width / (lineCount + 1.0));
    line(x, 0, x, height);
  }
}

void drawHorizontalLines(int totalLineCount, int visibleLineCount) {
  strokeWeight(3);
  stroke(0, 0, 255);
  
  for (int i = 1; i <= visibleLineCount; i++) {
    float y = i * (height / (totalLineCount + 1.0));
    line(0, y, width, y);
  }
}

void increaseVisibleLines() {
  visibleLines++;
  
  if (visibleLines > totalLines) {
    visibleLines = 0; 
  }
}

boolean isTimerDone() {
  return (timerStart + timerDurationMillis) < millis();
}

void resetTimer() {
  timerStart = millis();
}
