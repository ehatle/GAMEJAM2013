public class Shape{
  float x,y;
  Player player;
  
  public Shape(float x, float y){
    this.x = x;
    this.y = y;
  }
  public void draw(float x, float y){
    rect(this.x + x,this.y + y,100,100);
  }
  
  /*
    Krever posisjon x, y
    Bruker player x og y
  */
  PVector findPlayerVec(int x, int y){
    
    float distanceX = player.x-x;
    float distanceY = player.y-y;
    
    float distanceTotal = sqrt(distanceX*distanceX+distanceY*distanceY);
    
    if(distanceTotal <= agroRange){
     
     float moveDistanceX = turnRate*distanceX/distanceTotal;
    float moveDistanceY = turnRate*distanceY/distanceTotal; 
   
    moveX += moveDistanceX;
    moveY += moveDistanceY;
    
    float totalmove = sqrt(moveX*moveX+moveY*moveY);
      
     moveX = speed*moveX/totalmove;
    moveY = speed*moveY/totalmove;
    
    
    
    }
    
    return new PVector(moveX, moveY);
  
  }
}
