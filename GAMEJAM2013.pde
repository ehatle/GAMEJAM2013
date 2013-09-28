import gifAnimation.*;
import java.util.ArrayList;
float speedX, speedY;
Map map;

void setup() {
  size(800, 600);
  frameRate(50);
  map = new Map(this);
}
void draw() {
  map.update(speedX, speedY);
  background(0);
  map.draw();
  fill(255);
  ellipse(width/2,height/2, 10, 10);
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

