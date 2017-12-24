class Spaceship extends Floater  
{ 


  private char up;
  private char left;
  private char right;
  private char hyper;  
  private int myHealth;
  public Spaceship(char u, char l, char r, char h)
  { 
    myHealth = 100;
    up = u;
    left = l;
    right = r;
    hyper = h;
    myCenterX = 450; 
    myCenterY = 450;   
    myDirectionX = 0; 
    myDirectionY = 0;
    myPointDirection = 0;
    myColor = 255;  
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
  public char getUp() {
    return up;
  } 
  public char getHyper() {
    return hyper;
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
    fill(138, 2, 0);
    noStroke();
    rect(player.getX()- 25, player.getY() - 20, (player.getHealth()/2), 3);
  }
}
