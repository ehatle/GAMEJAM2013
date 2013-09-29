class Map {
  ArrayList <Shape> shapes;
  ArrayList <Shape> toRemove;
  ArrayList <Shape> toAdd;
  Player p;
  PVector velocity;

  PApplet gfx;
  Gif[] animation;
  //gifPath;

  public Map(PApplet gfx) {
    velocity = new PVector(0.0, 0.0);
    shapes = new ArrayList<Shape>();
    toRemove = new ArrayList<Shape>();
    toAdd = new ArrayList<Shape>();
    p = new Player(gfx);

    Gif[] animation = new Gif[4];
    String[] gifPath = {
      "gifs/tria-copy.gif", 
      "gifs/cube-copy.gif", 
      "gifs/cube-copy.gif", 
      "gifs/cube-copy.gif"
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
  public Map(PApplet gfx, float x, float y) {
    p = new Player(gfx);
    shapes = new ArrayList<Shape>();
  }
  void update(float x, float y) {
    velocity.x = x;
    velocity.y = y;
  }
  void draw() {
    for (Shape s : shapes) {
      s.update(velocity.x, velocity.y);
      s.draw(velocity.x, velocity.y);
    }
    for (Shape rm : toRemove) {
      shapes.remove(rm);
    }

    for (Shape newShape : toAdd) {
      shapes.add(newShape);
    }
    p.update(velocity);
    p.draw((velocity.x != 0 || velocity.y != 0) ? velocity.heading() : 10.0);
    fill(255);
    line(mouseX, mouseY, p.x, p.y);
  }
}

