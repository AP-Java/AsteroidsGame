Spaceship bob = new Spaceship('w', 'a', 'd', 'e');
Spaceship chase = new Spaceship('i', 'j', 'l', 'o');
Stars [] andrew = new Stars[500];
ArrayList<Asteroids>  dan = new ArrayList<Asteroids>();
boolean bobAccelerate = false;
boolean bobTurnL = false;
boolean bobTurnR = false;
boolean chaseAccelerate = false;
boolean chaseTurnL = false;
boolean chaseTurnR = false;
int asteroidCount = 20;

public void settings() {
  size(900, 900);
}
public void setup() 
{


 for (int l = 0; l < andrew.length; l++)
 {
   andrew[l] = new Stars();
 }
for (int l = 0; l < asteroidCount; l++)
 {
   dan.add(new Asteroids());
   
 }
}
public void draw() 
{
 background(0);
 fill(200);
 rect(850,850,40,80);
 fill(138,2,0);
 triangle(bob.getX(),bob.getY(),bob.getX(),mouseY,mouseX,mouseY);
 for (int i = 0; i < andrew.length; i++)
 {
   andrew[i].show();
 }
 for (int i = 0; i < dan.size(); i++)
 {
   dan.get(i).show();
   dan.get(i).move();
 }
  bob.show();
  bob.move();
  float o = mouseX - bob.getX();
  float a = mouseY - bob.getY();
 
 if(mouseY>=bob.getY())
 	bob.setPointDirection (90 + (int)(( (atan(o/a) )* -57 )));
 else
 	bob.setPointDirection (270 + (int)(( (atan(o/a) )* -57 ))); 

 
//  chase.show();
//  chase.move();


if (bobAccelerate == true) {bob.accelerate(1);}
if ((bob.myDirectionX > 0 && bob.myDirectionX != 0) && (bobAccelerate == false)) {bob.accelerate(0);}

if (chaseAccelerate == true) {chase.accelerate(1);}

if (chaseTurnL == true) {chase.turn(-5);}

if (chaseTurnR == true) {chase.turn(5);}
}


public void keyPressed()
{
 if (key == bob.up) {bobAccelerate = true;}
 if (key == chase.up) {chaseAccelerate = true;}
 if (key == chase.left) {chaseTurnL = true;}
 if (key == chase.right) {chaseTurnR = true;}
 if (key == 'o') 
 {
   chase.setX( (int)(Math.random()*900) );
   chase.setY( (int)(Math.random()*900) );
   chase.setPointDirection( (int)(Math.random()*360) );
   chase.setDirectionX(0);
   chase.setDirectionY(0);
 }

 if (key == 'e') 
 {
   bob.setX( (int)(Math.random()*900) );
   bob.setY( (int)(Math.random()*900) );
   bob.setDirectionX(0);
   bob.setDirectionY(0);
 }

if (key == 'q') 
 {
  bob.accelerate(10);
 }
if (key == 'u') 
 {
  chase.accelerate(10);
 }

	

}


public void keyReleased()
{
 if (key == bob.up) {bobAccelerate = false;}
//  if (key == bob.left) {bobTurnL = false;}
//  if (key == bob.right) {bobTurnR = false;}
//  if (key == chase.up) {chaseAccelerate = false;}
//  if (key == chase.left) {chaseTurnL = false;}
//  if (key == chase.right) {chaseTurnR = false;}
}

