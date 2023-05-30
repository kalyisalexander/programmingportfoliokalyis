class Laser {
  int x, y, w, h, speed;
  color c1;
  //constructor
  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    w=4;
    h=12;
    speed=10;
    c1=color(200, 22, 22);
  }
  void display() {
    noStroke();
    fill(c1);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y-=speed;
  }
  boolean reachedTop() {
    if (y< -10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect() {
    return true;
  }
  boolean intersect(Rock rock) {
    float d=dist(x, y, rock.x, rock.y);
    if (d<40) {//refine collsion dection
      return true;
    } else {
      return false;
    }
  }
}
