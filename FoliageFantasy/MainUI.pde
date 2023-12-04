PImage shovel;
PImage water;
PImage plant;

color dirt;
color buttonS;
color buttonW;
color buttonP;

void UISetup() {
  //Colors
  dirt = color(155, 118, 83);
  buttonS = color(255, 0);
  buttonW = color(255, 0);
  buttonP = color(255, 0);

  //Images
  shovel = loadImageResource("Shovel.jpg");
  water = loadImageResource("Water.jpg");
  plant = loadImageResource("Plant.jpg");
}

void drawUI() {
  //Dirt Plots
  stroke(255);
  fill(dirt);
  rect(125, 350, 100, 25);
  rect(325, 350, 100, 25);
  rect(525, 350, 100, 25);
  rect(125, 550, 100, 25);
  rect(325, 550, 100, 25);
  rect(525, 550, 100, 25);

  //Shovel Button Creation
  strokeWeight(8);
  stroke(0);
  fill(buttonS);
  image(shovel, 600, 25, 100, 100);
  ellipse(650, 75, 100, 100);

  //Water Button Creation
  fill(buttonW);
  image(water, 470, 40, 100, 75);
  ellipse(525, 75, 100, 100);

  //Seed Button Creation
  fill(buttonP);
  image(plant, 350, 25, 100, 100);
  ellipse(400, 75, 100, 100);
}


