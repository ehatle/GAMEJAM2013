public class Square extends Shape{
  Square(PApplet gfx, float x,float y, Player player){
    super(gfx, x,y, player,4);

   float h = sqrt(size*size + (size/2)*(size/2));
   float f = (h/2 + h)/2;
   float g = f - h/2;
   
    corners[0] = new PVector(-f,-h/2);
    corners[1] = new PVector(g,-h/2);
    corners[2] = new PVector(f,h/2);
    corners[3] = new PVector(-g/2,h/2);
  }

}
