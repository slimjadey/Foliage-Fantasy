int maxDepth = 5;

public class Tree extends GameDrawable
{
    int age;

    // Base stats
    int fullyGrownAge;
    float fullyGrownAngle;
    int fullyGrownLength;
    float sizeRatio;
    int branchCount;
    float angleSkew;

    // State 
    float theta = 0;
    float length = 0;

    public Tree(float x, float y, float rotation)
    {
        super(x,y,rotation);

        age = 0;
        fullyGrownAngle = random(0f, 2 * PI);
        angleSkew = random(-2 * PI, 2 * PI);
        fullyGrownAge = 5000;
        fullyGrownLength = (int)random(25, 200);
        sizeRatio = random(0.5f, 0.7f);
        branchCount = (int)random(2, 5);
    }

    public void update()
    {
        age += deltaTime;
        age = constrain(age, 0, fullyGrownAge);
        float ratio = (float)age / fullyGrownAge;

        theta = lerp(0, fullyGrownAngle, ratio);
        length = lerp(0, fullyGrownLength, ratio);
    }
  
    public void draw()
    {
        colorMode(HSB, 360);
        fill(0);
        stroke(0);
        // Draw a line 120 pixels
        line(0,0,0,-length);
        // Move to the end of that line
        translate(0,-length);
        // Start the recursive branching!
        branch(length, 0);
        colorMode(RGB, 255);
    }

    void branch(float h, int depth) 
    {
        if(depth > maxDepth)
        {
            return;
        }

        // Each branch will be 2/3rds the size of the previous one
        h *= sizeRatio;
        
        // All recursive functions must have an exit condition!!!!
        // Here, ours is when the length of the branch is 2 pixels or less
        if (h >= 2) 
        {
            for(int i = 0;i < branchCount;i++)
            {
                pushMatrix();
                stroke(lerp(130, 220, depth / (maxDepth + 1.0)), 255, 255);

                float angle = theta / (branchCount - 1.0) * i;
                angle -= theta / 2.0;
                rotate(angle + angleSkew);   // Rotate based on branch count

                line(0, 0, 0, -h);  // Draw the branch
                translate(0, -h); // Move to the end of the branch

                branch(h, depth + 1);       // Ok, now call myself to draw two new branches!!

                popMatrix();
            }
        }
    }
}
