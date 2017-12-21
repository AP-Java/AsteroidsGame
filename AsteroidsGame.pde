
Spaceship bob = new Spaceship('w', 'a', 'd', 'e');
Spaceship chase = new Spaceship('i', 'j', 'l', 'o');
Stars [] andrew = new Stars[500];
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList<Asteroids>  dan = new ArrayList<Asteroids>();
boolean bobAccelerate = false;
boolean bobTurnL = false;
boolean bobTurnR = false;
boolean chaseAccelerate = false;
boolean chaseTurnL = false;
boolean chaseTurnR = false;
int asteroidCount = 20;
boolean shooting1 = false;
boolean shooting2 = false;
int score = 0;

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
 noFill();
 rect(710,850,180,40,10);
 stroke(138,2,0);
 fill(138,2,0);
 rect(mouseX-15,mouseY-1,30,2);
 rect(mouseX-1,mouseY-15,2,30);
 textSize(30);
 fill(255);
 text("Score: " + score, 730,880); 

 line((float)bob.getX(),(float)bob.getY(),mouseX,mouseY);
 stroke(0); 
for (int i = 0; i < andrew.length; i++)
 {
   andrew[i].show();
 }
 for (int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).show();
    bullets.get(i).move();
  }
 for (int i = 0; i < dan.size(); i++)
 {
   dan.get(i).show();
   dan.get(i).move();
	if (dist(dan.get(i).getX(), dan.get(i).getY(), bob.getX(), bob.getY()) < 25)
   	{
    	dan.remove(i);
    	score -= 1;
    }
 }
  bob.show();
  bob.move();
  float o = mouseX - bob.getX();
  float a = mouseY - bob.getY();
 
 if(mouseY>=bob.getY())
 	bob.setPointDirection (90 + (int)(( (atan(o/a) )* -57 )));
 else
 	bob.setPointDirection (270 + (int)(( (atan(o/a) )* -57 ))); 

if (bobAccelerate == true) {bob.accelerate(.1);}
if ((bob.myDirectionX > 0 && bob.myDirectionX != 0) && (bobAccelerate == false)) {bob.accelerate(0);}

if (chaseAccelerate == true) {chase.accelerate(.1);}

if (chaseTurnL == true) {chase.turn(-5);}

if (chaseTurnR == true) {chase.turn(5);}

if (shooting1 == true)
{
bullets.add(new Bullet(bob));
}
if (shooting2 == true)
{
bullets.add(new Bullet(chase));
} 


for(int l = 0; l < bullets.size(); l++)
  {
    for(int i = 0; i < dan.size(); i++)
      if(dist(bullets.get(l).getX(), bullets.get(l).getY(), dan.get(i).getX(), dan.get(i).getY()) < 20)
      {
        bullets.remove(l);
        if(dan.get(i).getColor() == 255)
        {
          dan.get(i).setColor(170);
        }
        else if (dan.get(i).getColor() == 170)
        {
          dan.get(i).setColor(85);
        }
        else
        {
          dan.remove(i);
          score += 100;
        }
      break;
      }
  }
}


public void keyPressed()
{
 if (key == bob.up) {bobAccelerate = true;}
 if (key == chase.up) {chaseAccelerate = true;}
 if (key == chase.left) {chaseTurnL = true;}
 if (key == chase.right) {chaseTurnR = true;}

 if  (key == SHIFT) 
 {
 	shooting1 = true;
 }

 if (key == SHIFT) 
 {
   bob.setX( (int)(Math.random()*900) );
   bob.setY( (int)(Math.random()*900) );
   bob.setDirectionX(0);
   bob.setDirectionY(0);
 }	

}


public void keyReleased()
{
 if (key == bob.up) {bobAccelerate = false;}
if (key == SHIFT) {shooting1 = false;}
if (key == 'u') {shooting2 = false;}
//  if (key == bob.left) {bobTurnL = false;}
//  if (key == bob.right) {bobTurnR = false;}
}

