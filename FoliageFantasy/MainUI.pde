PImage shovel;
PImage water;
PImage plant;

color dirt;
color wateredDirt;
color buttonS;
color buttonW;
color buttonP;

void setupUI() {  
  //Colors
  dirt = color(155, 118, 83);
  wateredDirt = color(97, 70, 40);
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
  
  // Highlight the button of the currently selected tool
  if(mode == 3) {
    buttonS = color(186, 126, 69, 125);
  } else {
    buttonS = color(255, 0);
  }
  
  if(mode == 2) {
    buttonW = color(104, 224, 242, 125);
  } else {
    buttonW = color(255, 0);
  }
  
  if(mode == 1) {
    buttonP = color(104, 242, 106, 125);
  } else {
    buttonP = color(255, 0);
  }
}
