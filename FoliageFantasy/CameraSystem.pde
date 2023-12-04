public class Camera extends Drawable {
  public float viewportScale;
  public float width;
  public float height;

  public Camera(float x, float y, float width, float height) {
    super(x, y, 0);
    viewportScale = 1;
    this.width = width;
    this.height = height;
  }

  // Push the camera matrix, so all objects drawn afterwards are affected by the camera
  public void pushCameraMatrix() {
    pushMatrix();
    rotate(-rotation);
    scale(1 / viewportScale);
    translate(-x + viewportScale * width/2.0, -y + viewportScale * height/2.0);
  }

  public void popCameraMatrix() {
    popMatrix();
  }

  public PVector screenToWorld(int screenX, int screenY) {
    // Converts window coordinates to the world coordinates based on camera position 
    PVector worldPos = new PVector();
    worldPos.x = viewportScale * (screenX - width/2.0) + x;
    worldPos.y = viewportScale * (screenY - height/2.0) + y;
    return worldPos;
  }

  public boolean isOffScreen(float drawableX) {
    // Arbitrary value of 800 (Most drawables in the game won't be bigger than that, probably)
    if(abs(drawableX - x) > 800) {
      return true;
    }
    return false;
  }
}
