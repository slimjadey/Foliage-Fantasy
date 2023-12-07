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
    setupAudio();
}

void initializeObjects() {
  camera = new Camera(0, 0, width, height);
  ground = (new Ground(plotY, -width/2 - 10, (plotCount - 1) * plotSpacing + width/2 + 10));

  // Create plots
  for(int i = 0; i < plotCount; i++) {
    float xPosition = i * plotSpacing;
    
    float yPos = plotY - ground.getGroundHeight(xPosition) + 120;
    
    FarmPlot newPlot = new FarmPlot(xPosition, yPos, plotSize, i + 1);
    gameDrawables.add(newPlot);
    farmPlots.add(newPlot);
  }
}
