class Map {
  ArrayList <Shape> shapes;
  float x, y;
  Player p;
  public Map(PApplet gfx) {
    shapes = new ArrayList<Shape>();
    this.x = 0;
    this.y = 0;
    shapes.add(new Shape(100, 100));
    shapes.add(new Shape(200, 300));
    p = new Player(gfx);
  }
  public Map(PApplet gfx, float x, float y) {
    p = new Player(gfx);
    shapes = new ArrayList<Shape>();
    this.x = x;
    this.y = y;
  }
  void update(float x, float y) {
    this.x += x;
    this.y += y;
  }
  void draw() {
    for (Shape s : shapes) {
      s.draw(x, y);
    }
    p.draw();
  line(mouseX, mouseY, p.x, p.y);
  }
}
