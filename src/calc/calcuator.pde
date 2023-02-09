//Kalyis Alexander|| Oct,27,22
Button []numsButtons=new Button[10];
Button[]opButton=new Button[11];
String dVal ="0.0";
float l, r, result;
char op = ' ';
boolean left=true;
void setup() {
  size(450, 500);
  fill(#A16CFF);
  numsButtons[0]= new Button(85, 420, 180, 60, '0');
  numsButtons[1]= new Button(35, 350, 60, 60, '1');
  numsButtons[2]= new Button(105, 350, 60, 60, '2');
  numsButtons[3]= new Button(180, 350, 60, 60, '3');
  numsButtons[4]= new Button(35, 280, 60, 60, '4');
  numsButtons[5]= new Button(105, 280, 60, 60, '5');
  numsButtons[6]= new Button(180, 280, 60, 60, '6');
  numsButtons[7]= new Button(35, 210, 60, 60, '7');
  numsButtons[8]= new Button(105, 210, 60, 60, '8');
  numsButtons[9]= new Button(180, 210, 60, 60, '9');
  opButton[0]=new Button(225, 420, 60, 60, '.');
  opButton[1]=new Button(295, 420, 60, 60, '=');
  opButton[2]=new Button(255, 350, 60, 60, '+');
  opButton[3]=new Button(255, 280, 60, 60, '-');
  opButton[4]=new Button(255, 210, 60, 60, '*');
  opButton[5]=new Button(35, 140, 60, 60, 'c');
  opButton[6]=new Button(180, 140, 60, 60, '÷');
  opButton[7]=new Button(105, 140, 60, 60, 'π');
  opButton[8]=new Button(255, 140, 60, 60, '?');
  opButton[9]=new Button(360, 140, 60, 60, '?');
  opButton[10]=new Button(430, 140, 60, 60, '%');
}


void draw() {
  background(180);
  updateDisplay();
  for (int i=0; i<numsButtons.length; i++) {

    numsButtons[i].display();
    numsButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButton.length; i++) {
    opButton[i].display();
    opButton[i].hover(mouseX, mouseY);
  }
}
void keyPressed() {
  println("key:" + key);
  println("keyCode;" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 107) {
    handleEvent("+", false);
    //number 2
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("0", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 58 || keyCode == 106) {
    handleEvent("10", true);
  } else if (keyCode == 109 || keyCode == 45) {
    handleEvent("-", false);
  } else if (keyCode == 98 || keyCode == 106) {
    handleEvent("X", false);
  } else if (keyCode == 111) {
    handleEvent("/", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 20) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    left = false;
    dVal = "0.0";
  } else if (val.equals("-")) {
    op = '-';
    left = false;
    dVal = "0.0";
  } else if (val.equals("/")) {
    op = '/';
    left = false;
    dVal = "0.0";
  } else if (val.equals("=")) {
    peformCalculation(); 
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}


void mouseReleased() {
  for (int i=0; i<numsButtons.length; i++) {
    if (numsButtons[i].on) {
      handleEvent(str(numsButtons[i].val), true);
    }
  }
  for (int i=0; i<opButton.length; i++) {
    if (opButton[i].on && opButton[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButton[i].on && opButton[i].val == '+') {
      handleEvent("+", false);
    } else if (opButton[i].on && opButton[i].val == '.') {
      handleEvent(".", false);
    } else if (opButton[i].on && opButton[i].val == '=') {
      handleEvent("=", false);
    } else if (opButton[i].on && opButton[i].val == '-') {
      handleEvent("-", false);
    } else if (opButton[i].on && opButton[i].val == 'x') {
      handleEvent(".", false);
    } else if (opButton[i].on && opButton[i].val == '/') {
      handleEvent("/", false);
    } else if (opButton[i].on && opButton[i].val == 'π') {
      if (left == true) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButton[i].on && opButton[i].val == 's') {
      if (left == true) {
        l = l*l;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButton[i].on && opButton[i].val == '±') {
      if (left == true) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButton[i].on && opButton[i].val == '%') {
      if (left == true) {
        l = l/100;
        dVal = str(l);
      } else {
        r = l/100;
        dVal = str(r);
      }
    }
    println("L:" + l + "Op:" + op + "R:" + r + "Result:" + result + "Left:" + left);
  }
}

void updateDisplay() {
  rectMode(CENTER);
  rect(width/2, 60, width-20, 90, 10);
  fill(255);
  textAlign(RIGHT);
  text(dVal, width-40, 50);
}

void peformCalculation () {
  if (op== '+') {
    result=l+r;
  } else if (op== '-') {
    result=l-r;
  } else if (op== '*') {
    result=l*r;
  } else if (op== '/') {
    result=l/r;
  }
  dVal=str(result);
  l =result;
  left=true;
}
