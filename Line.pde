public class Line {
  int x1, x2, y1, y2;
  public Line(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
  }
  void draw() {
    fill(255);
    line(x1, y1, x2, y2);
  }
  int[] point1() {
    int[] p = {
      x1, y1
    };
    return p;
  }
  int[] point2() {
    int[] p = {
      x2, y2
    };
    return p;
  }
  public PVector lineIntersection(Line l) {
    return lineIntersection(x1, y1, x2, y2, l.x1, l.y1, l.x2, l.y2);
  }
  public PVector lineIntersection(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4) {
    //returns intersection between two lines (defined by x1,y1,x2,y2 and x3,y3,x4,y4)
    int denominator = ((x1-x2) * (y3-y4)) - ((y1-y2) * (x3-x4));
    if (denominator == 0) return null;
    //returns false if the lines are parallell

    //  int first = (x1 * y2 - y1 * x2) * (x3 - x4) - ((x1 - x2) * (x3 * x4 - y3 * x4));
    // int second = (x1*x2 - y1*x2) - ((y1-y2)*(x3*y4-y3*x4));

    PVector point = new PVector(
      //first/denominator, second/denominator
      ((x1 * y2 - y1 * x2) * (x3 - x4) - ((x1 - x2) * (x3 * x4 - y3 * x4)))/denominator, ((x1*x2 - y1*x2) - ((y1-y2)*(x3*y4-y3*x4)))/denominator
    );
    return point;
  }
}

