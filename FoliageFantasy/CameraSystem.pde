public class Camera extends GameObject
{
    public float viewportScale;
    public float width;
    public float height;

    public Camera(float x, float y, float width, float height, float rotation)
    {
        super(x, y, rotation);
        viewportScale = 1;
        this.width = width;
        this.height = height;
    }

    public void pushCameraMatrix()
    {
        pushMatrix();
        rotate(-rotation);
        scale(1 / viewportScale);
        translate(-x + viewportScale * width/2.0, -y + viewportScale * height/2.0);
    }

    public void popCameraMatrix()
    {
        popMatrix();
    }

    public PVector screenToWorld(int screenX, int screenY)
    {
        PVector worldPos = new PVector();
        worldPos.x = viewportScale * (screenX - width/2.0) + x;
        worldPos.y = viewportScale * (screenY - height/2.0) + y;
        return worldPos;
    }
}
