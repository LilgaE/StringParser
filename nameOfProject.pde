Snow[] s = new Snow[500];
Smoke[] sm = new Smoke[500];
boolean addWind= false;
boolean stop=false;
boolean re =false;
float x=0;
float y=0;

void setup(){
  size(500, 500);
  noStroke();
  smooth();
  cursor(HAND);
  frameRate(60);
  for(int i =0; i<s.length; i++){
   s[i]= new SnowFlake(); 
  }
  for(int i =0; i<sm.length; i++){
   sm[i]= new Smoke(); 
  }
  
  
  
}
void draw(){
  background(0);
  fill(122, 122, 122);
 
 if(stop){
  pileUp(); 
 }

 for(int i=0; i<s.length; i++){
  s[i].move();
  s[i].show();
  if(s[i].getSpeed()>10){
   stop=true;
  }
 }
  for(int i=0; i<sm.length; i++){
  sm[i].move();
  sm[i].show();
  }

  //--------------------------------------------------------- TREE
  fill(153, 76, 0);
  rect(400, 440, 30, 60);
  fill(0, 112, 0);
  triangle(350, 450, 410, 200, 475, 450);
  //---------------------------------------------------------- LIGHTS 
  fill((float)Math.random()*255, (float)Math.random()*255, (float)Math.random()*255);
  ellipse(350, 450, 10, 10);
  ellipse(365, 425, 10, 10);
  ellipse(390, 390, 10, 10);
  ellipse(415, 300, 10, 10);
  ellipse(400, 430, 10, 10);
  ellipse(420, 350, 10, 10);
  ellipse(475, 450, 10, 10);
  ellipse(430, 370, 10, 10);
  ellipse(460, 400, 10, 10);
  ellipse(450, 420, 10, 10);
  ellipse(415, 250, 10, 10);
  ellipse(390, 320, 10, 10);

  //--------------------------------------------------- STAR
  fill(255, 255, (float)Math.random()*255);
  pushMatrix();
  translate(410, 210);
  rotate(frameCount*100);
  star(0, 0, 10, 1000, 1000); 
  popMatrix();
  //-------------------------------------------------HOUSE
  fill(135,206,250);
  rect(0, 350, 150, 400);
  fill(203,65,84);
  rect(100,250,40,90);
  fill(139, 79, 29);
  triangle(55, 250, 200, 380, -80, 380);
  fill(255,255,(float)Math.random()*255);
  rect(80, 400, 30, 30);  
  fill(139,79, 29);
  rect(35,450,30,100);
  
  //-------------------------------------------------TEXT
  fill(255,0,0);
  textSize(64);
  text("HAPPY",100,100);
  fill(0,255,0);
  text("HOLIDAYS",150,150);
}
 void mousePressed() {
  if (mouseButton == LEFT) {
    addWind= true;
  }
  if (mouseButton == RIGHT) {
    addWind= false;
    x=0;
    y=0;
  }
  
}
 
 void pileUp(){
   fill(255,255,255);
   
   x+=4.6;
   y+=4.6;
   ellipse(1300,1300,x,y);
  
   
 }
 interface Snow{
  void move();
  void show();
 float getSpeed();
  
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

class Smoke implements Snow {

  float xPos;
  float yPos;
  float speed;
  float size;
  float speedX;
  float vel;

  Smoke() {
    xPos=random(100, 140);
    yPos=random(800, 200);
    speed=random(-3, -2);
    size= random(1, 5);
    speedX= random(-1.5, 1.5);
    vel=.02;
  }



  void move() {
    if (addWind) {
      speedX+=vel;
    }

    if (yPos<=0) {
       yPos=random(300, 250);
       xPos=random(100, 140);
    }
    if (xPos<=100 && yPos>250||xPos>=140 && yPos>250) {
       xPos=random(100, 140);
    }
    yPos+=speed;
    xPos+=speedX;
  }

  void show() {
    fill(144, 144, 144);
    ellipse(xPos, yPos, size, size);
  }

  float getSpeed() {
    return speedX;
  }
}

class SnowFlake implements Snow{
  
  float xPos;
  float yPos;
  float speed;
  float size;
  float speedX;
  float vel;
  
  SnowFlake(){
    xPos=random(0,1000);
    yPos= random(-1000,-100);
    speed=random(2,8);
    size= random(1,5);
    speedX= random(-1.5,1.5);
    vel=.02;
  }
  
  
  
  void move(){
   if(addWind){
     speedX+=vel;
   }
  
    if(yPos>=500){
     yPos=random(-100,0); 
    }
    if(xPos>=500){
      xPos=random(-600,0);
    }
    yPos+=speed;
    xPos+=speedX;
   
  }
  
  void show(){
    fill(255,255,255);
    ellipse(xPos, yPos, size, size);
    
    
  }
  
  float getSpeed(){
   return speedX; 
  }
  
}
