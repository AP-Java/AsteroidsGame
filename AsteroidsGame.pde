
Spaceship player = new Spaceship('w', 'a', 'd', 'e');
Enemy enemy = new Enemy();
Stars [] andrew = new Stars[500];
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList<Asteroids>  dan = new ArrayList<Asteroids>();
boolean playerAccelerate = false;
boolean playerTurnL = false;
boolean playerTurnR = false;
int asteroidCount = 5;
int timer = 0;
boolean shooting1 = false;
boolean shooting2 = false;
boolean bossMode = false;
boolean oneDown = false;
int hCounter = 450;


int stage = 1;
int score = 0;
int bulletCount = 0;

public void setup() 
{
  size(900, 1100);
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
  //Stars being made
  for (int i = 0; i < andrew.length; i++)
  {
    andrew[i].show();
  }
  //more visual overlays
  noFill();
  stroke(138, 2, 0);
  fill(138, 2, 0);
  if (oneDown == true) {
    triangle( (float)player.getX(), (float)player.getY(), mouseX, (float)player.getY(), mouseX, mouseY );
  }
  rect(mouseX-15, mouseY-1, 30, 2);
  rect(mouseX-1, mouseY-15, 2, 30);

  player.move();
  player.show();
  player.healthBar();

  stroke(138, 2, 0);
  //line((float)player.getX(),(float)player.getY(),mouseX,mouseY);
  stroke(0);
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
    if (dist(dan.get(i).getX(), dan.get(i).getY(), player.getX(), player.getY()) < 25)
    {
      dan.remove(i);
      player.setHealth(player.getHealth() - 20);
    }
  }

  //pointing toward the mouse
  float o = mouseX - player.getX();
  float a = mouseY - player.getY();
  float o2 = player.getX() - enemy.getX();
  float a2 = player.getY() - enemy.getY();


  if (mouseY>=player.getY())
    player.setPointDirection (90 + (int)(( (atan(o/a) )* -57 )));
  else
    player.setPointDirection (270 + (int)(( (atan(o/a) )* -57 ))); 
  //Player accelerating
  if (playerAccelerate == true) {
    player.accelerate(.1);
  }
  if ((player.myDirectionX > 0 && player.myDirectionX != 0) && (playerAccelerate == false)) {
    player.accelerate(0);
  }


  //Player Shooting bullets

  if ((shooting1 == true) && (bulletCount < 5))
  {
    bullets.add(new Bullet(player));
    bulletCount++;
  }
  if ((bulletCount == 0) && (shooting1 == false))
  {

    for (int i = 0; i < 50000; i++)
    { 
      if ((i % 10000) == 0)
        bulletCount--;
    }
  }


  //Code for when Player's bullets hit the Asteroids

  for (int l = 0; l < bullets.size(); l++)
  {
    for (int i = 0; i < dan.size(); i++)
      if (dist(bullets.get(l).getX(), bullets.get(l).getY(), dan.get(i).getX(), dan.get(i).getY()) < 20)
      {
        bullets.remove(l);
        if (dan.get(i).getColor() == 255)
        {
          dan.get(i).setColor(170);
        } else if (dan.get(i).getColor() == 170)
        {
          dan.get(i).setColor(85);
        } else
        {
          dan.remove(i);
          score += 20;
          dan.add(new Asteroids());
          dan.add(new Asteroids());
        }
        break;
      }
  }
  //testing if the bullets hit the enemy
  if (bossMode == true)
  {
    for (int l = 0; l < bullets.size(); l++)
    {
      if (dist(bullets.get(l).getX(), bullets.get(l).getY(), enemy.getX(), enemy.getY()) < 10)
      {
        enemy.setHealth(enemy.getHealth() - 2);
        bullets.remove(l);
      }
    }
  }


  //Bossfight 1
  if (score == 100)
  {
    bossMode = true;
  }
  if (bossMode == true)
  {
    stage = 2;
    for (int i = 0; i < dan.size(); i++)
      dan.remove(i);
    enemy.move();
    enemy.show();
    enemy.healthBar();

    if (player.getY()>=enemy.getY())
      enemy.setPointDirection (90 + (int)(( (atan(o2/a2) )* -57 )));
    else
      enemy.setPointDirection (270 + (int)(( (atan(o2/a2) )* -57 ))); 
    enemy.accelerate(( 5/(dist(player.getX(), player.getY(), enemy.getX(), enemy.getY()) ) ) );
    if (dist(player.getX(), player.getY(), enemy.getX(), enemy.getY()) < 250)
    {

      stroke(2, 0, 138);
      line((float)enemy.getX(), (float)enemy.getY(), player.getX(), player.getY());
      if (((millis() % 1) == 0) && (player.getHealth() > 0))
      {
        player.setHealth(player.getHealth() - 1);
      }
    }
    if (enemy.getHealth() == 0)
    {
      bossMode = false;
      //stage = 3;
    }
  }

  if ((millis() % 100 == 0 ) && (hCounter < 450) )
    hCounter += 25;

  if (playerAccelerate == true) {
    player.accelerate(.1);
  }
  if ((player.myDirectionX > 0 && player.myDirectionX != 0) && (playerAccelerate == false)) {
    player.accelerate(0);
  }
  fill(0);
  rect(0, 900, 900, 200);
  noFill();
  stroke(255);
  line(0, 900, 900, 900);
  line(0, 1010, 900, 1010);
  rect(10, 910, 180, 40, 10);
  rect(10, 960, 180, 40, 10);
  rect(710, 910, 180, 40, 10);
  rect(710, 960, 180, 40, 10);
  textSize(35);


  fill(138, 2, 0);
  rect(230, 910, 225 - bulletCount*45, 40);
  rect(230, 960, hCounter, 40);
  fill(255);
  text("Ammo:", 35, 945);
  text("Hyper:", 35, 995);
  text("Score:" + score, 720, 945);
  text("Stage:" + stage, 720, 995);

  if (player.getHealth() == 0)
  {
    fill(0);
    rect(0, 0, 900, 900);
    textSize(100);
    fill(255);
    stroke(255);
    text(" GAME OVER", 150, 450);
  }

  if (enemy.getHealth() == 0)
  {
    bossMode = false;
    score = 500;
    fill(0);
    rect(0, 0, 900, 900);
    textSize(100);
    fill(255);
    stroke(255);
    text(" GAME WON", 150, 450);
  }
}


//Testing for key presse

public void keyPressed()
{
  if (key == player.up) {
    playerAccelerate = true;
  }
  if  (key == ' ') 
  {
    shooting1 = true;
  }
  if (key == '1') 
  {
    if (oneDown = true) {
      oneDown = false;
    }
    if (oneDown = false) {
      oneDown = false;
    }
  }

  if (key == player.left) {
    playerTurnL = true;
  }
  if (key == player.right) {
    playerTurnR = true;
  }
  if (key == CODED)
  {
    if (keyCode == SHIFT) 
    {
      if (hCounter == 450)
      {
        player.setX( (int)(Math.random()*900) );
        player.setY( (int)(Math.random()*900) );
        player.setDirectionX(0);
        player.setDirectionY(0);
        hCounter = 0;
      }
    }
  }
}

public void keyReleased()
{
  if (key == player.up) {
    playerAccelerate = false;
  }
  if (key == ' ') {
    shooting1 = false;
    bulletCount = 0;
  }
  if (key == player.left) {
    playerTurnL = false;
  }
  if (key == player.right) {
    playerTurnR = false;
  }
}
