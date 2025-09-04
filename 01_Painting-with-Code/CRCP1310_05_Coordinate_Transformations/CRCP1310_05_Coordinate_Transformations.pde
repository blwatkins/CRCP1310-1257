size(500, 500);

// origin point
strokeWeight(10);
stroke(255, 0, 0);
point(0, 0);

pushMatrix();
translate(250, 150);

// origin point
strokeWeight(10);
stroke(255, 0, 0);
point(0, 0);

pushMatrix();
rotate(radians(45));
strokeWeight(1);
stroke(0);
noFill();
rect(0, 0, 100, 50);
popMatrix();

pushMatrix();
rotate(radians(-45));
rectMode(CENTER);
rect(0, 0, 100, 50);
popMatrix();

popMatrix();

pushMatrix();
translate(100, 300);

// origin point
strokeWeight(10);
stroke(255, 0, 0);
point(0, 0);

rotate(radians(15));
strokeWeight(1);
stroke(0);
ellipse(0, 0, 25, 100);
popMatrix();

pushMatrix();
translate(400, 400);

// origin point
strokeWeight(10);
stroke(255, 0, 0);
point(0, 0);

rotate(radians(-15));
strokeWeight(1);
stroke(0);
ellipse(0, 0, 25, 100);
popMatrix();
