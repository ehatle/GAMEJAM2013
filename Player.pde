class Player {
  float x,y;
  Gif animation;
  public Player(PApplet gfx){
    this.x = width/2;
    this.y = height/2;
    animation = new Gif(gfx, "Shark.gif");
    animation.loop();
  }
  void draw(float d){
    
    image(animation, x-35, y-35, 70,70);
  }
}
