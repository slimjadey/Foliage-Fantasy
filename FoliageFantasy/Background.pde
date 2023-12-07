PImage background;

public void setupBackground()
{
  background = loadImageResource("Background.png");
}

public void drawBackground()
{
    float x = -camera.x * .3;
    x %= background.width / 3;
    image(background, x, 0);
    image(background, x + background.width, 0);
    image(background, x - background.width, 0);
}
