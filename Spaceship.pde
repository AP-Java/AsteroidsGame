class Spaceship extends Floater  
{ 
  public char up;
  public char left;
  public char right;  
  public Spaceship(char u,char l,char r)
  {   
  up = u;
  left = l;
  right = r;
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
public void setX(int x) {myCenterX = x;}
public int getX() {return (int)myCenterX;}   
public void setY(int y) {myCenterY = y;}   
public int getY() {return (int)myCenterX;}   
public void setDirectionX(double x) {myDirectionX = x;}   
public double getDirectionX() {return myDirectionX;}   
public void setDirectionY(double y) {myDirectionY = y;}   
public double getDirectionY() {return myDirectionY;}   
public void setPointDirection(int degrees) {myPointDirection = degrees;}   
public double getPointDirection() {return myPointDirection;} 
} 
