void draw()
{
    currentTime = millis();
    deltaTime = currentTime - previousTime;

    handleUpdate();
    handleDrawing();
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
        // We automatically handle gameobject position and rotation here
        pushMatrix();

        GameDrawable drawable = gameDrawables.get(i);
        translate(drawable.x, drawable.y);
        rotate(drawable.rotation);

        drawable.draw();

        popMatrix();
    }
    camera.popCameraMatrix();
}

void drawDebugUI()
{
    textSize(15);
    fill(0);
    println(frameRate);
    text("fps: " + frameRate, 2, 15);
}