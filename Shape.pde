public abstract class Shape {
  float x, y;
  PApplet gfx;
  Gif animation;
  String gifPath;

  float turnRate = .3;  // bruker for å rotere, blir ikkje brukt
  int agroRange = width; // range for å "finne" player

  int numVertices = 0;                      // number of sides in polygon
  float[] vertX = new float[numVertices];   // array of x/y coordinates for polygon
  float[] vertY = new float[numVertices];

  PVector[] corners = new PVector[numVertices];

  PVector pos; // posisjon til midtpunkt
  PVector velocity; //fart

  float size = 100;

  Player player;

  public Shape(PApplet gfx, float x, float y, Player player) {
    this.player = player;
    this.x = x;
    this.y = y;
    this.gifPath = "cube-copy.gif";
    this.gfx = gfx;
    animation = new Gif(gfx, gifPath);
    animation.loop();
    this.gifPath = "cube-copy.gif";

    // setter startposisjon til x,y
    pos = new PVector(x, y);
    // setter startfart til 0
    velocity = new PVector(0, 0);
  }
  public void draw(float x, float y) {
    image(animation, pos.x, pos.y, size, size);
    
    fill(255, 0, 0);
    System.out.println("noe");
    // draw polygon
    beginShape();
    for (int i=0; i<numVertices; i++) {
      vertex(vertX[i], vertY[i]);
    }
    endShape(CLOSE);

    // draw cursor
    fill(255);
    ellipse(mouseX, mouseY, 30, 30);
  }

  public void update(float x, float y) {
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
  PVector findPlayerVec(int x, int y) {

    int speed = 2; //hastigheten for å følge etter player

    float moveX = 0;
    float moveY = 0;

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
}

