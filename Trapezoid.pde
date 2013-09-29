public class Trapezoid extends Shape {
  Trapezoid(PApplet gfx, float x, float y, Player player, Map map, Gif animation) {
    super(gfx, x, y, player, 4, map, animation);
    gifSize = size*2;
    
    gifOffset.set(0,-14);
    float h = sqrt(size*size + (size/2)*(size/2));
   
    float r = findr(6,size);
    float R = findR(6,size);
    
    corners[0] = new PVector(-size/2, -r + (h/4));
    corners[1] = new PVector(size/2, -r + (h/4));
    corners[2] = new PVector(size, 0 + (h/4) );
    corners[3] = new PVector(-size, 0 + (h/4) );
    
  }

  boolean killMe() {
    map.toRemove.add(this);
    player.score += 10;
    map.toAdd.add(new Triangle(gfx, pos.x + 100, pos.y + 100, player, map,map.animation[0]));
    map.toAdd.add(new Triangle(gfx, pos.x - 100, pos.y - 100, player, map,map.animation[0]));
    map.toAdd.add(new Triangle(gfx, pos.x + 100, pos.y - 100, player, map,map.animation[0]));
    //map.toAdd.add(new Triangle(gfx, 700, 300, player, map));
    
    return true;
  }
}

