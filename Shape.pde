public class Shape{
  float x,y;
  Player player;
  
  int speed = 2; //hastigheten for å følge etter player
  float turnRate = .3;  // bruker for å rotere, blir ikkje brukt
  int agroRange = width; // range for å "finne" player
  float moveX = 0;
  float moveY = 0;
  
  int numVertices = 3;                      // number of sides in polygon
  float[] vertX = new float[numVertices];   // array of x/y coordinates for polygon
  float[] vertY = new float[numVertices];

  PVector[] corners = new PVector[numVertices];

  PVector pos = new PVector(300,300);
  
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
