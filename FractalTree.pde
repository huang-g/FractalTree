private double minLen = 7;
private double branchAngle = PI/6;
private double swayAngle = PI/36;
private boolean dir = true; //(true = right)

public void setup() {
  size(800, 800);
}

public void draw() {
  background(0);
  stroke(250, 224, 255);
  line(400, 720, 400, 480);
  tree(400, 480, 160, PI/2, swayAngle);
  if(swayAngle < PI/36 && swayAngle > 0 && dir) {
    swayAngle += PI/360;
  } else if (swayAngle >= PI/36){
    dir = false;
    swayAngle -= PI/360;
  } else if (swayAngle <= 0){
    dir = true;
    swayAngle += PI/360;
  } else {
    swayAngle -= PI/360;
  }
}

public void tree(int x, int y, double branchLen, double angle, double sway) {
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  if(branchLen < minLen) {
    line(x, y, x-(int)(branchLen*Math.cos(angle1)), y-(int)(branchLen*Math.sin(angle1)));
    line(x, y, x-(int)(branchLen*Math.cos(angle2)), y-(int)(branchLen*Math.sin(angle2)));
  } else if(branchLen < minLen * 10) {
    line(x, y, x-(int)(branchLen*Math.cos(angle1+sway)), y-(int)(branchLen*Math.sin(angle1+sway)));
    tree(x-(int)(branchLen*Math.cos(angle1+sway)), y-(int)(branchLen*Math.sin(angle1+sway)), 4*branchLen/5, angle1, sway);
    line(x, y, x-(int)(branchLen*Math.cos(angle2+sway)), y-(int)(branchLen*Math.sin(angle2+sway)));
    tree(x-(int)(branchLen*Math.cos(angle2+sway)), y-(int)(branchLen*Math.sin(angle2+sway)), 4*branchLen/5, angle2, sway);
  } else {
    line(x, y, x-(int)(branchLen*Math.cos(angle1)), y-(int)(branchLen*Math.sin(angle1)));
    tree(x-(int)(branchLen*Math.cos(angle1)), y-(int)(branchLen*Math.sin(angle1)), 4*branchLen/5, angle1, sway);
    line(x, y, x-(int)(branchLen*Math.cos(angle2)), y-(int)(branchLen*Math.sin(angle2)));
    tree(x-(int)(branchLen*Math.cos(angle2)), y-(int)(branchLen*Math.sin(angle2)), 4*branchLen/5, angle2, sway);
  }

}
