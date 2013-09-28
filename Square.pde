public class Square extends Shape{
  PVector[] corners;
  Square(PApplet gfx, float x,float y){
    super(gfx, x,y);
   /* corners = new PVector[4];
    corners[0] = new PVector(-size/2,-size/2);
    corners[1] = new PVector(size/2,-size/2);
    corners[2] = new PVector(-size/2,size/2);
    corners[3] = new PVector(size/2,size/2);*/
  }
  void draw(){
    rectMode(CENTER);
    //rect(x,y,size,size);
  }
}
