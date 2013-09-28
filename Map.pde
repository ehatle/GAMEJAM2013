class Map {
  ArrayList <Shape> shapes;
  ArrayList <Shape> toRemove;
  ArrayList <Shape> toAdd;
  Player p;
  PVector velocity;
  public Map(PApplet gfx) {
    velocity = new PVector(0.0,0.0);
    shapes = new ArrayList<Shape>();
    toRemove = new ArrayList<Shape>();
    toAdd = new ArrayList<Shape>();
    p = new Player(gfx);
    shapes.add(new Triangle(gfx,200, 300,p, this));
    shapes.add(new Trapezoid(gfx,500, 300,p, this));
    shapes.add(new Hexagon(gfx,800, 300,p, this));
    shapes.add(new Square(gfx,100, 100,p, this));
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
      s.update(velocity.x,velocity.y);
      s.draw(velocity.x,velocity.y);
    }
    for (Shape rm : toRemove) {
      shapes.remove(rm);
    }
    
    for (Shape newShape : toAdd) {
      shapes.add(newShape);
    }
    
    p.draw((velocity.x != 0 || velocity.y != 0) ? velocity.heading() : 10.0);
    fill(255);
    line(mouseX, mouseY, p.x, p.y);
    
  }
}

