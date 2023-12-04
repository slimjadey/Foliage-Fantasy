void draw() {
  currentTime = millis();
  
  // calculate elapsed time since last frame
  deltaTime = currentTime - previousTime;

  handleUpdate();

  background(255);

  drawInGameObjects();
  
  drawUI();

  drawDebugUI();

  previousTime = currentTime;
}

void handleUpdate() {
  // Update all drawable's states
  for (int i = 0; i < gameDrawables.size(); i++) {
    gameDrawables.get(i).update();
  }
}

void drawInGameObjects() {
  camera.pushCameraMatrix();
  // Background
  image(background, 0, 0);


  for (int i = 0; i < gameDrawables.size(); i++) {
    Drawable drawable = gameDrawables.get(i);

    // We don't want to draw anything that is really far off screen, since there's still overhead even with built in culling
    if(camera.isOffScreen(drawable.x))
    {
      continue;
    }

    pushMatrix();

    // We automatically handle object position and rotation before per gameobject draw logic
    translate(drawable.x, drawable.y);
    rotate(drawable.rotation);

    // object-specific draw logic
    drawable.draw();

    popMatrix();
  }
  camera.popCameraMatrix();
}

void drawDebugUI() {
  textSize(15);
  fill(0);
  text("fps: " + frameRate, 2, 15);
  text("camera position: " + camera.x + "," + camera.y, 2, 30);

  PVector mouseWorldPos = camera.screenToWorld(mouseX, mouseY);
  text("mouse world position: " + mouseWorldPos.x + "," + mouseWorldPos.y, 2, 45);
}