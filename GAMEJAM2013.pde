import gifAnimation.*;
import java.util.ArrayList;
float speedX, speedY;
Map map;

void setup(){
  size(800, 600);
  map = new Map(this);
}
void draw(){
  frameRate(50);
  map.update(speedX, speedY);
  background(0);
  map.draw();
}
void keyPressed(){
  if(keyCode == LEFT || key == 'a' || key == 'A'){
    speedX = 10;
  }
 if(keyCode == RIGHT || key == 'D' || key == 'D'){
    speedX = -10;
  }
  if(keyCode == DOWN || key == 's' || key == 'S'){
    speedY = -10;
  }
  if(keyCode == UP || key == 'w' || key == 'W'){
    speedY = 10;
  }
  
}
void keyReleased(){
  if(keyCode == LEFT || key == 'a' || key == 'A'){
    speedX = 0;
  }
 if(keyCode == RIGHT || key == 'D' || key == 'D'){
    speedX = 0;
  }
  if(keyCode == DOWN || key == 's' || key == 'S'){
    speedY = 0;
  }
  if(keyCode == UP || key == 'w' || key == 'W'){
    speedY = 0;
  }
}
