void draw()
{
    currentTime = millis();
    deltaTime = currentTime - previousTime;

    handleUpdate();
    handleDrawing();

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

        GameDrawable drawable = gameDrawables.get(i);
        translate(drawable.x, drawable.y);
        rotate(drawable.rotation);

        drawable.draw();

        popMatrix();
    }
    camera.popCameraMatrix();
}