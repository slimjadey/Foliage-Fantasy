PImage background;

public void setupBackground()
{
  background = loadImageResource("Background.png");
}

public void drawBackground()
{
    float x = -camera.x * .4;
    x %= background.width;
    image(background, x, 0);
    image(background, x + background.width, 0);
    image(background, x - background.width, 0);
}
