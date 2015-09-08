/* 
 THIS IS SUPPOSE TO ADD UP ALL DIRECTION PIXEL CHANGES FOR TIMING THE END OF SKETCH...BUT IT'S NOT WORKING
 pixelMove_ALL.append(pixelCounter_S);
 pixelMove_ALL.add(0, pixelCounter_S);
 
 int pixelMove_ALL_0 = pixelMove_ALL.get(0);
 print("pixelMove_ALL_0:");
 println(pixelMove_ALL_0);
 */

float speed = 0;
float x2 = 0.75;
int happeningTime = 760320; //equivalent to 7.5mins or quarter of 30mins
IntList pixelMove_S;
IntList pixelMove_N;
IntList pixelMove_NE;
IntList pixelMove_E;
IntList pixelMove_W;
IntList pixelMove_ALL;

//boolean hearWhatMomSaid;
int tOrF = int(random(0, 2));


Balloon balloon_00;
Balloon balloon_01;
Balloon balloon_02;
Balloon balloon_03;
Balloon balloon_04;

void setup() {
  size(400, 400, P3D);
  noStroke();
  lights();

  balloon_00 = new Balloon(color(255, 0, 0, 150), random(20, 30), height/2+random(-10, 10), random(-100, 100), 
    0, 0, 10 );
  balloon_01 = new Balloon(color(255, 165, 0, 190), width/2+random(-10, 10), random(20, 30), random(-100, 100), 
    0, 0, 10 );
  balloon_02 = new Balloon(color(255, 255, 0, 190), width-random(20, 30), height/2+random(-10, 10), random(-100, 100), 
    0, 0, 10);
  balloon_03 = new Balloon(color(0, 255, 0, 190), width/2-random(-10, 10), height-random(-10, 10), random(-100, 100), 
    0, 0, 10);
  balloon_04 = new Balloon(color(0, 0, 255, 150), random(100, 140), height-random(-10, 10), random(-100, 100), 
    0, 0, 10);

  pixelMove_S = new IntList();
  pixelMove_N = new IntList();
  pixelMove_E = new IntList();
  pixelMove_W = new IntList();
  pixelMove_NE = new IntList();
  pixelMove_ALL = new IntList();
}

void draw() {
  lights();
  background(255);
  pointLight(51, 102, 255, 65, 60, 100); 
  pointLight(200, 40, 60, -65, -60, -150);

  balloon_00.display_E();
  balloon_01.display_S();
  balloon_02.display_X_W();
  balloon_03.display_Y_N();
  balloon_04.display_Y_NE();

  println(tOrF);
}

class Balloon {
  color c;
  float xpos;
  float ypos;
  float zpos;
  float xspeed;
  float yspeed;
  float dia;
  float gravity = 0.01;
  float bloat = 0.1;
  int beginGetX; 
  int beginGetY; 
  int changeE;
  int changeS;
  int changeW;
  int changeN;
  int changeNE_y;
  int changeNE_x;
  int pixelCounter_N;
  int pixelCounter_NE;
  int pixelCounter_S;
  int pixelCounter_E;
  int pixelCounter_W;

  float i;
  float r;
  float theta;
  float theta_vel;
  float theta_acc;

  Balloon(color tempC, float tempXpos, float tempYpos, float tempZpos, 
    float tempXspeed, float tempYspeed, float tempDia) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    zpos = tempZpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
    dia = tempDia;
    beginGetX = int(xpos);
    beginGetY = int(ypos);
    r = height*0.05;
    theta = 0;
    theta_vel = 0;
    theta_acc = 0.0001;
  }

  void display_S() {
    ypos = ypos + yspeed;
    yspeed = yspeed + gravity;
    noStroke();
    fill(c);
    pushMatrix();
    translate(xpos, ypos, zpos);
    int getX = int(xpos);
    int getY = int(ypos);
    /*
    print("this is S X-center pixel");
     println(getX);
     print("this is S Y-center pixel");
     println(getY);
     */
    sphere(dia);
    popMatrix();

    if ((ypos>height/2-20)||(ypos>height/2+20)) {
      yspeed *= -x2;
      x2 = x2+0.01*gravity;
    }

    int changeS = -(getY-height/2+10) ;
    /*  print("changeS = ");
     println(changeS);
     */
    if (changeS<15) {
      dia = dia+bloat;
    }
    if (dia>50) {
      dia *= -1;
    }

    // println(pixelList);
    pixelMove_S.append(changeS);
    pixelMove_S.add(0, changeS);
    //println(pixelMove); 
    //pixelMove.add(1,changeS);

    int pixelCounter_S = pixelMove_S.get(0);
    if (pixelCounter_S > happeningTime/8) {
      dia = 10;
    }
    if ((tOrF == 0)&&(pixelCounter_S > happeningTime/8)) {
      gravity =-10;
      println("this worked!");
      exit(); //<-- if Julia had chosen to not hear what I had to tell her
    }
    print("pixelCounter_S is = ");
    println(pixelCounter_S);

    if ((tOrF == 1)&&(pixelCounter_S > happeningTime/7)) {
      //println("this worked :N!");


      frameRate(10);
      c = color(random(255), random(255), random(255));
      // println(i);
      //debate would he or would he not if()? <---make changing colors happen
    }

    if (pixelCounter_S > happeningTime/6) {
      println("now julia is embarrassed");
      translate(width/2, height/2);
      xpos = r* cos(theta);
      ypos = r* sin(theta);
      theta_vel += theta_acc;
      theta+= theta_vel;
      //xpos = xpos + xspeed;
      //xspeed = random(-1, 1)*xspeed + gravity;
    }
  }

  void display_Y_N() {

    ypos = ypos - yspeed;
    yspeed = yspeed + gravity;
    noStroke();
    fill(c);
    pushMatrix();
    translate(xpos, ypos, zpos);

    int getX = int(xpos);
    int getY = int(ypos);
    /*
    print("this is N X-center pixel");
     println(getX);
     print("this is N Y-center pixel");
     println(getY);
     */
    sphere(dia);
    popMatrix();

    if ((ypos<height/2-20)||(ypos<height/2+20)) {
      yspeed *= -x2;
      x2 = x2+0.01*gravity;
    }

    int changeN = (getY-height/2) ;
    /*    print("changeN = ");
     println(changeN);
     */
    if (changeN<30) {
      dia = dia+bloat;
    }
    if (dia>50) {
      dia *= -1;
    }

    // println(pixelList);
    pixelMove_N.append(changeN);
    pixelMove_N.add(0, changeN);
    //println(pixelMove); 
    //pixelMove.add(1,changeS);

    int pixelCounter_N = pixelMove_N.get(0);
    if (pixelCounter_N > happeningTime/8) {
      dia = 10;
    }

    if ((tOrF == 0)&&(pixelCounter_N > happeningTime/8)) {
      gravity =-10;
      // println("this worked :N!");
    }
    //println(pixelCounter_N);

    if ((tOrF == 1)&&(pixelCounter_N > happeningTime/7)) {
      //println("this worked :N!");

      //frameRate(10);
      c = color(random(255), random(255), random(255));
      //  println(i);

      //debate would he or would he not if()?
    }
    if (pixelCounter_N > happeningTime/6) {
      //println("now julia is embarrassed");
      translate(width/2, height/2);
      xpos = r* cos(theta);
      ypos = r* sin(theta);
      theta_vel += theta_acc;
      theta+= theta_vel;
    }
  }

  void display_Y_NE() {
    ypos = ypos - yspeed;
    yspeed = yspeed + gravity;
    xpos = xpos + xspeed/2;
    xspeed = xspeed + gravity;
    noStroke();
    fill(c);
    pushMatrix();
    translate(xpos, ypos, zpos);

    int getX = int(xpos);
    int getY = int(ypos);
    /*
    print("this is NE X-center pixel");
     println(getX);
     print("this is NE Y-center pixel");
     println(getY);
     */
    sphere(dia);
    popMatrix();

    if ((ypos<height/2+20)&&(xpos>width/2+10)) {
      yspeed *= -x2;
      xspeed *= -x2;
      x2 = x2+0.01*gravity;
    }

    int changeNE_y = (getY-height/2) ;
    /*    print("changeNE_y = ");
     println(changeNE_y);
     */
    int changeNE_x = -(getX-width/2+50);
    /*     print("changeNE_x =");
     println(changeNE_x);
     */
    if ((changeNE_y<35)&&(changeNE_x<5)) {
      dia = dia+bloat;
    }
    if (dia>50) {
      dia *= -1;
    }

    // println(pixelList);
    pixelMove_NE.append(changeNE_x);
    pixelMove_NE.add(0, changeNE_x);
    //println(pixelMove); 
    //pixelMove.add(1,changeS);

    int pixelCounter_NE = -(pixelMove_NE.get(0));
    if (pixelCounter_NE > happeningTime/8) {
      dia = 10;
    }
    // print("pixelCounter_NE:");
    // println(pixelCounter_NE);

    if ((tOrF == 0)&&(pixelCounter_NE > happeningTime/8)) {
      gravity =-10;
      // println("this worked :NE!");
      //particle something?
    }

    if ((tOrF == 1)&&(pixelCounter_NE > happeningTime/7)) {

      //frameRate(10);
      c = color(random(255), random(255), random(255));
      //  println(i);
      //debate would he or would he not if()?
    }
    if (pixelCounter_NE > happeningTime/6) {
      //println("now julia is embarrassed");
      translate(width/2, height/2);
      xpos = r* cos(theta);
      ypos = r* sin(theta);
      theta_vel += theta_acc;
      theta+= theta_vel;
    }
  }


  void display_E() {
    xpos = xpos + xspeed;
    xspeed = xspeed + gravity;
    noStroke();
    fill(c);
    pushMatrix();
    translate(xpos, ypos, zpos);

    int getX = int(xpos);
    int getY = int(ypos);
    /*
    print("this is E X-center pixel");
     println(getX);
     print("this is E Y-center pixel");
     println(getY);
     */
    sphere(dia);
    popMatrix();

    if (xpos>width/2-10) {
      xspeed *= -x2;
      x2 = x2-0.01*gravity;
    }

    int changeE = -(getX - width/2);
    // print("changeE =");
    //println(changeE);

    // print("this is xpos:");
    // println(xpos);     


    if (changeE<20) {
      dia = dia+bloat;
    }
    if (dia>50) {
      dia *= -1;
    }

    // println(pixelList);
    pixelMove_E.append(changeE);
    pixelMove_E.add(0, changeE);
    //println(pixelMove); 
    //pixelMove.add(1,changeS);

    int pixelCounter_E = pixelMove_E.get(0);
    if (pixelCounter_E > happeningTime/8) {
      dia = 10;
    }
    // println(pixelCounter_E);

    if ((tOrF == 0)&&(pixelCounter_E > happeningTime/8)) {
      gravity =-10;
      //  println("this worked :E!");
    }

    if ((tOrF == 1)&&(pixelCounter_E > happeningTime/7)) {
      //   println("this worked :E!");

      //frameRate(10);
      c = color(random(255), random(255), random(255));
      //   println(i);

      //debate would he or would he not if()?
    }

    if (pixelCounter_E > happeningTime/6) {
      //println("now julia is embarrassed");
      translate(width/2, height/2);
      xpos = r* cos(theta);
      ypos = r* sin(theta);
      theta_vel += theta_acc;
      theta+= theta_vel;
    }
  }

  void display_X_W() {
    xpos = xpos - xspeed;
    xspeed = xspeed + gravity;
    noStroke();
    fill(c);
    pushMatrix();
    translate(xpos, ypos, zpos);

    int getX = int(xpos);
    int getY = int(ypos);
    /*
    print("this is W X-center pixel");
     println(getX);
     print("this is W Y-center pixel");
     println(getY);
     */
    sphere(dia);
    popMatrix();

    if ((xpos<width/2-20)||(xpos<width/2+20)) {
      xspeed *= -x2;
      x2 = x2-0.01*gravity;
    }

    int changeW = (getX - width/2+10);
    /*    print("changeW =");
     println(changeW);
     
     print("this is xpos:");
     println(xpos);     
     */

    //println(dia);
    if (changeW<35) {
      dia = dia+bloat;
    }
    if (dia>50) {
      dia *= -1;
    }

    // println(pixelList);
    pixelMove_W.append(changeW);
    pixelMove_W.add(0, changeW);
    //println(pixelMove); 
    //pixelMove.add(1,changeS);

    int pixelCounter_W = pixelMove_W.get(0);
    if (pixelCounter_W > happeningTime/8) {
      dia = 10;
    }
    //println(pixelCounter_E);
    if ((tOrF == 0)&&(pixelCounter_W > happeningTime/8)) {
      gravity =-10;
      //   println("this worked :W!");
    }

    if ((tOrF == 1)&&(pixelCounter_W > happeningTime/7)) {
      //   println("this worked :W!");

      //frameRate(10);
      c = color(random(255), random(255), random(255));
      //   println(i);

      //debate would he or would he not if()?
    }
    if (pixelCounter_W > happeningTime/6) {
      //println("now julia is embarrassed");
      translate(width/3, height/3);
      xpos = r* cos(theta);
      ypos = r* sin(theta);
      theta_vel += theta_acc;
      theta+= theta_vel;
    }
    //adding N,S,E,W,NE pixelCounters together
  }
}