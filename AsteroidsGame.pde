Spaceship bob = new Spaceship('w','a','d','e');
Spaceship chase = new Spaceship('i','j','l','o');
Stars [] andrew = new Stars[500];
public void setup() 
{
 size(900,900);
 for (int l = 0; l < andrew.length; l++)
		{
		 andrew[l] = new Stars();
		 }
}
public void draw() 
{
	background(138,2,0);
	for (int i = 0; i < andrew.length; i++)
		{
		 andrew[i].show();}
	bob.show();
	bob.move();
	chase.show();
	chase.move();
}
  
public void keyPressed()
	{
		if (key == bob.up) {bob.accelerate(1);}
		if (key == bob.left) {bob.turn(-5);}
		if (key == bob.right) {bob.turn(5);}
		if (key == chase.up) {chase.accelerate(1);}
		if (key == chase.left) {chase.turn(-5);}
		if (key == chase.right) {chase.turn(5);}
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
			 bob.setPointDirection( (int)(Math.random()*360) );
			 bob.setDirectionX(0);
			 bob.setDirectionY(0);
			}


	}
