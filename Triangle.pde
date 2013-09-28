class Triangle extends Shape{
  Triangle(PApplet gfx, float x,float y, Player player){
    super(gfx, x,y, player,3);
       v1 = new PVector(0,-size/2);
   v2 = new PVector(-size/2, size/2);
   v3 = new PVector(size/2, size/2);
  }
  void update(float x, float y){
    // do nothing
  }
}
