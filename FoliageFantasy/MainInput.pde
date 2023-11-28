void mouseDragged() 
{
    int dx = mouseX - pmouseX;
    int dy = mouseY - pmouseY;
    camera.x -= dx * camera.viewportScale;
    camera.y -= dy * camera.viewportScale;
}

void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    camera.viewportScale = camera.viewportScale * pow(1.15, e);
}

void mouseClicked() {
    PVector result = camera.screenToWorld(mouseX, mouseY);
    gameDrawables.add(new Tree(result.x, result.y, 0));
}
