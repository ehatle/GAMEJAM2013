class Map {
  ArrayList <Shape> shapes;
  float x, y;
  Player p;
  public Map() {
    shapes = new ArrayList<Shape>();
    this.x = 0;
    this.y = 0;
    shapes.add(new Shape(100, 100));
    shapes.add(new Shape(200, 300));
  }
  public Map(float x, float y) {
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
    p.draw(x, y);
  }
}

