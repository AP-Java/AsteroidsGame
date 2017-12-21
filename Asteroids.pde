class Asteroids extends Floater
{
 private int rotSpeed;
 Asteroids()
 {
   myColor = 255;
   rotSpeed = (int)(Math.random() * 10) - 5;
   myCenterX = (int)(Math.random() * 900);
   myCenterY = (int)(Math.random() * 900);
   myDirectionX = (int)(Math.random() * 14) - 7;
   myDirectionY = (int)(Math.random() * 14) - 7;
   myPointDirection = 0;
   corners = 8;
   xCorners = new int[corners];
   yCorners = new int[corners];
   xCorners[0] = (int)(Math.random() * 8) + 3;
   yCorners[0] = (int)(Math.random() * 8) + 5;
   xCorners[1] = (int)(Math.random() * 8) + 5;
   yCorners[1] = (int)(Math.random() * 8) + 3;
   xCorners[2] = (int)(Math.random() * 8) + 5;
   yCorners[2] = (int)(Math.random() * 8) - 3;
   xCorners[3] = (int)(Math.random() * 8) + 3;
   yCorners[3] = (int)(Math.random() * 8) - 5;
   xCorners[4] = (int)(Math.random() * 8) - 3;
   yCorners[4] = (int)(Math.random() * 8) - 5;
   xCorners[5] = (int)(Math.random() * 8) - 5;
   yCorners[5] = (int)(Math.random() * 8) - 3;
   xCorners[6] = (int)(Math.random() * 8) - 5;
   yCorners[6] = (int)(Math.random() * 8) + 3;
   xCorners[7] = (int)(Math.random() * 8) - 3;
   yCorners[7] = (int)(Math.random() * 8) + 5;
 }
 public void move()
 {
   super.move();
   super.turn(rotSpeed);
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
   myColor = theColor;}
 public int getColor() {
   return myColor;}
}