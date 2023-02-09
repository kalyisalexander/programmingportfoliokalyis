// Kalyis Alexander || Oct 4,2022|| Etchasketch
int x, y;

void setup() {
  size(500, 500);
  x=width/2;
  y= height/2;
  background(185);
}

void draw() {
  stroke(0);
  strokeWeight(3);
  if(x>=width){
  x=width/2;
  x=0;
  }
  if (keyPressed) {
    if (key=='w' || key=='W') {
      moveUp(5);
    } else if (key=='a' || key=='A') {
      moveLeft(5);
    } else if (key=='s' || key=='s') {
      moveRight(5);
    } else if (key=='d' || key=='D') {
      moveDown(5);
    }
  }
}

void mousePressed() {

  saveFrame("image-######.png");
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      moveUp(5);
    } else if (keyCode==DOWN) {
      moveDown(5);
    } else if (keyCode==LEFT) {
      moveLeft(5);
    } else if (keyCode==RIGHT) {
      moveRight(5);
    }
  }
}
void moveRightDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y+i);
  }
  x=x+rep;
  y=y+rep;
}

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y );
  }
  x = x + rep;
}
void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y );
  }
  x = x - rep;
}
void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-1 );
  }
  y = y - rep;
}
void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i );
  }
  y= y + rep;
}
