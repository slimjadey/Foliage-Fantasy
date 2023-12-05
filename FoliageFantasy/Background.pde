PImage background;

public void setupBackground()
{
  background = loadImageResource("Background.png");
}

public void drawBackground()
{
    float x = -camera.x;
    x %= width;
    image(background, x, 0);
    image(background, x + background.width, 0);
    image(background, x - background.width, 0);
}
