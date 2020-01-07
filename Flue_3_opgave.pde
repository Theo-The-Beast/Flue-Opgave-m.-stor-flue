ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup() {
  size(810, 600);
}

// I draw ser vi et loop, som tilføjer en plads, og tegner en ny flue på den nu nye plads.
void draw() {
  fill(255,0,0);
  clear();
  for (int i=0; i<flueListe.size(); i++) {
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
    
  }
}

void keyPressed() {
  if (key=='e') {
    flueListe.add(new Flue(1.8));
  } else {
    flueListe.add(new Flue());
  }
}

void mousePressed() {
  flueListe.add(new Flue(mouseX, mouseY));
}

/////////////////////////////////////////////////////////
class Flue {
  int xSpeed = 3; 
  int ySpeed = 3;
  float positionX, positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  float size=1;
  int H = 599; 
  int W = 799;
  int x = 0;
  int y = 0; 

  Flue() {
    positionX  = random(0, height);
    positionY  = random(0, width);
    vinkel     = random(0, 2*PI);
  }

  Flue(float a, float b) {
    positionX = a;
    positionY = b;
    vinkel    = random(0, 2*PI);
  }

  Flue(float scale) {
    positionX  = random(0, height);
    positionY  = random(0, width);
    vinkel     = random(0, 2*PI);
    size=scale;
  }
  //Her sætter du fluernes fart, som den flyver med
  void flyt() {
    distanceFlyttet = distanceFlyttet + xSpeed;
  
  if ((cos(vinkel) * (distanceFlyttet*size)  + positionX) > width ||
      (cos(vinkel) * (distanceFlyttet*size)  + positionX) < 0) {
      xSpeed *= -1;
    }
     if ((sin(vinkel) * (distanceFlyttet*size)  + positionY) > height ||
      (sin(vinkel) * (distanceFlyttet*size)  + positionY) < 0) {
      xSpeed *= -1;
    }
}

  //Her bliver fluen tegnet
  void tegnFlue() {
    pushMatrix();
    translate(positionX, positionY);
    rotate(vinkel);
    translate(distanceFlyttet, 0);

    scale(size);

    ellipse(0, 0, 20, 8);
    ellipse(0, 0-8, 15, 10);
    ellipse(0, 0+8, 15, 10);
    ellipse(0+6, 0, 8, 8);
    popMatrix();
    x = x + xSpeed; 
    y = y + ySpeed; 

    if (positionX + 10 > W) { 
      xSpeed *= -1; 
      positionX = W -10;
    } //Højre side af kassen
    if (positionX - 10 < 0) { 
      xSpeed *= -1; 
      positionX = 0 + 10; //Venstre side af kassen
    }
    if (positionY + 10 > H) { 
      ySpeed *= -1; 
      positionY = H - 10;
    } //Nederste del af kassen
    if (positionY - 10 < 0) { 
      ySpeed *= -1; 
      positionY = 0 + 10; //Øverste del af kassen
    }
  }
}
//////////////////////////////////////////////////////
