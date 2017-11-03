Spaceship bob = new Spaceship('w','a','d');
Spaceship chase = new Spaceship('i','j','l');
Stars [] andrew = new Stars[500];
public void setup() 
{
 size(900,900);
}
public void draw() 
{
	background(138,2,0);
	bob.show();
	bob.move();
	chase.show();
	chase.move();
}
  
public void keyPressed()
	{
		if (key == up) {bob.accelerate(1);}
		if (key == left) {bob.turn(-5);}
		if (key == right) {bob.turn(5);}
	}
