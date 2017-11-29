import processing.serial.*;
Serial serial; 
int sensorValue;
int mode=3;
int currentTime;
float b;

String score[];
String image[];
PImage ImgArray[];

String score1[];
String image1[];
PImage ImgArray1[];

float t;
float theta;
//int maxFrameCount = 100; // frameCount, change for faster or slower animation
int maxFrameCount; //100-4
Cube[] cubes = new Cube[1000];
float angleX = 0;
float angleY = 0;
float angleZ = 0;

void setup()
{
  //printArray(Serial.list());
  serial = new Serial(this,Serial.list()[1], 115200);
  
  //score = loadStrings("score_url.txt");
  //image = loadStrings("image_url.txt");
  score = loadStrings("https://storage19960311.blob.core.windows.net/mycontainer/scorehappy.txt");
  image = loadStrings("https://storage19960311.blob.core.windows.net/mycontainer/imagehappy.txt");
  
  score1 = loadStrings("https://storage19960311.blob.core.windows.net/mycontainer/scoresad.txt");
  image1 = loadStrings("https://storage19960311.blob.core.windows.net/mycontainer/imagesad.txt");
  
  ImgArray = new PImage[image.length];
  for(int i=0;i<image.length;i++){
    ImgArray[i] = loadImage(image[i], "png");
  }
  
  ImgArray1 = new PImage[image1.length];
  for(int i=0;i<image1.length;i++){
    ImgArray1[i] = loadImage(image1[i], "png");
  }
  
  size(displayWidth, displayHeight, P3D);
  noStroke();
}

void draw()
{
  if( serial.available() > 0) {
    sensorValue = serial.read();
    if(sensorValue!=13 && sensorValue!=10 && sensorValue==51)mode=3;
    if(sensorValue!=13 && sensorValue!=10 && sensorValue==49)mode=1;
    if(sensorValue!=13 && sensorValue!=10 && sensorValue==50)mode=2;
    println(mode);
  }
  
  if(mode==1){
    //happy
    currentTime = second()%image.length*3;
    currentTime = currentTime/3;
    b = Float.parseFloat(score[currentTime]);
    color aa = color(255, 85, 0);
    color bb = color(255, 204, 36);
    color cc = lerpColor(bb, aa, b);
    background(cc);
  }
  else if(mode==2){
    //sad
    currentTime = (1+second())%image1.length*3;
    currentTime = currentTime/3;
    b = Float.parseFloat(score1[currentTime]);
    color aa = color(36, 255, 186);
    color bb = color(0, 115, 230);
    color cc = lerpColor(bb, aa, b);
    background(cc);
  }
  else{
    currentTime = second()%image1.length*3;
    currentTime = currentTime/3;
    b = Float.parseFloat(score1[currentTime]);
    background(#5B5B5B);
  }
  
  if(mode==1){
    //happy
    imageMode(CENTER);
    float dd = (float)ImgArray[currentTime].width/(float)ImgArray[currentTime].height*(float)height;
    image(ImgArray[currentTime],width/2,height/2,round(dd),height);
    //tint(255, 126);  // Apply transparency without changing color
  
    textSize(70);  
    textAlign(LEFT,BOTTOM);
    fill(255, 255, 255); 
    text(score[currentTime],displayWidth-230, displayHeight-150);
    //text(score[currentTime],width/2,height/2);
  }
  else if(mode==2){
    //sad
    imageMode(CENTER);
    float dd = (float)ImgArray1[currentTime].width/(float)ImgArray1[currentTime].height*(float)height;
    image(ImgArray1[currentTime],width/2,height/2,round(dd),height);
    //tint(255, 126);  // Apply transparency without changing color
  
    textSize(70);  
    textAlign(LEFT,BOTTOM);
    fill(255, 255, 255); 
    text(score1[currentTime],displayWidth-230, displayHeight-150);
    //text(score[currentTime],width/2,height/2);
  }
  translate(width/2,height/2+30,180); // translate 0,0 to center
  //rotateZ(30);
  // Set up some different colored lights
  pointLight(255, 255, 255, 65, 60, 100); 
  emissive(0, 26, 51);
  specular(255, 255, 255);
  //pointLight(255, 255, 255, -65, -60, -150);
  //pointLight(255, 255, 255, -75, -30, 200);
  //pointLight(255, 255, 255, -75, -30, -200);

  maxFrameCount = (int)(map(b, 0, 1, 600, 50)); // map x position
  t = (float)frameCount/maxFrameCount;
  theta = TWO_PI*t;
  
  int z=0;
  for ( int x= -500; x <= 500; x += 100) {
    for (int y= -350; y <= 350; y += 100) {
      //==============================================================================
      float offSet = 50*x+y/2;   // play with offSet to change map below
      //==============================================================================
      // Scale the cos value from 0 to 1 to a range between 0 and 25
      int x2 = (int)(map(cos(-theta+offSet), 0, 1, 0, 25)); // map x position
      int y2 = (int)(map(cos(-theta+offSet), 0, 1, 25, 0)); // map y position
      int sz2 = (int)(map(sin(-theta+offSet), 0, 1, 40, 50)); // map size off the ellipse
      //==============================================================================
      //float b = Float.parseFloat(score[currentTime]);
      fill(250+b, 150+b, 200-b,30); // color with gradient created
      //fill(cc,cc,cc,100);
      //==============================================================================
      cubes[z] = new Cube(sz2/2,sz2/2,sz2/2,x+x2,y-y2,0); 
      cubes[z].drawCube(angleX,angleY,angleZ);
      z++;//add the number of array
    }
  }
  
  float angle = map(b, 0, 1, 0.005, 0.05); // map x position
  angleX += angle;//0.05
  angleY += angle;
  angleZ += angle;
  
}