class Triangle extends Shape {
  public Triangle(PApplet gfx, float x,float y, Player player, Map map, Gif animation) {
    super(gfx, x, y, player, 3, map,animation);
    float r = findr(3,size);
    float R = findR(3,size);
    corners[0] = new PVector(0, -R);
    corners[1] = new PVector(-size/2, r);
    corners[2] = new PVector(size/2, r);
  }

  boolean killMe() {
    map.toRemove.add(this);
    player.score += 10;
    println("Player score:" + player.score);
    /*
    int rand = (int)random(1, 100);
     if(rand <= 5){
     map.shapes.add(new Triangle(gfx,200, 300,player, map)); 
     }
     */
    return true;
  }
}

