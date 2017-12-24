class Enemy extends Floater  
{ 

  private int myHealth;  
  public Enemy()
  {   
    myHealth = 100;
    myCenterX = 10; 
    myCenterY = 10;   
    myDirectionX = 0; 
    myDirectionY = 0;
    myPointDirection = 0;
    myColor = 100;  
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
  } 
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }   
  public void setY(int y) {
    myCenterY = y;
  }   
  public int getY() {
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) {
    myDirectionX = x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  } 
  public void setColor(int theColor) {
    myColor = theColor;
  }
  public int getColor() {
    return myColor;
  }
  public void setHealth(int theHealth) {
    myHealth = theHealth;
  }
  public int getHealth() {
    return myHealth;
  }
  public void healthBar() {
    fill(0, 2, 138);
    noStroke();
    rect(enemy.getX()-25, enemy.getY() -20, (enemy.getHealth()/2), 3);
  }
} 
