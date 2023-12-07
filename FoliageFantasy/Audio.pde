import processing.sound.*;
SoundFile shovelEffect;
SoundFile waterEffect;
SoundFile plantGrown;
SoundFile pressButton;
SoundFile growing;
SoundFile music;

void setupAudio() {
  
  //Variables for the different sound effects
  shovelEffect = new SoundFile(this, "resources/A6-shoveldig.wav");
  waterEffect = new SoundFile(this, "resources/A6-waterpour.wav");
  plantGrown = new SoundFile(this, "resources/A6-plantgrown.wav");
  pressButton = new SoundFile(this, "resources/A6-buttonpress.wav");
  growing = new SoundFile(this, "resources/A6-growing noise_2.wav");
  music = new SoundFile(this, "resources/HappyMusic.mp3");
  
  //Make the background music quieter and loop until game exits
  music.amp(.1);
  music.loop();
}
