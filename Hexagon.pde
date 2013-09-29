class Hexagon extends Shape {

  Hexagon(PApplet gfx, float x,float y, Player player, Map map, Gif animation) {
    super(gfx, x, y, player, 6, map,animation);
    float r = findr(6,size);
    float R = findR(6,size);
    
    float h = sqrt(size*size + (size/2)*(size/2));
    corners[0] = new PVector(-size/2, -r);
    corners[1] = new PVector(size/2, -r);
    corners[2] = new PVector(size, 0);
    corners[3] = new PVector(size/2, r);
    corners[4] = new PVector(-size/2, r);
    corners[5] = new PVector(-size, 0);
    
  }
  
  boolean killMe(){
    map.toRemove.add(this);
    map.toAdd.add(new Trapezoid(gfx, pos.x + 100, pos.y + 100, player, map,map.animation[2]));
    map.toAdd.add(new Trapezoid(gfx, pos.x - 100, pos.y - 100, player, map,map.animation[2]));
    return true;
  }
}

