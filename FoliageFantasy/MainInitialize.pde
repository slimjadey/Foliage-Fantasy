Camera camera;
ArrayList<Drawable> gameDrawables = new ArrayList<Drawable>();
ArrayList<FarmPlot> farmPlots = new ArrayList<FarmPlot>();

// Current time, in milliseconds, since the program started
int currentTime = 0;

// The time, in milliseconds, of the previous draw
int previousTime = 0;

// The time, in milliseconds, elapsed since the previous draw
int deltaTime = 0;

import processing.sound.*;
SoundFile shovelEffect;
SoundFile waterEffect;
SoundFile plantGrown;
SoundFile pressButton;
SoundFile growing;

void setup()
{
    size(1000,750);
    blendMode(BLEND);
    initializeObjects();
    setupUI();
    setupBackground();
    shovelEffect = new SoundFile(this, "A6-shoveldig.wav");
    waterEffect = new SoundFile(this, "A6-waterpour.wav");
    plantGrown = new SoundFile(this, "A6-plantgrown.wav");
    pressButton = new SoundFile(this, "A6-buttonpress.wav");
    growing = new SoundFile(this, "A6-growing noise_2.wav");
}

void initializeObjects() {
  camera = new Camera(0, 0, 800, 800);
  //gameDrawables.add(new GridVisual(100, 25, 0, 0));

  // Create plots
  int plotCount = 1000;
  int plotSpacing = 400;
  int plotSize = 300;
  float plotY = 400;
  for(int i = 0; i < plotCount; i++) {
    float xPosition = (i - plotCount / 2.0) * plotSpacing;
    FarmPlot newPlot = new FarmPlot(xPosition, plotY, plotSize, i + 1);  
    newPlot.plantTree();
    newPlot.waterTree();
    gameDrawables.add(newPlot);
    farmPlots.add(newPlot);
  }
}
