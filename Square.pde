public class Square extends Shape{
  Square(PApplet gfx, float x,float y, Player player){
    super(gfx, x,y, player,4);
    
    
    corners[0] = new PVector(-size/2,-size/2);
    corners[1] = new PVector(size/2,-size/2);
    corners[3] = new PVector(-size/2,size/2);
    corners[2] = new PVector(size/2,size/2);
  }

}
