PImage background;

public void setupBackground()
{
  background = loadImageResource("Background.png");
}

public void drawBackground()
{
    float cameraX = camera.x;
    image(background, -cameraX * 0.5, 0);
}