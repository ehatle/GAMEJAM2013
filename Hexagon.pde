class Hexagon extends Shape {

  Hexagon(PApplet gfx, float x, float y, Player player, Map map) {
    super(gfx, x, y, player, 6, map);
    float h = sqrt(size*size + (size/2)*(size/2));
    corners[0] = new PVector(-size/2, -h);
    corners[1] = new PVector(size/2, -h);
    corners[2] = new PVector(size, 0);
    corners[3] = new PVector(size/2, h);
    corners[4] = new PVector(-size/2, h);
    corners[5] = new PVector(-size, 0);
  }
  
  boolean killMe(){
    map.toRemove.add(this);
    return true;
  }
}

