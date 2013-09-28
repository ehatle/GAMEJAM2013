public class Shape{
  float x,y;
  int size;
  Line[] lines;
  
  PVector[] corners; //cornervectors relative from center
  
  public Shape(float x, float y){
    this.x = x;
    this.y = y;
    size = 100;
  }
  public void draw(){
    rect(x,y,size,size);
  }
}
