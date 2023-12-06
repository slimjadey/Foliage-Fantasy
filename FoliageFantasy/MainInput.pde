int mode = 1; //start mode in seed

void mouseDragged() {
  // Drag to pan camera
  int dx = mouseX - pmouseX;
  camera.x -= dx * camera.viewportScale;
  
  // Keep the camera within the plots
  camera.x = constrain(camera.x, 0, (plotCount - 1) * plotSpacing);
}

void mouseWheel(MouseEvent event) {
  // Zoom in and out using scroll wheel
  float e = event.getCount();
  // camera.viewportScale = camera.viewportScale * pow(1.15, e);
}

void mouseClicked() { 
  // Add Plant Size Boundaries
  // Shovel Button Select (3)
  if (dist(900, 75, mouseX, mouseY) < 50)/*(mouseX >= 600 && mouseX <= 700 && mouseY >= 25 && mouseY <= 125)*/ {
    pressButton.play();
    mode = 3;
  } 

  // Water Button Select (2)
  if (dist(775, 75, mouseX, mouseY) < 50)/*(mouseX >= 475 && mouseX <= 575 && mouseY >= 25 && mouseY <= 125)*/ {
    pressButton.play();
    mode = 2;
  }

  // Plant Button Select (1)
  if (dist(650, 75, mouseX, mouseY) < 50)/*(mouseX >= 350 && mouseX <= 450 && mouseY >= 25 && mouseY <= 125)*/ {
    pressButton.play();
    mode = 1;
  }
  
  //Check if you click in plot
  for (int i = 0; i < farmPlots.size(); i++)
  {
    FarmPlot plot = farmPlots.get(i);
    if (plot.isMouseOnPlot() == true)
    {
       //if mode is 1, plot.plantTree()
       if (mode == 1)
       {
         plot.plantTree();
         plantGrown.play();

         //indicator for plants to be watered
         for (int g = 0; g < 5; g++) {
           color seeds = color(137, 207, 240);
           fill(seeds);
           ellipse(random(0, 300), random(0, 300), 10, 10);
         }
       }
       //else if mode is 2, plot.waterTree()
       else if (mode == 2)
       {
         plot.waterTree();
         waterEffect.play();
       }
       //else if mode is 3, plot.removeTree()
       else if (mode == 3)
       {
         plot.removeTree();
         shovelEffect.play();
       }
    }
  }
  
}
