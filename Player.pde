class Player {
  float x, y;
  int currentAnim;
  Gif[] animation;
  public Player(PApplet gfx) {
    animation = new Gif[7];
    this.x = width/2;
    this.y = height/2;
    for (int i = 0; i <7; i++) {
      animation[i] = new Gif(gfx, "gifs/player" + Integer.toString(i) + ".gif");
    }
    animation[0].loop();
  }
  void draw(float r) {
    int newAnim;
    if (r ==10) {
      newAnim =0;
    }
    else {
      r = degrees(r);
      if (r > -22.5) {
        if (r < 22.5) {
          newAnim = 5;
        } 
        else if (r <= 67.5) {
          newAnim= 6;
        } 
        else if (r <= 112.5) {
          newAnim = 0;
        } 
        else if (r <= 157.5) {
          newAnim = 1;
        } 
        else {
          newAnim = 2;
        }
      } 
      else {
        if (r >= -67.5) {
          newAnim = 4;
        } 
        else if (r >= -112.5) {
          newAnim = 0;
        } 
        else if (r>= -157.5) {
          newAnim = 3;
        }
        else {
          newAnim = 2;
        }
      }
    }
    if (newAnim != currentAnim) {
      animation[currentAnim].stop();
      currentAnim = newAnim;
      animation[currentAnim].loop();
    }
    image(animation[currentAnim], x-35, y-35, 70.0, 70.0);
  }
}

