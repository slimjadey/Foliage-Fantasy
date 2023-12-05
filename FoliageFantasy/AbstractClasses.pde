// Abstract class representing an object in our game with methods for drawing and updating
public abstract class Drawable 
{
  // x and y coordinates
  float x;
  float y;

  // The rotation of the object in degrees
  float rotation;

  public Drawable(float x, float y, float rotation) {
    this.x = x;
    this.y = y;
    this.rotation = rotation;
  }

  // Draws the object on the screen.
  public void draw(){};

  // Updates the object's state  
  public void update(){};
}