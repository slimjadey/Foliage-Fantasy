
public class Tree extends GameDrawable
{
    float theta = 0;
    float length = 0;

    public Tree(float x, float y, float rotation)
    {
        super(x,y,rotation);
    }
  
    public void draw()
    {
        fill(0);
        stroke(0);
        theta += deltaTime * 0.0001f;
        length += deltaTime * 0.015f;
        // Draw a line 120 pixels
        line(0,0,0,-length);
        // Move to the end of that line
        translate(0,-length);
        // Start the recursive branching!
        branch(length);
    }

    void branch(float h) 
    {
        // Each branch will be 2/3rds the size of the previous one
        h *= 0.66;
        
        // All recursive functions must have an exit condition!!!!
        // Here, ours is when the length of the branch is 2 pixels or less
        if (h > 2) 
        {
            pushMatrix();    // Save the current state of transformation (i.e. where are we now)
            rotate(theta);   // Rotate by theta
            line(0, 0, 0, -h);  // Draw the branch
            translate(0, -h); // Move to the end of the branch
            branch(h);       // Ok, now call myself to draw two new branches!!
            popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
            
            // Repeat the same thing, only branch off to the "left" this time!
            pushMatrix();
            rotate(-theta);
            line(0, 0, 0, -h);
            translate(0, -h);
            branch(h);
            popMatrix();
        }
    }
}
