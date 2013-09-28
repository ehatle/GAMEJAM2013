public abstract class Shape {
  float x, y;
  PApplet gfx;
  Gif animation;
  String gifPath;

  float cumulativeTR = 0;
  float turnRate = PI/80;  // bruker for å rotere, blir ikkje brukt
  int agroRange = width; // range for å "finne" player

  int numVertices = 0; // number of sides in polygon
  float[] vertX;   // array of x/y coordinates for polygon
  float[] vertY;

  PVector[] corners ;

  PVector pos; // posisjon til midtpunkt
  PVector velocity; //fart

  float size = 100;

  Player player;
  Map map;

  public Shape(PApplet gfx, float x, float y, Player player, int numVertices, Map map) {
    this.player = player;
    this.map = map;
    this.x = x;
    this.y = y;
    this.gifPath = "cube-copy.gif";
    this.gfx = gfx;
    animation = new Gif(gfx, gifPath);
    animation.loop();

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
    pushMatrix();
    translate(pos.x, pos.y);
    cumulativeTR =  (cumulativeTR + turnRate)%TAU;
    rotate(cumulativeTR);
    image(animation, 0, 0, size, size);
    popMatrix();

    // draw cursor
    fill(255);
    ellipse(mouseX, mouseY, 30, 30);
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
    // if hit, change the fill color for the polygon
    if (pointPolygon(numVertices, vertX, vertY, mouseX, mouseY)) {
      fill(255);
      this.killMe();
    }
    else {
      fill(255, 0, 0);
    }
  }
  // finner vinkel som må rotere for å nå player
  float findAngle(PVector playerPos) {

    float speed = 0.005; // hvor fort vinkelen skal endre seg
    int c = findClosestCorner(playerPos);
    float angle = PVector.angleBetween(corners[c], PVector.sub(playerPos, new PVector(vertX[c], vertY[c])));
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
  boolean pointPolygon (int numVertices, float[] vertX, float[] vertY, float px, float py) {
    boolean collision = false;
    for (int i=0, j=numVertices-1; i < numVertices; j = i++) {
      if ( ((vertY[i]>py) != (vertY[j]>py)) && (px < (vertX[j]-vertX[i]) * (py-vertY[i]) / (vertY[j]-vertY[i]) + vertX[i]) ) {
        collision = !collision;
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
/*  PVector polygonIntersection() {
    PVector [] points = new PVector[corners.length];
    for (int i = 0; i< corners.length; i++) {
      int j = (i+1>=corners.length) ? 0 : i+1;
      points[i] = lineIntersection(corners[i].x, corners[i].x, corners[j].x, corners[j].x);
    }
  }*/
  PVector lineIntersection(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4) {
    //returns intersection between two lines (defined by x1,y1,x2,y2 and x3,y3,x4,y4)
    int denominator = ((x1-x2) * (y3-y4)) - ((y1-y2) * (x3-x4));
    if (denominator == 0) return null;
    //returns null if the lines are parallell

      PVector point = new PVector(
    //first/denominator, second/denominator
    ((x1 * y2 - y1 * x2) * (x3 - x4) - ((x1 - x2) * (x3 * x4 - y3 * x4)))/denominator, ((x1*x2 - y1*x2) - ((y1-y2)*(x3*y4-y3*x4)))/denominator
      );
    return point;
  }

  boolean killMe() {
    map.toRemove.add(this);
    player.score += 10;
    println("Player score:" + player.score);
    return true;
  }
}

