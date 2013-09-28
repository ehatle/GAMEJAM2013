class Map {
  ArrayList <Shape> shapes;
  float x, y;
  Player p;
  PVector velocity;
  public Map(PApplet gfx) {
    shapes = new ArrayList<Shape>();
    this.x = 0;
    this.y = 0;
    p = new Player(gfx);
    shapes.add(new Shape(gfx,100, 100,p));
    shapes.add(new Shape(gfx,200, 300,p));
  }
  public Map(PApplet gfx, float x, float y) {
    p = new Player(gfx);
    shapes = new ArrayList<Shape>();
    this.x = x;
    this.y = y;
  }
  void update(float x, float y) {
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

