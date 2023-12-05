PImage shovel;
PImage water;
PImage plant;

color dirt;
color buttonS;
color buttonW;
color buttonP;

void setupUI() {  
  //Colors
  dirt = color(155, 118, 83);
  buttonS = color(255, 0);
  buttonW = color(255, 0);
  buttonP = color(255, 0);

  //Images
  shovel = loadImageResource("Shovel.png");
  water = loadImageResource("Water.png");
  plant = loadImageResource("Plant.png");
}

void drawUI() {
  //Shovel Button Creation
  strokeWeight(8);
  stroke(0);
  fill(buttonS);
  image(shovel, 850, 25, 100, 100);
  ellipse(900, 75, 100, 100);

  //Water Button Creation
  fill(buttonW);
  image(water, 720, 40, 100, 75);
  ellipse(775, 75, 100, 100);

  //Seed Button Creation
  fill(buttonP);
  image(plant, 600, 25, 100, 100);
  ellipse(650, 75, 100, 100);
}
