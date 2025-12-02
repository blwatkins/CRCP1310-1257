void highScoreScreen() {
  background(255);
  fill(0);
  textFont(courierFont, 64);
  textAlign(CENTER, TOP);
  text("High Scores", width / 2.0, 50);

  textSize(32);
  textAlign(LEFT, CENTER);
  int rowCount = 0;

  for (TableRow row : highScoresTable.rows()) {
    String name = row.getString("name");
    int score = row.getInt("score");
    text(name + ": " + score, 100, (rowCount * (height / 10)) + 200);
    rowCount++;

    if (rowCount >= maximumHighScoreCount) {
      break;
    }
  }
}

void updateHighScores(int score, String name) {
  int rowIndex = getScoreRowIndex(score);

  if (rowIndex >= 0 && rowIndex < maximumHighScoreCount) {
    Table updatedScoresTable = new Table();

    for (int i = 0; i < maximumHighScoreCount; i++) {
      TableRow row = updatedScoresTable.addRow();

      if (i < rowIndex) {
      } else if (i == rowIndex) {
      } else if (i > rowIndex) {
      }
    }
  }
}

int getScoreRowIndex(int score) {
  int totalRows = highScoresTable.getRowCount();
  int rowIndex = -1;

  for (int i = 0; i < totalRows; i++) {
    int rowScore = highScoresTable.getInt(i, "score");

    if (score > rowScore) {
      rowIndex = i;
      break;
    }
  }

  if (rowIndex == -1) {
    rowIndex = totalRows;
  }

  return rowIndex;
}
