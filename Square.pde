public class Square extends Shape{
  
  Square(float x,float y){
    super(x,y);
    corners = new Corners[4];
    corners[0] = new PVector(-size/2,-size/2);
    corners[1] = new PVector(size/2,-size/2);
    corners[2] = new PVector(-size/2,size/2);
    corners[3] = new PVector(size/2,size/2);
  }
  void draw(){
    rectMode(CENTER);
    rect(x,y,size,size);
  }
}
