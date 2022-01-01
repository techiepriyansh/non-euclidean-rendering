int[] count = new int[5];
int itr = 2;

PointObject pobj1;
PointObject pobj2;

void setup() {
  size(800, 800);
  background(205);
  frameRate(60);
  pobj1 = new PointObject(new PVector(0.01, 0.5), new PVector(1, 1));
  pobj2 = new PointObject(new PVector(0.01, 0.1), new PVector(1, 1));
  // move origin to center
  translate(width/2, height/2);
  scale(1, -1);

  // unit circle
  fill(255);
  stroke(0);
  mCircle(0, 0, 1);

  // axes
  line(0, height/2, 0, -height/2);
  line(width/2, 0, -width/2, 0);
  
  
  point4 points = new point4();
  float scale = 0.5;
  for(int i=0;i<4;i++){
    points.x[i] = scale * sin(2 * i * PI / 4 + PI/4);
    points.y[i] = scale * cos(2 * i * PI / 4 + PI/4);
  }
  stroke(0);
  point4 temp = points;
  square sq = new square(points.x,points.y);
  sq.draw();
  
    
  
  //drawing the children
  //drawChildLeft(center1,center2,temp,count);
  //drawChildRight(center1,center2,temp,count);
  
  //drawing rest 3:
  //drawChild1(center1,center2,temp,count);
  //drawChild2(center1,center2,temp,count);
  //drawChild3(center1,center2,temp,count);
  
  stroke(255,0,0);
  for(int i=0;i<5;i++){
    count[i]=itr;
  }
  //drawChild(temp,count);
  
  
}

void draw() {
   
}

void drawChild(point4 temp, int[] count){
  
  if(count[0] == 0) return;
  for(int i=0;i<4;i++){
    point4 newPoints = new point4();
    PVector tran = new PVector();
    PVector center = center(temp.x[i],temp.y[i],temp.x[(i+1)%4],temp.y[(i+1)%4]);
     // 3' <-- 0
    newPoints.x[(i+3)%4] = temp.x[(i)%4];
    newPoints.y[(i+3)%4] = temp.y[(i)%4];
    
    // 2' <-- 1
    newPoints.x[(i+2)%4] = temp.x[(i+1)%5];
    newPoints.y[(i+2)%4] = temp.y[(i+1)%4];
        
    // 0' <-- inv(3)
    tran = inverse(center, temp.x[(i+3)%4], temp.y[(i+3)%4], center.z);
    newPoints.x[(i)%4] = tran.x;
    newPoints.y[(i)%4] = tran.y;
    
    // 1' <-- inv(2)
    tran = inverse(center, temp.x[(i+2)%4], temp.y[(i+2)%4], center.z);
    newPoints.x[(i+1)%4] = tran.x;
    newPoints.y[(i+1)%4] = tran.y;
    
    
    square sq = new square(newPoints.x,newPoints.y);
    sq.draw();
   
    //count=1;
    //count[i]--;
    //drawChild(newPoints, count);
    
  }
}

//void drawChildLeft(PVector center1,PVector center2, point5 temp,int count){
//    if(count == 0 ) return;
//    point5 newPoints = new point5();
//    PVector tran = new PVector();
    
//    // 1 <-- 0
//    newPoints.x[1] = temp.x[0];
//    newPoints.y[1] = temp.y[0];
    
//    // 2 <-- 4
//    newPoints.x[2] = temp.x[4];
//    newPoints.y[2] = temp.y[4];
        
//    // 0 <-- inv(1)
//    tran = inverse(center1, temp.x[1], temp.y[1], center1.z);
//    newPoints.x[0] = tran.x;
//    newPoints.y[0] = tran.y;
    
//    // 4 <-- inv(2)
//    tran = inverse(center1, temp.x[2], temp.y[2], center1.z);
//    newPoints.x[4] = tran.x;
//    newPoints.y[4] = tran.y;
    
//    // 3 <-- inv(3)
//    tran = inverse(center1, temp.x[3], temp.y[3], center1.z);
//    newPoints.x[3] = tran.x;
//    newPoints.y[3] = tran.y;
    
//    Pentagon pentNew1 = new Pentagon(newPoints.x,newPoints.y);
//    pentNew1.draw();
    
    
//    temp = newPoints;
//    center1 = center(temp.x[0],temp.y[0],temp.x[4],temp.y[4]);
//    center2 = center(temp.x[4],temp.y[4],temp.x[3],temp.y[3]);
//    count--;
    
//    int t = count;
//    drawChildLeft(center1,center2,temp,count);
//    count = t;
//    drawChildRight(center1,center2,temp,count);
//}

//void drawChildRight(PVector center1,PVector center2, point5 temp,int count){
//    if(count == 0 ) return;
//    point5 newPoints = new point5();
//    PVector tran = new PVector();
//    // 1 <-- 4
//    newPoints.x[1] = temp.x[4];
//    newPoints.y[1] = temp.y[4];
    
//    // 2 <-- 3
//    newPoints.x[2] = temp.x[3];
//    newPoints.y[2] = temp.y[3];
        
//    // 0 <-- inv(0)
//    tran = inverse(center2, temp.x[0], temp.y[0], center2.z);
//    newPoints.x[0] = tran.x;
//    newPoints.y[0] = tran.y;
    
//    // 4 <-- inv(1)
//    tran = inverse(center2, temp.x[1], temp.y[1], center2.z);
//    newPoints.x[4] = tran.x;
//    newPoints.y[4] = tran.y;
    
//    // 3 <-- inv(2)
//    tran = inverse(center2, temp.x[2], temp.y[2], center2.z);
//    newPoints.x[3] = tran.x;
//    newPoints.y[3] = tran.y;
    
//    Pentagon pentNew2 = new Pentagon(newPoints.x,newPoints.y);
//    pentNew2.draw();
    
//    temp = newPoints;
//    center1 = center(temp.x[0],temp.y[0],temp.x[4],temp.y[4]);
//    center2 = center(temp.x[4],temp.y[4],temp.x[3],temp.y[3]);
//    count--;
//    int t = count;
//    drawChildLeft(center1,center2,temp,count);
//    count = t;
//    drawChildRight(center1,center2,temp,count);
//}

//void drawChild1(PVector center1,PVector center2, point5 temp,int count){
//    if(count == 0 ) return;
//    point5 newPoints = new point5();
//    PVector tran = new PVector();
    
    
//    // 1 <-- 4
//    newPoints.x[1] = temp.x[4];
//    newPoints.y[1] = temp.y[4];
    
//    // 0 <-- 0
//    newPoints.x[0] = temp.x[0];
//    newPoints.y[0] = temp.y[0];
        
//    // 1 <-- inv(4)
//    tran = inverse(center2, temp.x[4], temp.y[4], center2.z);
//    newPoints.x[1] = tran.x;
//    newPoints.y[1] = tran.y;
//  4
//    // 3 <-- inv(2)
//    tran = inverse(center2, temp.x[2], temp.y[2], center2.z);
//    newPoints.x[3] = tran.x;
//    newPoints.y[3] = tran.y;
    
//    // 2 <-- inv(3)
//    tran = inverse(center2, temp.x[3], temp.y[3], center2.z);
//    newPoints.x[2] = tran.x;
//    newPoints.y[2] = tran.y;
    
//    Pentagon pentNew2 = new Pentagon(newPoints.x,newPoints.y);
//    pentNew2.draw();
    
//    temp = newPoints;
//    center1 = center(temp.x[0],temp.y[0],temp.x[4],temp.y[4]);
//    center2 = center(temp.x[4],temp.y[4],temp.x[3],temp.y[3]);
//    count--;
//    int t = count;
//    drawChildLeft(center1,center2,temp,count);
//    count = t;
//    drawChildRight(center1,center2,temp,count);
//}
