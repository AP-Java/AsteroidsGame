class Stars //note that this class does NOT extend Floater
{
	private int myX;
	private int myY;
	public Stars()
	{
		myX = ((int)(Math.random()*900));
		myY = ((int)(Math.random()*900));
	}
	public void show()
	{
		fill(255);
		ellipse(myX,myY,2,2);
	}
}
