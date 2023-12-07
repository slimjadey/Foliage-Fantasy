
// Simple drawable for the ground
public class Ground extends Drawable {
  PShape groundShape;
  
  int segments = 100;
  
  float freq = 0.00125;
  float amplitude = 150;

  public Ground(float defaultY, int leftBound, int rightBound) {
    super(0, 0, 0);
    groundShape = createShape();
    groundShape.beginShape();
    groundShape.fill(wateredDirt);
    groundShape.strokeWeight(5);
    groundShape.stroke(104, 185, 32);
    
    // Add some bumpiness to the ground using noise
    for(int i = 0;i <= segments;i++) {
      float pos = lerp(leftBound, rightBound, i / (float)segments);
      groundShape.vertex(pos, defaultY - getGroundHeight(pos));
    }
    groundShape.vertex(rightBound, height);
    groundShape.vertex(leftBound, height);
    groundShape.endShape(CLOSE);
  }
  
  public float getGroundHeight(float pos) {
    return noise(pos * freq) * amplitude;
  }

  public void draw() {
    shape(groundShape);
  }
}

 // Drawable representing a tree, containing all of its visual and growing information
public class Tree extends Drawable{
  int maxDepth = 5;
  int age = 0;

  // Base growing stats
  int fullyGrownAge;

  // How long does watering the tree last?
  float waterDuration;

  color unwateredColor = color(142, 179, 64);

  // Base visual stats
  // It's like the "seed" that determines how the tree will look
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
  float waterTimeRemaining = 0;


  public Tree(float x, float y, float rotation) {
    super(x, y, rotation);
    randomizeBaseStats();

    // Start a little bit grown
    age = (int)(0.1 * fullyGrownAge);
  }

  private void randomizeBaseStats(){
    // Aging
    fullyGrownAge = (int)random(20000, 60000);
    waterDuration = (int)random(10000, 20000);

    // Visuals
    fullyGrownAngle = random(0f, 2 * PI);
    angleSkew = random(-2 * PI, 2 * PI);
    fullyGrownLength = (int) random(50, 250);
    sizeRatio = random(0.5f, 0.7f);
    branchCount = (int) random(2, 5);
    lowerHue = random(100, 360);
    higherHue = random(100, 360);
  }

  public void waterTree() { 
    waterTimeRemaining = waterDuration;
  }

  public boolean isWatered() {
    return waterTimeRemaining > 0;
  }
  
  public boolean isDoneGrowing(){
    return age >= fullyGrownAge;
  }

  public void update() {
    // Update the age of the tree each frame based on time elapsed
    if(isWatered()) {
      age += deltaTime;
      waterTimeRemaining -= deltaTime;
    }

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
    stroke(lowerHue, 255, 255);
    strokeWeight(2);
    // Draw the initial line
    line(0, 0, 0, -length);
    // Move to the end of that line
    translate(0, -length);
    strokeWeight(1);
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
        strokeWeight(0.5 + (maxDepth - depth) / (float)maxDepth);

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

  public void waterTree()
  {
    if(tree != null)
    {
      tree.waterTree();
    }
  }

  public void removeTree()
  {
    tree = null;
  }
  
  public boolean isMouseOnPlot() {
    PVector worldPos = camera.screenToWorld(mouseX, mouseY);
    if(worldPos.x > x - size / 2 && worldPos.x < x + size / 2 && worldPos.y > y - size / 2 && worldPos.y < y + size / 2)
    {
      return true;
    }
    
    return false;
  }

  public void draw() {
    // Draw the plot itself
    strokeWeight(0);
    fill(dirt);
    if(tree != null) {
      if (tree.isDoneGrowing()) {
        fill(doneGrowingDirt);
      }
      else if(tree.isWatered()){
        fill(wateredDirt);
      }
    }
    ellipse(0, -size * 0.125, size, size * 0.75);

    // Draw plot number
    //textSize(15);
    //fill(0);
    //text(plotNumber, 0, -50);

    // If there is a tree in the plot, draw it
    if (tree != null) {
      pushMatrix();
      translate(0, -size / 2);
      tree.draw();
      popMatrix();
    }
  }
}
