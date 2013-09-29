public class Square extends Shape {
  Square(PApplet gfx, float x, float y, Player player, Map map, Gif animation) {
    super(gfx, x, y, player, 4, map, animation);
    float h = sqrt(size*size + (size/2)*(size/2));
    float f = (h/2 + h)/2;
    float g = f - h/2;
    /*
     corners[0] = new PVector(-f,-h/2);
     corners[1] = new PVector(g,-h/2);
     corners[2] = new PVector(f,h/2);
     corners[3] = new PVector(-g/2,h/2);
    */
    
    float r = findr(6,size);
    float R = findR(6,size);
    
    PVector moveCenter = new PVector(-size/2, -r);
    moveCenter.mult(0.5);
    
    corners[0] = PVector.sub(new PVector(-size/2, -r),moveCenter);
    corners[1] = PVector.sub(new PVector(size/2, -r),moveCenter);
    corners[2] = PVector.sub(new PVector(0.01, 0),moveCenter);
    corners[3] = PVector.sub(new PVector(-size, 0),moveCenter);
    
  }

  boolean killMe() {
    map.toRemove.add(this);
    return true;
  }
}

