Camera camera;
Ground ground;

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
SoundFile music;

float volume = .5;

int plotCount = 20;
int plotSpacing = 550;
int plotSize = 300;
float plotY = 300;

color dirt;
color wateredDirt;
color doneGrowingDirt;

void setup()
{
    size(1000,750);
    blendMode(BLEND);
    frameRate(45);
    setupUI();
    setupBackground();
    initializeObjects();
    
    shovelEffect = new SoundFile(this, "A6-shoveldig.wav");
    waterEffect = new SoundFile(this, "A6-waterpour.wav");
    plantGrown = new SoundFile(this, "A6-plantgrown.wav");
    pressButton = new SoundFile(this, "A6-buttonpress.wav");
    growing = new SoundFile(this, "A6-growing noise_2.wav");
    music = new SoundFile(this, "HappyMusic.mp3");
    music.amp(.1);
    music.loop();
}

void initializeObjects() {
  camera = new Camera(0, 0, width, height);
  ground = (new Ground(plotY, -width/2, (plotCount - 1) * plotSpacing + width/2));

  // Create plots
  for(int i = 0; i < plotCount; i++) {
    float xPosition = i * plotSpacing;
    
    float yPos = plotY - ground.getGroundHeight(xPosition) + 120;
    
    FarmPlot newPlot = new FarmPlot(xPosition, yPos, plotSize, i + 1);  
    gameDrawables.add(newPlot);
    farmPlots.add(newPlot);
  }
}
