class Player {
  float x,y;
  public Player(){
    this.x = width/2;
    this.y = height/2;
  }
  void draw(int x,int y){
    ellipse(this.x + x,this.y + y);
  }
}
