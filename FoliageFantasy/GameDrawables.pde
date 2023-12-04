
// Simple drawable for a grid
public class GridVisual extends Drawable{
  // Size of each grid cell
  float cellSize = 0;

  // The number of cells to draw in each direction
  int count;

  public GridVisual(float cellSize, int count, float x, float y) {
    super(x, y, 0);
    this.cellSize = cellSize;
    this.count = count;
  }

  public void draw() {
    strokeWeight(1);
    stroke(color(0, 0, 0, 25));
    for (int column = -count; column < count; column++) {
      line(column * cellSize, -count * cellSize, column * cellSize, count * cellSize);
    }
    for (int row = -count; row < count; row++) {
      line(-count * cellSize, row * cellSize, count * cellSize, row * cellSize);
    }
  }
}

 // Drawable representing a tree, containing all of its visual and growing information
public class Tree extends Drawable{
  int maxDepth = 5;
  int age = 0;

  // Base growing stats
  int fullyGrownAge = 30000;

  // Base visual stats
  float fullyGrownAngle;
  int fullyGrownLength;
  float sizeRatio;
  int branchCount;
  float angleSkew;

  float lowerHue;
  float higherHue;

  // State 
  float theta;
  float length;

  public Tree(float x, float y, float rotation) {
    super(x, y, rotation);
    randomizeBaseStats();
  }

  private void randomizeBaseStats()
  {
    fullyGrownAngle = random(0f, 2 * PI);
    angleSkew = random(-2 * PI, 2 * PI);
    fullyGrownLength = (int) random(25, 200);
    sizeRatio = random(0.5f, 0.7f);
    branchCount = (int) random(2, 5);
    lowerHue = random(0, 360);
    higherHue = random(0, 360);
  }

  public void update() {
    // Update the age of the tree each frame based on time elapsed
    age += deltaTime;

    // Tree can't grow older than its fully grown age
    age = constrain(age, 0, fullyGrownAge);

    // Ratio of the current age to the fully grown age (between 0 and 1)
    float ageRatio = (float) age / fullyGrownAge;

    // Calculate the visual state based on the age ratio
    theta = lerp(0, fullyGrownAngle, ageRatio);
    length = lerp(0, fullyGrownLength, ageRatio);
  }

  public void draw() {
    colorMode(HSB, 360);
    fill(0);
    stroke(0);
    strokeWeight(1);
    // Draw a line 120 pixels
    line(0, 0, 0, -length);
    // Move to the end of that line
    translate(0, -length);
    // Start the recursive branching!
    branch(length, 0);
    colorMode(RGB, 255);
  }

  void branch(float h, int depth) {
    if (depth > maxDepth) {
      return;
    }

    // Each branch will be smaller than the previous one
    h *= sizeRatio;

    // If the length of the branch is less than 2 pixels, then skip drawing
    if (h >= 2) {
      for (int i = 0; i < branchCount; i++) {
        pushMatrix();
        stroke(lerp(lowerHue, higherHue, depth / (maxDepth + 1.0)), 255, 255);

        // Calculate the angle of each branch
        float angle = theta / (branchCount - 1.0) * i;
        angle -= theta / 2.0;

        // Rotate the branch
        rotate(angle + angleSkew); 

        // Draw the branch
        line(0, 0, 0, -h);

        // Move to the end of the branch
        translate(0, -h);

        // Recursive call to begin drawing the attached branches
        branch(h, depth + 1);

        popMatrix();
      }
    }
  }
}

// A farm plot
public class FarmPlot extends Drawable{
  // The tree that is currently growing in this plot
  Tree tree;

  float size;

  int plotNumber;

  public FarmPlot(float x, float y, float size, int plotNumber) {
    super(x, y, 0);
    this.size = size;
    this.plotNumber = plotNumber;
  }

  public void update() {
    // If there is a tree in this plot, then update the tree
    if(tree != null)
    {
      tree.update();
    }
  }

  public void plantTree()
  {
    if(tree == null)
    {
     tree = new Tree(x, y, random(-0.1, 0.1));
    }
  }

  public void removeTree()
  {
    tree = null;
  }

  public void draw() {
    // Draw the plot
    strokeWeight(1);
    stroke(color(0, 0, 0, 25));
    fill(dirt);
    rect(-size / 2, -size / 2, size, size);

    // Number
    textSize(15);
    fill(0);
    text(plotNumber, 0, -50);

    // If there is a tree, draw it
    if (tree != null) {
      pushMatrix();
      translate(0, -size / 2);
      tree.draw();
      popMatrix();
    }
  }
}