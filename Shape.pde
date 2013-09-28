public class Shape{
  float x,y;
  PApplet gfx;
  Gif animation;
  String gifPath;
  public Shape(PApplet gfx, float x, float y){
    this.x = x;
    this.y = y;
    this.gifPath = "cube-copy.gif";
    this.gfx = gfx;
    animation = new Gif(gfx, gifPath);
    animation.loop();
    this.gifPath = "cube-copy.gif";
  }
  public void draw(float x, float y){
    image(animation, this.x + x, this.y + y, 100, 100);
  }
}
