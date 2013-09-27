class Line{
  float x1,y1,x2,y2;
  
  Line(float x1,float y1,float x2,float y2){
    this.x1 = x1;
    this.x2 = x2;
    this.x3 = x3;
    this.x4 = x4;
  }
  
  float[] getPoints(){
    points = new float[] {x1,x2,y1,y2};
    return points;
  }
  void draw(){
    line(x1,y2,x2,y2);
  }
}
