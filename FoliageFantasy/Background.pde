PImage scarecrows;
PImage topgrass;
PImage middlegrass;
PImage secondbottom;
PImage bottom;

public void setupBackground()
{
  //Create variables for the images
  scarecrows = loadImageResource("1scarecrows.png");
  topgrass = loadImageResource("2top_grass.png");
  middlegrass = loadImageResource("3second_top_grass.png");
  secondbottom = loadImageResource("4middle_grass.png");
  bottom = loadImageResource("5second_bottom.png");
}

//Parallax background in which different layers "pictures" are loaded in and move at different speeds
public void drawBackground()
{
    //variables for x position of images to move at different speeds based on camera position
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
    
    //So the images cover all of movable background
    image(scarecrows, x, 0);
    
    image(topgrass, a, 150);
    
    image(middlegrass, b, 200);
    
    image(secondbottom, c, 350);
    
    image(bottom, d, 500);
    
}
