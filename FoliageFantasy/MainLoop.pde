void draw()
{
    currentTime = millis();
    deltaTime = currentTime - previousTime;

    handleUpdate();
    handleDrawing();
    drawUI();
    drawDebugUI();

    previousTime = currentTime;
}

void handleUpdate()
{
    for(int i = 0;i < gameObjects.size();i++)
    {
        gameObjects.get(i).update();
    }
}

void handleDrawing()
{
    background(255);
    camera.pushCameraMatrix();
    for(int i = 0;i < gameDrawables.size();i++)
    {
        pushMatrix();

        // We automatically handle object position and rotation before per gameobject draw logic
        GameDrawable drawable = gameDrawables.get(i);
        translate(drawable.x, drawable.y);
        rotate(drawable.rotation);

        // object-specific draw logic
        drawable.draw();

        popMatrix();
    }
    camera.popCameraMatrix();
}

void drawDebugUI()
{
    textSize(15);
    fill(0);
    text("fps: " + frameRate, 2, 15);
}