public abstract class GameObject
{
    public float x;
    public float y;
    public float rotation;
    
    public GameObject(float x, float y, float rotation)
    {
        this.x = x;
        this.y = y;
        this.rotation = rotation;
    }

    public void destroy()
    {
        gameObjects.remove(this);
    }

    public void update()
    {
        // do nothing
    }
}

public abstract class GameDrawable extends GameObject
{
    public GameDrawable(float x, float y, float rotation)
    {
        super(x,y,rotation);
    }

    public abstract void draw();

    public void destroy()
    {
        super.destroy();
        gameDrawables.remove(this);
    }
}

public class GridVisual extends GameDrawable
{
    float cellSize = 0;
    int count;

    public GridVisual(float cellSize, int count, float x, float y, float rotation)
    {
        super(x,y,rotation);
        this.cellSize = cellSize;
        this.count = count;
    }

    public void draw()
    {
        stroke(color(0,0,0,25));
        for(int column = -count;column < count;column++)
        {
            line(column * cellSize, -count * cellSize, column * cellSize, count * cellSize);
        }
        for(int row = -count;row < count;row++)
        {
            line(-count * cellSize, row * cellSize, count * cellSize, row * cellSize);
        }
    }
}