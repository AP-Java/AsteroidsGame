class Spaceship extends Floater  
{   
  public Spaceship()
  { 
  myCenterX = 150; 
  myCenterY = 150;   
  myDirectionX = 0; 
  myDirectionY = 0;
  myPointDirection = 0;
  myColor = 255;  
  corners = 3;  //the number of corners, a triangular floater has 3   
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -8;
  yCorners[0] = -8;
  xCorners[1] = 16;
  yCorners[1] = 0;
  xCorners[2] = -8;
  yCorners[2] = 8;    
  }
} 
