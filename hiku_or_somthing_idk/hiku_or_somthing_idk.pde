
// i program robots
// they do not work at all
// i am very sad

void setup()
{
  size(800, 800);
}

void draw()
{
  line1();
}

void line1()
{
  background(#000000);
  strokeWeight(3);
  stroke(255);
  line(0, 150, 800, 150);
  line(200, 150, 200, 800);
  line(200, 200, 800, 200);
  
  javaClass(225, 175);
  fill(#ffffff);
  textSize(15);
  text("action.java", 245, 180);
  textSize(25);
  text("X", 319, 183);
  strokeWeight(1);
  line(340, 150, 340, 200);
  javaClass(360, 175);
  fill(#ffffff);
  textSize(15);
  text("Auto.java", 380, 180);
  textSize(25);
  text("X", 442, 183);
  strokeWeight(1);
  line(460, 150, 460, 200);
  javaClass(480, 175);
  fill(#ffffff);
  textSize(15);
  text("drive.java", 500, 180);
  textSize(25);
  text("X", 567, 183);
  strokeWeight(1);
  line(590, 150, 590, 200);
  stroke(#2EE8FF);
  strokeWeight(5);
  line(342.5, 197.5, 458.5, 197.5);
  
  folder(20, 175); textSize(25); text("v", 40, 180); textSize(15); text("internalSystems", 60, 180);
  folder(40, 205); textSize(25); text("v", 60, 210); textSize(15); text("externalSamples", 80, 210);
  javaClass(60, 235); textSize(15); text("aprilTagOmni", 80, 240);
  javaClass(60, 265); textSize(15); text("tenserFlowCV", 80, 270);
  javaClass(60, 295); textSize(15); text("basicDriveOmni", 80, 300);
  javaClass(60, 325); textSize(15); text("basicDriveTank", 80, 330);
  javaClass(60, 355); textSize(15); text("sensorMRColor", 80, 360);
  javaClass(60, 385); textSize(15); text("sensorMRDistance", 80, 390);
  folder(40, 415); textSize(25); text("v", 60, 420); textSize(15); text("handlers", 80, 420);
  javaClass(60, 445); textSize(15); text("opModeRegester", 80, 450);
  javaClass(60, 475); textSize(15); text("controllerActivity", 80, 480);
  folder(20, 505); textSize(25); text("v", 40, 510); textSize(15); text("externalPrograms", 60, 510);
  folder(40, 535); textSize(25); text("v", 60, 540); textSize(15); text("teamCode", 80, 540);
  folder(60, 565); textSize(25); text("v", 80, 570); textSize(15); text("newAuto", 100, 570);
  javaClass(80, 595); textSize(15); text("action", 100, 600);
  javaClass(80, 625); textSize(15); text("Auto", 100, 630);
  javaClass(80, 655); textSize(15); text("blueClose", 100, 660);
  javaClass(60, 685); textSize(15); text("drive", 80, 690);
  javaClass(60, 715); textSize(15); text("driveOld", 80, 720);
  javaClass(60, 745); textSize(15); text("ianDriveArm", 80, 750);
  javaClass(60, 775); textSize(15); text("tfodHell", 80, 780);
  
  fill(#ffffff);
  text("move()", 200, 200);
}

void line2()
{
  
}

void line3()
{
  
}

void javaClass(float x, float y)
{
  push();
    noStroke();
    fill(#2EE8FF);
    ellipse(x, y, 25, 25);
    textSize(20);
    fill(#000000);
    text("c", x - 5, y + 5);
  pop();
}

void folder(float x, float y)
{
  push();
    translate(x, y);
    fill(#FFEBB7);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, 30, 20);
    rect(-10, -12.5, 10, 5);
  pop();
}
