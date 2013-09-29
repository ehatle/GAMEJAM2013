class Player {
  float x, y, size;
  int score;
  int currentAnim;
  Gif[] animation;
  PVector velocity;
  public Player(PApplet gfx) {
    animation = new Gif[7];
    score = 0;
    this.x = width/2;
    this.y = height/2;
    for (int i = 0; i <7; i++) animation[i] = new Gif(gfx, "gifs/player" + Integer.toString(i) + ".gif");
    animation[0].loop();
    this.size = 100;
  }
  void update(PVector v){
    x+=v.x;
    y+=v.y;
    float easing = 0.05;
    float target = width/2;
    float d = target - x;
    if(abs(d) > 1){
      x += d*easing;
    }
    target = height/2;
    d = target - y;
    if(abs(d) > 1){
      y += d*easing;
    }
  }
  void killMe(){
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
    image(animation[currentAnim], x, y, size, size);
  }
}

