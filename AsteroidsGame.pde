
Spaceship bob = new Spaceship('w', 'a', 'd', 'e');
Enemy enemy = new Enemy();
Stars [] andrew = new Stars[500];
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList<Asteroids>  dan = new ArrayList<Asteroids>();
boolean bobAccelerate = false;
boolean bobTurnL = false;
boolean bobTurnR = false;
int asteroidCount = 5;
int timer = 0;
int playerHealth = 100;
int enemyHealth = 100;
boolean shooting1 = false;
boolean shooting2 = false;
boolean bossMode = false;
boolean oneDown = false;

int score = 0;
int bulletCount = 0;

public void setup() 
{
 size(900, 900);
//
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
 //visual overlays
 background(0);
 noFill();
 rect(710,850,180,40,10);
 stroke(138,2,0);
 fill(138,2,0);
 if(oneDown == true) {triangle( (float)bob.getX(),(float)bob.getY(),mouseX,(float)bob.getY(),mouseX,mouseY );}
 rect(mouseX-15,mouseY-1,30,2);
 rect(mouseX-1,mouseY-15,2,30);
 textSize(30);
 fill(255);
 text("Score: " + score, 730,880); 
 bob.show();
 bob.move();
 stroke(138,2,0);
 line((float)bob.getX(),(float)bob.getY(),mouseX,mouseY);
 stroke(0);
//Stars being made
for (int i = 0; i < andrew.length; i++)
 {
   andrew[i].show();
 }
//Player's bullets are created here
for (int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).show();
    bullets.get(i).move();
  }
//Testing for if an asteroid has hit the player 
for (int i = 0; i < dan.size(); i++)
 {
   dan.get(i).show();
   dan.get(i).move();
	if (dist(dan.get(i).getX(), dan.get(i).getY(), bob.getX(), bob.getY()) < 25)
   	{
    	dan.remove(i);
    	playerHealth -= 20;

    }
 }

//pointing toward the mouse
  float o = mouseX - bob.getX();
  float a = mouseY - bob.getY();
  float o2 = bob.getX() - enemy.getX();
  float a2 = bob.getY() - enemy.getY();
 
 
 if(mouseY>=bob.getY())
 	bob.setPointDirection (90 + (int)(( (atan(o/a) )* -57 )));
 else
 	bob.setPointDirection (270 + (int)(( (atan(o/a) )* -57 ))); 
//Player accelerating
if (bobAccelerate == true) {bob.accelerate(.1);}
if ((bob.myDirectionX > 0 && bob.myDirectionX != 0) && (bobAccelerate == false)) {bob.accelerate(0);}


//Player Shooting bullets

if ((shooting1 == true) && (bulletCount < 5))
{
	bullets.add(new Bullet(bob));
  bulletCount++;

}
if(bulletCount == 5)
{
  while(timer < 1000)
    {timer++;}
  bulletCount = 0;
  timer = 0;   
   
}

//health bar
fill(0,255,0);
noStroke();
rect(bob.getX()- 25,bob.getY() - 20,(playerHealth/2), 3);

//enemy health bar
fill(138,2,0);
noStroke();
rect(enemy.getX()- 25,enemy.getY() - 20,(enemyHealth/2), 3);

 
//Code for when Player's bullets hit the Asteroids

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
          score += 20;
          dan.add(new Asteroids());
          dan.add(new Asteroids());
        }
      break;
      }
  }


//Bossfight 1
if (score == 100)
	{bossMode = true;}
if (bossMode == true)
{
 
 for(int i = 0;i < dan.size(); i++)
 	dan.remove(i);
 enemy.move();
 enemy.show();
 if(bob.getY()>=enemy.getY())
 	enemy.setPointDirection (90 + (int)(( (atan(o2/a2) )* -57 )));
 else
 	enemy.setPointDirection (270 + (int)(( (atan(o2/a2) )* -57 ))); 
 enemy.accelerate(( 5/(dist(bob.getX(),bob.getY(),enemy.getX(),enemy.getY()) ) ) );
  if(dist(bob.getX(),bob.getY(),enemy.getX(),enemy.getY()) < 250)
  {
    
    stroke(2,0,138);
      line((float)enemy.getX(),(float)enemy.getY(),bob.getX(),bob.getY());
  if(((millis() % 1) == 0) && (playerHealth > 0))
  {
    playerHealth--;
  }

  }

}


if (bobAccelerate == true) {bob.accelerate(.1);}
if ((bob.myDirectionX > 0 && bob.myDirectionX != 0) && (bobAccelerate == false)) {bob.accelerate(0);}

}


//Testing for key presses

public void keyPressed()
{
 if (key == bob.up) {bobAccelerate = true;}
 if  (key == ' ') 
 {
 	shooting1 = true;
 }
 if (key == '1') 
 {
 	if (oneDown = true) {oneDown = false;}
 	if (oneDown = false) {oneDown = false;}
 }

 if (key == bob.left) {bobTurnL = true;}
 if (key == bob.right) {bobTurnR = true;}
 if (key == CODED)
	{if(keyCode == SHIFT) 
     {
      bob.setX( (int)(Math.random()*900) );
      bob.setY( (int)(Math.random()*900) );
      bob.setDirectionX(0);
      bob.setDirectionY(0);
     }	
}
}

public void keyReleased()
{
 if (key == bob.up) {bobAccelerate = false;}
 if (key == ' ') {
  shooting1 = false;
  bulletCount = 0;
 }
 if (key == bob.left) {bobTurnL = false;}
 if (key == bob.right) {bobTurnR = false;}
 
}