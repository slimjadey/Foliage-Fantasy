//PImage background;
PImage scarecrows;
PImage topgrass;
PImage middlegrass;
PImage secondbottom;
PImage bottom;

public void setupBackground()
{
  //background = loadImageResource("Background.png");
  scarecrows = loadImageResource("1scarecrows.png");
  topgrass = loadImageResource("2top_grass.png");
  middlegrass = loadImageResource("3second_top_grass.png");
  secondbottom = loadImageResource("4middle_grass.png");
  bottom = loadImageResource("5second_bottom.png");
}

public void drawBackground()
{
    float x = -camera.x * .2;
    float a = -camera.x * .2;
    float b = -camera.x * .3;
    float c = -camera.x * .5;
    float d = -camera.x * .9;
    
    x %= scarecrows.width / 3;
    a %= topgrass.width / 3;
    b %= middlegrass.width / 3;
    c %= secondbottom.width / 3;
    d %= bottom.width / 3;
    
    //image(background, x, 0);
    //image(background, x + background.width, 0);
    //image(background, x - background.width, 0);
    
    image(scarecrows, x, 0);
    
    image(topgrass, a, 150);
    
    image(middlegrass, b, 200);
    
    image(secondbottom, c, 350);
    
    image(bottom, d, 500);
    
}
