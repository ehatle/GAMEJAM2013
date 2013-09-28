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
    }
    else {
      fill(255, 0, 0);
    }
  }
  // finner vinkel som må rotere for å nå player
  findAngle(PVector playerPos) {
    float speed = 0.5; // hvor fort vinkelen skal endre seg
    PVector closestCorner = findClosestCorner(playerPos);
    float angle = PVector.angleBetween(closestCorner, playerPos);
    return angle*speed;
  }

  // finner punktet som er nærmest player
  void findClosestCorner(PVector playerPos) {
    PVector max = corners[0];
    float maxD = playerPos.dist(new PVector(vertX[0], vertY[0]));
    PVector newVec;
    for (int i = 1; i < numVertices;i++) {
      newVec = new PVector(vertX[i], vertY[i]);

      float d = playerPos.dist(newVec);
      if (d<maxD) {
        maxD = d;
        max = corners[i];
      }
    }
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

    int speed = 2; //hastigheten for å følge etter player

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

  boolean killMe() {
    map.toRemove.add(this);
    player.score += 10;
    println("Player score:" + player.score);
    return true;
  }
}

