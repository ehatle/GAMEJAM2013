class Player {
  float x, y, size;
  int score;
  int currentAnim;
  Gif[] animation;
  PVector velocity;
  
  // punkter brukt til hittesting
  PVector[] hitPoints;
  
  public Player(PApplet gfx) {
    animation = new Gif[8];
    score = 0;
    this.x = width/2;
    this.y = height/2;
    for (int i = 0; i <7; i++) animation[i] = new Gif(gfx, "gifs/player" + Integer.toString(i) + ".gif");
    animation[0].loop();
    animation[7] = new Gif(gfx, "gifs/playerdeath.gif");
    this.size = 50;
    
    hitPoints = generateHitPoints(8);
  }
  void update(){
    x+=velocity.x;
    y+=velocity.y;
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
      animation[currentAnim].stop();
      animation[7].play();
      currentAnim = 7;
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
    if (newAnim != currentAnim && currentAnim < 7) {
      animation[currentAnim].stop();
      currentAnim = newAnim;
      animation[currentAnim].loop();
    }
    image(animation[currentAnim], x, y, size*2, size*2);
    /*
    stroke(0,255,0);
    strokeWeight(4);
     for (PVector v:hitPoints){
       point(v.x+x,v.y+y);
     }
    stroke(0,0,0);
    strokeWeight(1);*/
  }
  
  PVector[] generateHitPoints(int n){
    PVector[] h = new PVector[n];
    float r = TAU/n;
    for (int i = 0; i < n; i++){
       h[i] = new PVector(0,size/2);
       h[i].rotate(r*i);
    }
    return h;
  }
}

