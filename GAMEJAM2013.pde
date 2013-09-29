import gifAnimation.*;
import java.util.ArrayList;
float speedX, speedY;
Map map;
PImage startPic;
PImage bg;
byte gamePhase;

void setup() {
  size(1280, 720);
  frameRate(50);
  startPic = loadImage("images/start.jpg");
  bg = loadImage("images/bgg.jpg");
  gamePhase = 0; //skift til false for å teste startskjermen
  map = new Map(this);
  textSize(32);
}
void draw() {
  if (gamePhase == 0) {
    image(startPic, 0, 0);
  }
  else if (gamePhase == 1){
    
    map.update(speedX, speedY);   
    background(bg);
    map.draw();
   
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      speedX = 10;
    }
    if (keyCode == RIGHT) {
      speedX = -10;
    }
    if (keyCode == DOWN) {
      speedY = -10;
    }
    if (keyCode == UP) {
      speedY = 10;
    }
  } 
  else {
    if (key == 'a' || key == 'A') {
      speedX = 10;
    }
    if (key == 'd' || key == 'D') {
      speedX = -10;
    }
    if (key == 's' || key == 'S') {
      speedY = -10;
    }
    if (key == 'w' || key == 'W') {
      speedY = 10;
    }
    if (key == ENTER || key == RETURN) {
      gamePhase = 1;
    }
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      speedX = 0;
    }
    if (keyCode == RIGHT) {
      speedX = 0;
    }
    if (keyCode == DOWN) {
      speedY = 0;
    }
    if (keyCode == UP) {
      speedY = 0;
    }
  }
  else {
    if (key == 'a' || key == 'A') {
      speedX = 0;
    }
    if (key == 'd' || key == 'D') {
      speedX = 0;
    }
    if (key == 's' || key == 'S') {
      speedY = 0;
    }
    if (key == 'w' || key == 'W') {
      speedY = 0;
    }
  }
}

