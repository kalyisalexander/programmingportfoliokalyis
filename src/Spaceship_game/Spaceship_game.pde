// Kalyis Alexander|| Spaceship game||Nov 29,22
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Ship s1;
Timer rockTimer, puTimer;
Star []stars=new Star[200];
int score, level;
boolean play;

void setup() {
  size(800, 800);
  s1=new Ship();
  rockTimer=new Timer(500);
  rockTimer.start();
  puTimer=new Timer(50000);
  puTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i]=new Star();
  }
  score=0;
  level=1;
  play=false;
}
void draw() {
  background(0);

  // render Stars
  for (int i=0; i<stars.length; i++) {
    stars[i].display();
    stars[i].move();
  }
  noCursor();
  //powerups
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());
    puTimer.start();
  }
  //render powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    if (pu.intersect(s1)) {
      if (pu.type=='H') {
        s1.health+=100;
      } else if (pu.type=='T') {
        //s1.turrentCount++;
      }
      powerups.remove(pu);
    }
    if (pu.reachedBottom()) {
      powerups.remove(pu);
    } else {
      pu.display();
      pu.move();
      println(powerups.size());
    }
  }
  //adding rocks
  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
  }


  //render rocks
  for (int i = 0; i < rocks.size(); i++) {
    Rock r = rocks.get(i);
    if (s1.intersect(r)) {
      s1.health-=r.diam;
      score+=r.diam;
      //todo;make an explosion sound and animation
      //todo:add health to rocks
      rocks.remove(r);
    }
    if (r.reachedBottom()) {
      rocks.remove(r);
    } else {
      r.display();
      r.move();
      println(rocks.size());
    }
  }


  //render Lasers
  for (int i = 0; i < lasers.size(); i++) {
    Laser l =lasers .get(i);
    for (int j=0; j<rocks.size(); j++) {
      Rock r= rocks.get(j);
      if (l.intersect(r)) {
        score+=100;
        //add explosion sound
        //add explosin
        lasers.remove(l);
        rocks.remove(r);
      }
    }
    if (l.reachedTop()) {
      rocks.remove(l);
    } else {
      l.display();
      l.move();
      println(rocks.size());
    }
  }
  //ship
  s1.display();
  s1.move(mouseX, mouseY);

  infoPanel();
}
void mousePressed() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println(lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println(lasers.size());
  }
}


void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(25);
  text("Score:"+ score +"Health"+s1.health+ "| level"+level+ "Ammo:"+s1.laserCount, 20, 40);
}
void startScreen() {
  background(0);
  fill(225);
  textAlign(CENTER);
  text("Press any key to start playing!", width/2, height/2);
}

void gameOver() {
}
