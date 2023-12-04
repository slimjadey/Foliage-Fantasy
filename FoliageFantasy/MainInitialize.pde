Camera camera;
ArrayList<Drawable> gameDrawables = new ArrayList<Drawable>();

// Current time, in milliseconds, since the program started
int currentTime = 0;

// The time, in milliseconds, of the previous draw
int previousTime = 0;

void setup()
{
    size(800,800);
    blendMode(BLEND);
    initializeObjects();
    setupUI();
}

void setup() {
  size(800, 800);
  initializeObjects();
  UISetup();
}

void initializeObjects() {
  camera = new Camera(0, 0, 800, 800);
  gameDrawables.add(new GridVisual(100, 25, 0, 0));

  // Create plots
  int plotCount = 1000;
  int plotSpacing = 400;
  int plotSize = 300;
  float plotY = 400;
  for(int i = 0; i < plotCount; i++) {
    float xPosition = (i - plotCount / 2.0) * plotSpacing;
    FarmPlot newPlot = new FarmPlot(xPosition, plotY, plotSize);  
    newPlot.plantTree();
    gameDrawables.add(newPlot);
  }
}
