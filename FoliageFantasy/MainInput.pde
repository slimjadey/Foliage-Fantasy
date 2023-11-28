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
    // Place trees when clicking
    PVector result = camera.screenToWorld(mouseX, mouseY);
    Tree tree = new Tree(result.x, result.y, random(-0.1, 0.1));
    gameDrawables.add(tree);
    gameObjects.add(tree);
}
