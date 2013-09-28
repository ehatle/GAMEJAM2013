public class Shape{
  float x,y;
  int size;
  Line[] lines;
  
  public Shape(float x, float y){
    this.x = x;
    this.y = y;
    size = 10;
  }
  public void draw(){
    rect(x,y,100,100);
  }
}
