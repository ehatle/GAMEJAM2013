class Triangle extends Shape{
   Triangle(PApplet gfx, float x,float y, Player player){
   super(gfx, x,y, player,3);
   corners[0] = new PVector(0,-size/2);
   corners[1] = new PVector(-size/2, size/2);
   corners[2] = new PVector(size/2, size/2);
  }
}
