import java.util.Random;
class Map {
  ArrayList <Shape> shapes;
  ArrayList <Shape> toRemove;
  ArrayList <Shape> toAdd;
  Player p;
  PVector velocity;

  PApplet gfx;
  Gif[] animation;
  //gifPath;

  int counter = 0;
  
  public Map(PApplet gfx) {
    velocity = new PVector(0.0, 0.0);
    shapes = new ArrayList<Shape>();
    toRemove = new ArrayList<Shape>();
    toAdd = new ArrayList<Shape>();
    p = new Player(gfx);

    animation = new Gif[4];
    String[] gifPath = {
      "gifs/tria-border.gif", 
      "gifs/diamond.gif", 
      "gifs/trapezoid.gif", 
      "gifs/hex.gif"
    };

    for (int i= 0; i < 4; i++) {
      println(gifPath[i]);
      animation[i] = new Gif(gfx, gifPath[i]);
      animation[i].loop();
    }
    shapes.add(new Triangle(gfx, 200, 300, p, this, animation[0]));
    shapes.add(new Trapezoid(gfx, 500, 300, p, this, animation[2]));
    shapes.add(new Hexagon(gfx, 800, 300, p, this, animation[3]));
    shapes.add(new Square(gfx, 100, 100, p, this, animation[1]));
  }
  void update(float x, float y) {
    velocity.x = x;
    velocity.y = y;
  }
  void draw() {
    if ((counter%1000)==0){
      spawn();
    }
    counter ++;
    
    p.velocity = velocity;
    p.update();
    for (Shape s : shapes) {
      s.update(velocity.x, velocity.y);
      for (PVector v : p.hitPoints) {
        if (s.hit(v.x+p.x, v.y+p.y, p.size)) {
          s.killMe();
          PVector[] points = s.polygonIntersection(p);
          int j = s.vertX.length-1; 
          for (int i = 0;i< s.vertX.length; i++) {
            if (abs(s.vertX[i] - p.x) == 0) {
              if (abs(s.vertY[i] - p.y) == 0) {
                p.killMe();
                shapes = new ArrayList<Shape>();
                break;
              }
            }
            j = i;
          }
        }
      }
      s.draw(velocity.x, velocity.y);
    }
    for (Shape rm : toRemove) {
      shapes.remove(rm);
    }
    for (Shape s : shapes) {
      if (!s.disable) {
        s.update(velocity.x, velocity.y);
        s.draw(velocity.x, velocity.y);
      }
    }
    fill(255);
    text("Score: " + p.score, 10, 36); //viser scoren
    p.draw((velocity.x != 0 || velocity.y != 0) ? velocity.heading() : 10.0);
    fill(255);
    line(mouseX, mouseY, p.x, p.y);
  }

  void spawn() {
    PVector place = new PVector(0,width/2);
    place.rotate(random(1.0)*TAU);
    
    float a = place.x + p.x;
    float b = place.y + p.y;
    
    int max = 3;
    int min = 0;
    Random rand = new Random();
    int randomNum = rand.nextInt((max - min) + 1) + min;
    switch (randomNum) {
    case 0:  
      shapes.add(new Triangle(gfx, a, b, p, this, animation[0]));
      break;
    case 1:
      shapes.add(new Trapezoid(gfx, a, b, p, this, animation[2]));
      break;
    case 2:  
      shapes.add(new Hexagon(gfx, a, b, p, this, animation[3]));
      break;
    case 3:  
      shapes.add(new Square(gfx, a, b, p, this, animation[1]));
      break;
    }
  }
}

