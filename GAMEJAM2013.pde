import gifAnimation.*;
import java.util.ArrayList;

float ballX = 350.0;
float ballY = 350.0;
float speedX, speedY;
float speed = 20.0;
Map map;

void setup(){
  size(800, 600);
  map = new Map();
}
void draw(){
  map.update(speedX, speedY);
  background(170);
  
  ellipse(ballX, ballY, 50, 50);
  line(mouseX, mouseY, ballX, ballY);
}
void keyPressed(){
  if(keyCode == LEFT){
    speedX = -10;
  }
 if(keyCode == RIGHT){
    speedX = 10;
  }
  if(keyCode == DOWN){
    speedY = 10;
  }
  if(keyCode == UP){
    speedY = -10;
  }
  
}
void keyReleased(){
  if(keyCode == LEFT){
    speedX = 0;
  }
 if(keyCode == RIGHT){
    speedX = 0;
  }
  if(keyCode == DOWN){
    speedY = 0;
  }
  if(keyCode == UP){
    speedY = 0;
  }
}
