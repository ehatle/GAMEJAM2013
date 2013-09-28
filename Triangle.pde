class Triangle extends Shape {

  public Triangle(PApplet gfx, float x, float y, Player player, Map map) {
    super(gfx, x, y, player, 3, map);
    float h = sqrt(size*size + (size/2)*(size/2));
    corners[0] = new PVector(0, -h/2);
    corners[1] = new PVector(-size/2, h/2);
    corners[2] = new PVector(size/2, h/2);
    this.gifPath = "gifs/tria-copy.gif";
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

