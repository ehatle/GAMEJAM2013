import gifAnimation.*;
Gif animation;

float x;
void setup() {
  animation = new Gif(this, "../../gifs/tria-copy.gif");
  animation.loop();
  size(400, 400);
  if (frame != null) {
    frame.setResizable(true);
  }
  x = 255;
}
void draw() {
  tint(0,255, 0);
  image(animation, width/4, height/4, width/2, height/2);
}

