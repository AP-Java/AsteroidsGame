Spaceship bob = new Spaceship();
public void setup() 
{
 size(300,300);
}
public void draw() 
{
	background(138,2,0);
	bob.show();
	bob.move();
}
  
public void keyPressed()
	{
		if (key =='w' || key == 'W') {bob.accelerate(1);}
		if (key =='a' || key == 'A') {bob.turn(-5);}
		if (key =='d' || key == 'D') {bob.turn(5);}
	

	}
