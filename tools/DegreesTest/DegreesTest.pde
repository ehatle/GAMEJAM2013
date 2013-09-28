PVector v;
void setup() {
  size(450, 450);
}
void draw() {
  background(255);
  line(width/2, height/2, mouseX, mouseY);
  v = new PVector(mouseX-width/2, mouseY-height/2);
  float r = v.heading();
  float d = degrees(r);
  fill(0);
  text("Radians: " + Float.toString(r), 0, height-10);
  text("Degrees: " + Float.toString(d), width-120, height-10);
  String x ="";
  if (r > ((1/8)*(-1))*PI) {
    if (r < 1/8*PI) {
      x = "R: E";
    } 
    else if (r <= (3/8)*PI) {
      x = "R: SE";
    } 
    else if (r <= (5/8)*PI) {
      x = "R: S";
    } 
    else if (r <= (7/8)*PI) {
      x = "R: SW";
    } 
    else {
      x = "R: W1";
    }
  } 
  else {
    if (r >= -1*(3/8)*PI) {
      x = "R: NE";
    } 
    else if (r >= -1*(5/8)*PI) {
      x = "R: N";
    } 
    else if (r>= -1*(7/8)*PI) {
      x = "R: NW";
    }
    else {
      x = "R: W2";
    }
  }
  String xd ="";
  if (d > -22.5) {
    if (d < 22.5) {
      xd = "D: E";
    } 
    else if (d <= 67.5) {
      xd = "D: SE";
    } 
    else if (d <= 112.5) {
      xd = "D: S";
    } 
    else if (d <= 157.5) {
      xd = "D: SW";
    } 
    else {
      xd = "D: W1";
    }
  } 
  else {
    if (d >= -67.5) {
      xd = "D: NE";
    } 
    else if (d >= -112.5) {
      xd = "D: N";
    } 
    else if (d>= -157.5) {
      xd = "D: NW";
    }
    else {
      xd = "D: W2";
    }
  }
  text(x, width/2, height-10);
  text(xd, width/2, height-30);
}

