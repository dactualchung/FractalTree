private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .45;
float baseX = 320;
float baseY = 480;
float endX = 320;
float endY = 380;
public void setup()
{
	size(640,480);
	noLoop();
}
public void draw()
{
	background(0);
	stroke(0,255,0);
	//line(4random2,480,4random2,380); 
  noFill();
  bezier(baseX, baseY, (baseX + 0.25 * (endX - baseX)) + (float)(Math.random() * 41) - 20, (baseY + 0.25 * (endY - baseY)) + (float)(Math.random() * 41) - 20, (baseX + 0.75 * (endX - baseX)) + (float)(Math.random() * 41) - 20, (baseY + 0.75 * (endY - baseY)) + (float)(Math.random() * 41) - 20, endX, endY);
	drawBranches(320,380, 100, 3*Math.PI/2, 41, 20);  //will add later
}
public void drawBranches(int x,int y, double branchLength, double angle, int random1, int random2)
{
	double angle1, angle2;
  angle1 = angle - branchAngle;
  angle2 = angle + branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength * Math.cos(angle1) + x);
  int endY1 = (int)(branchLength * Math.sin(angle1) + y);
  int endX2 = (int)(branchLength * Math.cos(angle2) + x);
  int endY2 = (int)(branchLength * Math.sin(angle2) + y);
  bezier(x, y, (x + 0.25 * (endX1 - x)) + (float)(Math.random() * random1) - random2, (y + 0.25 * (endY1 - y)) + (float)(Math.random() * random1) - random2, (x + 0.75 * (endX1 - x)) + (float)(Math.random() * random1) - random2, (y + 0.75 * (endY1 - y)) + (float)(Math.random() * random1) - random2, endX1, endY1);
  bezier(x, y, (x + 0.25 * (endX2 - x)) + (float)(Math.random() * random1) - random2, (y + 0.25 * (endY2 - y)) + (float)(Math.random() * random1) - random2, (x + 0.75 * (endX2 - x)) + (float)(Math.random() * random1) - random2, (y + 0.75 * (endY2 - y)) + (float)(Math.random() * random1) - random2, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1, random1, random2);
    drawBranches(endX2, endY2, branchLength, angle2, random1, random2);
  }
}
public void mouseClicked(){
  redraw();
}
