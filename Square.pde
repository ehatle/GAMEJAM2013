public class Square extends Shape{
  Square(float x,float y){
    super(x,y);
  }
  void draw(){
    rect(x,y,size,size);
  }
}
