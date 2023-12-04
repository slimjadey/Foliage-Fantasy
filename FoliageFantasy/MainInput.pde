void mouseDragged() 
{
    // Drag to pan camera
    int dx = mouseX - pmouseX;
    int dy = mouseY - pmouseY;
    camera.x -= dx * camera.viewportScale;
    camera.y -= dy * camera.viewportScale;
}

void mouseWheel(MouseEvent event) {
    // Zoom in and out using scroll wheel
    float e = event.getCount();
    camera.viewportScale = camera.viewportScale * pow(1.15, e);
}

void mouseClicked() { 
    //Add Plant Size Boundaries
  //Shovel Button Select
  
  if (mouseX >= 650 && mouseX <= 750 && mouseY >= 75 && mouseY <= 175) {
    buttonS = color(0);
  } else {
    buttonS = color(255, 0);
  }

  //Water Button Select
  if (mouseX >= 525 && mouseX <= 625 && mouseY >= 75 && mouseY <= 175) {
    buttonW = color(0);
  } else {
    buttonW = color(255, 0);
  }

  //Plant Button Select
  if (mouseX >= 400 && mouseX <= 500 && mouseY >= 75 && mouseY <= 175) {
    buttonP = color(0);
  } else {
    buttonP = color(255, 0);
  }

  // Place trees when clicking
    PVector result = camera.screenToWorld(mouseX, mouseY);
    Tree tree = new Tree(result.x, result.y, random(-0.1, 0.1));
    gameDrawables.add(tree);
    gameObjects.add(tree);
}