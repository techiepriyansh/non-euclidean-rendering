int count = 1;
float time = 0;
float weight = 0.0;

PointObject pobj1;
PointObject pobj2;

void setup() {
  size(800, 800);
  background(134, 166, 164);
  frameRate(60);
}

void draw() {
   
  pobj1 = new PointObject(new PVector(0.01, 0.5), new PVector(1, 1));
  pobj2 = new PointObject(new PVector(0.01, 0.1), new PVector(1, 1));
  // move origin to center
  translate(width/2, height/2);
  scale(1, -1);

  // unit circle
  fill(0);
  stroke(0);
  mCircle(0, 0, 1);

  // axes
  line(0, height/2, 0, -height/2);
  line(width/2, 0, -width/2, 0);
  
  
  point3 points = new point3();
  float scale = 0.5;
  for(int i=0;i<3;i++){
    points.x[i] = scale * cos(2 * i * PI / 7 + PI/2 + time*weight);
    points.y[i] = scale * sin(2 * i * PI / 7 + PI/2 + time*weight);
  }
  stroke(0);
  point3 temp = points;
  Triangle tri= new Triangle(points.x,points.y);
  tri.draw();
  
    
  
  //drawing the children
  //drawChildLeft(center1,center2,temp,count);
  //drawChildRight(center1,center2,temp,count);
  
  //drawing rest 3:
  //drawChild1(center1,center2,temp,count);
  //drawChild2(center1,center2,temp,count);
  //drawChild3(center1,center2,temp,count);
  
  //stroke(255,238,3);
  //drawChildTriangle(temp,count);
  time++;
}

void drawChildTriangle(point3 temp, int count){
  
  if(count == 0) return;
  for(int i=0;i<3;i++){
    point3 newPoints = new point3();
    PVector tran = new PVector();
    PVector center = center(temp.x[i],temp.y[i],temp.x[(i+1)%3],temp.y[(i+1)%3]);
    // 0' <-- 0
    newPoints.x[(i)%3] = temp.x[(i)%3];
    newPoints.y[(i)%3] = temp.y[(i)%3];
    
    // 1' <-- 1
    newPoints.x[(i+1)%3] = temp.x[(i+1)%3];
    newPoints.y[(i+1)%3] = temp.y[(i+1)%3];
        
    // 2' <-- inv(2)
    tran = inverse(center, temp.x[(i+2)%3], temp.y[(i+2)%3], center.z);
    newPoints.x[(i+2)%3] = tran.x;
    newPoints.y[(i+2)%3] = tran.y;
    
    
    Triangle tri = new Triangle(newPoints.x,newPoints.y);
    tri.draw();
   
    //count=1;
    int t=count;
    count--;
    drawChildTriangle(newPoints, count);
    count = t;
    
  }
}
void drawChildHept(point7 temp, int count){
  if(count == 0) return;
  for(int i=0;i<7;i++){
    
    point7 newPoints = new point7();
    PVector tran = new PVector();
    PVector center = center(temp.x[i%7],temp.y[i%7],temp.x[(i+6)%7],temp.y[(i+6)%7]);
     // 3' <-- 0
    newPoints.x[(i+3)%7] = temp.x[(i)%7];
    newPoints.y[(i+3)%7] = temp.y[(i)%7];
    
    // 4' <-- 6
    newPoints.x[(i+4)%7] = temp.x[(i+6)%7];
    newPoints.y[(i+4)%7] = temp.y[(i+6)%7];
        
    // 2' <-- inv(1)
    tran = inverse(center, temp.x[(i+1)%7], temp.y[(i+1)%7], center.z);
    newPoints.x[(i+2)%7] = tran.x;
    newPoints.y[(i+2)%7] = tran.y;
    
    // 1' <-- inv(2)
    tran = inverse(center, temp.x[(i+2)%7], temp.y[(i+2)%7], center.z);
    newPoints.x[(i+1)%7] = tran.x;
    newPoints.y[(i+1)%7] = tran.y;

    // 0' <-- inv(3)
    tran = inverse(center, temp.x[(i+3)%7], temp.y[(i+3)%7], center.z);
    newPoints.x[(i)%7] = tran.x;
    newPoints.y[(i)%7] = tran.y;

    // 6' <-- inv(4)
    tran = inverse(center, temp.x[(i+4)%7], temp.y[(i+4)%7], center.z);
    newPoints.x[(i+6)%7] = tran.x;
    newPoints.y[(i+6)%7] = tran.y;

    // 5' <-- inv(5)
    tran = inverse(center, temp.x[(i+5)%7], temp.y[(i+5)%7], center.z);
    newPoints.x[(i+5)%7] = tran.x;
    newPoints.y[(i+5)%7] = tran.y;
    
    
    Heptagon hept = new Heptagon(newPoints.x,newPoints.y);
    hept.draw();
   
    //count=1;
    int t=count;
    count--;
    drawChildHept(newPoints, count);
    count = t;
  }
  
}

void drawChildPent(point5 temp, int count){
  if(count == 0) return;
  for(int i=0;i<5;i++){
    point5 newPoints = new point5();
    PVector tran = new PVector();
    PVector center = center(temp.x[i],temp.y[i],temp.x[(i+4)%5],temp.y[(i+4)%5]);
     // 1' <-- 0
    newPoints.x[(i+1)%5] = temp.x[(i)%5];
    newPoints.y[(i+1)%5] = temp.y[(i)%5];
    
    // 2' <-- 4
    newPoints.x[(i+2)%5] = temp.x[(i+4)%5];
    newPoints.y[(i+2)%5] = temp.y[(i+4)%5];
        
    // 4' <-- inv(2)
    tran = inverse(center, temp.x[(i+2)%5], temp.y[(i+2)%5], center.z);
    newPoints.x[(i+4)%5] = tran.x;
    newPoints.y[(i+4)%5] = tran.y;
    
    // 1' <-- inv(1)
    tran = inverse(center, temp.x[(i+1)%5], temp.y[(i+1)%5], center.z);
    newPoints.x[(i)%5] = tran.x;
    newPoints.y[(i)%5] = tran.y;

    // 3' <-- inv(3)
    tran = inverse(center, temp.x[(i+3)%5], temp.y[(i+3)%5], center.z);
    newPoints.x[(i+3)%5] = tran.x;
    newPoints.y[(i+3)%5] = tran.y;
    
    
    Pentagon pent = new Pentagon(newPoints.x,newPoints.y);
    pent.draw();
   
    //count=1;
    int t=count;
    count--;
    drawChildPent(newPoints, count);
    count = t;
  }
}
void drawChildSquare(point4 temp, int count){
  
  if(count == 0) return;
  for(int i=0;i<4;i++){
    point4 newPoints = new point4();
    PVector tran = new PVector();
    PVector center = center(temp.x[i],temp.y[i],temp.x[(i+1)%4],temp.y[(i+1)%4]);
    // 3' <-- 0
    newPoints.x[(i+3)%4] = temp.x[(i)%4];
    newPoints.y[(i+3)%4] = temp.y[(i)%4];
    
    // 2' <-- 1
    newPoints.x[(i+2)%4] = temp.x[(i+1)%4];
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
    int t=count;
    count--;
    drawChildSquare(newPoints, count);
    count = t;
    
  }
}
