void mouseDragged() {
  // Drag to pan camera
  int dx = mouseX - pmouseX;
  camera.x -= dx * camera.viewportScale;
}

void mouseWheel(MouseEvent event) {
  // Zoom in and out using scroll wheel
  float e = event.getCount();
  // camera.viewportScale = camera.viewportScale * pow(1.15, e);
}

void mouseClicked() { 
  // Add Plant Size Boundaries
  // Shovel Button Select
  if (mouseX >= 600 && mouseX <= 700 && mouseY >= 25 && mouseY <= 125) {
    buttonS = color(0);
    pressButton.play();
  } else {
    buttonS = color(255, 0);
  }

  // Water Button Select
  if (mouseX >= 475 && mouseX <= 575 && mouseY >= 25 && mouseY <= 125) {
    buttonW = color(0);
    pressButton.play();
  } else {
    buttonW = color(255, 0);
  }

  // Plant Button Select
  if (mouseX >= 350 && mouseX <= 450 && mouseY >= 25 && mouseY <= 125) {
    buttonP = color(0);
    pressButton.play();
  } else {
    buttonP = color(255, 0);
  }
}
