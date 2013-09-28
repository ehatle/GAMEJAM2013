class Map {
  ArrayList <Shape> shapes;
  float x, y;
  Player p;
  PVector velocity;
  public Map(PApplet gfx) {
    velocity = new PVector(0.0,0.0);
    shapes = new ArrayList<Shape>();
    this.x = 0;
    this.y = 0;
    p = new Player(gfx);
    shapes.add(new Square(gfx,100, 100,p));
    shapes.add(new Triangle(gfx,200, 300,p));
    shapes.add(new Trapezoid(gfx,500, 300,p));
    shapes.add(new Hexagon(gfx,800, 300,p));
  }
  public Map(PApplet gfx, float x, float y) {
    p = new Player(gfx);
    shapes = new ArrayList<Shape>();
    this.x = x;
    this.y = y;
  }
  void update(float x, float y) {
    println(velocity.x);
    velocity.x = x;
    velocity.y = y;
  }
  void draw() {
    x += velocity.x;
    y += velocity.y;
    for (Shape s : shapes) {
      s.update(x,y);
      s.draw(x,y);
    }
    p.draw(velocity.heading());
    fill(255);
    line(mouseX, mouseY, p.x, p.y);
    
  }
}

