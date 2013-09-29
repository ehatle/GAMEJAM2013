public abstract class Shape {
  float x, y;
  PApplet gfx;
  Gif animation;
  String gifPath = "cube-copy.gif";

  float cumulativeTR = 0;
  float turnRate = PI/80;  // bruker for å rotere, blir ikkje brukt
  int agroRange = width; // range for å "finne" player

  int numVertices = 0; // number of sides in polygon
  float[] vertX;   // array of x/y coordinates for polygon
  float[] vertY;

  PVector[] corners ;

  PVector pos; // posisjon til midtpunkt
  PVector velocity; //fart

  float size = 75;
  // size and offset of gif
  float gifSize = size;
  PVector gifOffset = new PVector(0.0, 0.0);


  boolean disable = false;

  Player player;
  Map map;

  public Shape(PApplet gfx, float x, float y, Player player, int numVertices, Map map, Gif animation) {
    this.player = player;
    this.map = map;
    this.x = x;
    this.y = y;
    this.gfx = gfx;
    this.animation = animation;

    // setter startposisjon til x,y
    pos = new PVector(x, y);
    // setter startfart til 0
    velocity = new PVector(0, 0);


    this.numVertices = numVertices;

    vertX = new float[numVertices];   // array of x/y coordinates for polygon
    vertY = new float[numVertices];

    corners = new PVector[numVertices];
  }
  public void draw(float x, float y) {
    imageMode(CENTER);
    // draw polygon
    beginShape();
    for (int i=0; i<numVertices; i++) {
      vertex(vertX[i], vertY[i]);
    }
    endShape(CLOSE);

    // draw image
    pushMatrix();
    translate(pos.x, pos.y);
    cumulativeTR =  (cumulativeTR + turnRate)%TAU;
    rotate(cumulativeTR);
    image(animation, gifOffset.x, gifOffset.y, gifSize, gifSize);
    popMatrix();
  }

  public void update(float x, float y) {
    velocity =  findPlayerVec(pos.x, pos.y);
    pos.add(new PVector(x, y));
    pos.add(velocity);

    // rotering
    turnRate = findAngle(new PVector(player.x, player.y));
    for (int i = 0; i<numVertices;i++) {
      corners[i].rotate(turnRate);
    }
    for (int i = 0; i<numVertices;i++) {
      PVector v = PVector.add(corners[i], pos);
      vertX[i] = v.x;
      vertY[i] = v.y;
    }
  }
  // finner vinkel som må rotere for å nå player
  float findAngle(PVector playerPos) {

    float speed = 0.005; // hvor fort vinkelen skal endre seg
    int c = findClosestCorner(playerPos);
    float angle = PVector.angleBetween(PVector.sub(playerPos, new PVector(vertX[c], vertY[c])), corners[c]);
    return angle*speed;
  }

  // finner hjørnet som er nærmest player
  int findClosestCorner(PVector playerPos) {
    int max =  1;
    float maxD = playerPos.dist(new PVector(vertX[max], vertY[max]));
    PVector newVec;
    for (int i = 1; i < numVertices;i++) {
      newVec = new PVector(vertX[i], vertY[i]);

      float d = playerPos.dist(newVec);
      if (d<maxD) {
        maxD = d;
        max = i;
      }
    }
    return max;
  }

  /*
  POINT/POLYGON COLLISION DETECTION
   Takes 5 arguments:
   + # of vertices
   + float array x and y coordinates for vertices
   + x/y coordinates for point
   */
  boolean hit(float px, float py, float psize) {
    boolean collision = false;
    for (int i=0, j=vertX.length-1; i < vertX.length; j = i++) {
      if (((vertY[i]>py) != (vertY[j]>py))) {
        if ((px < (vertX[j]-vertX[i]) * (py-vertY[i]) / (vertY[j]-vertY[i]) + vertX[i]) ) {
          collision = !collision;
        }
      }
    }
    return collision;
  }
  /*
    Krever posisjon x, y
   Bruker player x og y
   */
  PVector findPlayerVec(float x, float y) {

    int speed = 1; //hastigheten for å følge etter player

    float moveX = 0;
    float moveY = 0;

    /* får formen til å følge etter musa, for debugging
     float distanceX = mouseX-x;
     float distanceY = mouseY-y;
     */


    float distanceX = player.x-x;
    float distanceY = player.y-y;

    float distanceTotal = sqrt(distanceX*distanceX+distanceY*distanceY);

    if (distanceTotal <= agroRange) {

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
  /*
    Uses player
   calculates all line intersection between the player and a shape
   */
  PVector[] polygonIntersection(Player p) {
    PVector [] points = new PVector[corners.length];
    int j = vertX.length-1;
    for (int i= 0; i< vertX.length; i++) {
      points[i] = lineIntersection(vertX[i], vertY[i], vertX[j], vertY[j], p.x-p.velocity.x, p.y-p.velocity.y, p.x+p.velocity.x, p.y-p.velocity.y);
      j = i;
    }
    return points;
  }
  PVector lineIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    line(x1,y1,x2,y2);
    line(x3,y3,x4,y4);
    //returns intersection between two lines (defined by x1,y1,x2,y2 and x3,y3,x4,y4)
    float denominator = ((x1-x2) * (y3-y4)) - ((y1-y2) * (x3-x4));
    if (denominator == 0) return null;
    //returns null if the lines are parallell

      return new PVector(
    ((x1 * y2 - y1 * x2) * (x3 - x4) - ((x1 - x2) * (x3 * x4 - y3 * x4)))/denominator, ((x1*x2 - y1*x2) - ((y1-y2)*(x3*y4-y3*x4)))/denominator
      );
    //return point;
  }

  boolean killMe() {
    map.toRemove.add(this);
    player.score += 10;
    println("Player score:" + player.score);
    return true;
  }

  float findr(int n, float a) {
    return 0.5*a*(1.0/tan(PI/n));
  }
  float findR(int n, float a) {
    return 0.5*a*(1.0/sin(PI/n));
  }
}

