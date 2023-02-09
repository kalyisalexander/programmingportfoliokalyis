class Button {
  //member Variables
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on;

  //Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.val=val;
    c1 =color(#531EAF);
    c2=color(#A16CFF);
    on = false;
  }
  //member methods
  void display() {
    if (on) {
      fill(c2);
    } else {

      fill(c1);
    }

    rect(x, y, w, h, 8);
    fill(#FA05FF);
    textAlign(CENTER);
    text(val, x+10, y+10);
    textSize(20);
  }
  void hover(int mx, int my) {
    on =(mx>x-w/2&&mx<x+w/2 &&my>y-h/2&&my<y+h/2);
  }
}
