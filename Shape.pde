public class Shape{
  float x,y;
  
  public Shape(float x, float y){
    this.x = x;
    this.y = y;
  }
  public void draw(float x, float y){
    rect(this.x + x,this.y + y,100,100);
  }
}
