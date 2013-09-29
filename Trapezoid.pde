public class Trapezoid extends Shape {
  Trapezoid(PApplet gfx, float x, float y, Player player, Map map, Gif animation) {
    super(gfx, x, y, player, 4, map, animation);
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
    
    println("ANI:" + map.animation);
    map.toAdd.add(new Triangle(gfx, 500, 300, player, map,map.animation[0]));
    map.toAdd.add(new Triangle(gfx, 600, 300, player, map,map.animation[0]));
    //map.toAdd.add(new Triangle(gfx, 700, 300, player, map));
    
    return true;
  }
}

