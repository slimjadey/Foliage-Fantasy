PImage background;

public void setupBackground()
{
  background = loadImageResource("Background.png");
}

public void drawBackground()
{
    image(background, 0, 0);
}