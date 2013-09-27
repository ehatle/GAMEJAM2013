import java.util.ArrayList;

float ballX = 350.0;
float ballY = 350.0;
float speedX, speedY;
float speed = 20.0;
ArrayList <Shape> shapes;

void setup(){
  size(800, 600);
  shapes = new ArrayList<Shape>();
  shapes.add(new Shape(100,100));
  shapes.add(new Shape(200,300));
}
void draw(){
  ballX += speedX;
  ballY += speedY;
  background(170);
  
  ellipse(ballX, ballY, 50, 50);
  line(mouseX, mouseY, ballX, ballY);
  for (Shape s : shapes){
    s.draw();
  }
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
