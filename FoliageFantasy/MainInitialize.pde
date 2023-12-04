Camera camera;
ArrayList<GameDrawable> gameDrawables = new ArrayList<GameDrawable>();
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

// Time
int currentTime = 0;
int previousTime = 0;
int deltaTime = 0;

void setup()
{
    size(800,800);
    blendMode(BLEND);
    initializeObjects();
    UISetup();
}

void initializeObjects()
{
    camera = new Camera(0, 0, 800, 800, 0);
    gameObjects.add(camera);
    gameDrawables.add(new GridVisual(100, 25, 0,0,0));
}


