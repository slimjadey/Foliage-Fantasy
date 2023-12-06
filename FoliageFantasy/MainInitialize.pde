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
SoundFile music;

float volume = .5;

int plotCount = 25;
int plotSpacing = 500;
int plotSize = 300;
float plotY = 300;

void setup()
{
    size(1000,750);
    blendMode(BLEND);
    frameRate(45);
    initializeObjects();
    setupUI();
    setupBackground();
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
  //gameDrawables.add(new GridVisual(100, 25, 0, 0));

  // Create plots
  for(int i = 0; i < plotCount; i++) {
    float xPosition = i * plotSpacing;
    
    // Add some variation in the positioning to make it seem more organic
    float noiseFrequency = 0.025;
    float yVariation = noise(xPosition * noiseFrequency) * 100;
    
    FarmPlot newPlot = new FarmPlot(xPosition, plotY + yVariation, plotSize, i + 1);  
    gameDrawables.add(newPlot);
    farmPlots.add(newPlot);
  }
}
