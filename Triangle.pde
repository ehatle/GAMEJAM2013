class Triangle extends Shape{
   Triangle(PApplet gfx, float x,float y, Player player, Map map){
   super(gfx, x,y, player,3, map);
   float h = sqrt(size*size + (size/2)*(size/2));
   corners[0] = new PVector(0,-h/2);
   corners[1] = new PVector(-size/2, h/2);
   corners[2] = new PVector(size/2, h/2);
  }
}
