Particle [] group;
void setup()
{
  size(500, 500);
  frameRate(75);
  background(0);
  group = new Particle[100];
  for(int i =0; i < group.length; i++){
    group[i] = new OddballParticle();
  }
  for(int i =0; i < 50; i++){
    group[i] = new Particle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < group.length; i++){
    group[i].move();
    group[i].show();
  }
}
class Particle
{
  int myColor;
  double myAngle, mySpeed, myX, myY;
  Particle(){
    myX = 250.0;
    myY = 250.0;
    myColor = color((int)(Math.random()*256+100), (int)(Math.random()*256+100), (int)(Math.random()*256+100));
    mySpeed = Math.random()*10;
    myAngle = Math.random()*PI*2;
  }
  void show(){
    fill(myColor);
    noStroke();
    ellipse((float)myX, (float)myY, 10.0, 10.0);
  }
  public void move(){
    myX = (Math.cos(myAngle)*mySpeed + myX);
    myY = (Math.sin(myAngle)*mySpeed + myY);
    myAngle = myAngle + 0.038;
    if(mouseButton == LEFT){
      mySpeed += 0.05;
    }
    if(mouseButton == RIGHT){
      mySpeed -= 0.05;
    }
    if(myX>450 || myX<250 || myY>50 || myY<250){
      mySpeed = -3;    
    }
     if(myX == 350){
      mySpeed = 3;
    }
  }
}

class OddballParticle extends Particle
{
  OddballParticle() {
    myX = 250;
    myY = 250;
    myColor = color((int)(Math.random()*256+100), (int)(Math.random()*256+100), (int)(Math.random()*256+100));
    mySpeed = 1;
    myAngle = 0;
  }
  void show(){
    fill(myColor);
    noStroke();
    ellipse((float)myX, (float)myY, 20.0, 20.0);
  }
  public void move(){
    myX = (Math.cos(myAngle)*mySpeed + myX);
    myY = (Math.sin(myAngle)*mySpeed + myY);
    myAngle += 0.038;
    if(mouseButton == LEFT){
      mySpeed += 0.05;
    }
    if(mouseButton == RIGHT){
      mySpeed -= 0.05;
    }
    if(myX == 350){
      mySpeed = 3;
    }
  }
}
