public class Shape{
  float x,y;
//<<<<<<< HEAD
  PApplet gfx;
  Gif animation;
  String gifPath;
  
  int speed = 2; //hastigheten for å følge etter player
  float turnRate = .3;  // bruker for å rotere, blir ikkje brukt
  int agroRange = width; // range for å "finne" player
  float moveX = 0;
  float moveY = 0;
  
  int numVertices = 3;                      // number of sides in polygon
  float[] vertX = new float[numVertices];   // array of x/y coordinates for polygon
  float[] vertY = new float[numVertices];

  PVector[] corners = new PVector[numVertices];

  PVector pos;
  
  float size = 100;
  
  Player player;
  
  public Shape(PApplet gfx, float x, float y, Player player){
//=======
 
//>>>>>>> b6baee56ad9171c3bb1f0992fb87270b82d190d3
    this.player = player;
    this.x = x;
    this.y = y;
    this.gifPath = "cube-copy.gif";
    this.gfx = gfx;
    animation = new Gif(gfx, gifPath);
    animation.loop();
    this.gifPath = "cube-copy.gif";
    
    // setter startposisjon til x,y
    pos = new PVector(x,y);
    
  }
  public void draw(float x, float y){
    image(animation, pos.x + x, pos.y + y, size, size);
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
