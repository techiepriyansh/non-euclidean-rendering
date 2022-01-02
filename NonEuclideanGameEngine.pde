import java.util.Map;

int count = 6;
float time = 0;
float weight = 0.0;
float epsilon = 0.001;
float prescision = 100000;
HashMap<Float, Float> mapX = new HashMap<Float, Float>();
HashMap<Float, Float> mapY = new HashMap<Float, Float>();

PointObject pobj1;
PointObject pobj2;

void setup() {
  size(800, 800);
  background(134, 166, 164);
  frameRate(60);
  pixelDensity(1);
  
  
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
  
  
  float scale = 0.5;
  for(int j=0;j<7;j++){
    point3 points = new point3();
    for(int i=0;i<2;i++){
      points.x[i] = scale * cos(2*(i+j) * PI / 7 + PI/2 + time*weight);
      points.y[i] = scale * sin(2*(i+j) * PI / 7 + PI/2 + time*weight);
    }
    points.x[2]=epsilon;points.y[2]=epsilon;
    stroke(255,238,3);
    point3 temp = points;
    Triangle tri= new Triangle(points.x,points.y);
    tri.draw();

    drawChildTriangle(temp,count);
    time++;
  }
  
}

void draw() {
  // // move origin to center
  //translate(width/2, height/2);
  //scale(1, -1);

  //// unit circle
  //fill(0);
  //stroke(0);
  //mCircle(0, 0, 1);

  //// axes
  //line(0, height/2, 0, -height/2);
  //line(width/2, 0, -width/2, 0);
  
  
  //float scale = 0.5;
  //for(int j=0;j<7;j++){
  //  point3 points = new point3();
  //  for(int i=0;i<2;i++){
  //    points.x[i] = scale * cos(2*(i+j) * PI / 7 + PI/2 + time*weight);
  //    points.y[i] = scale * sin(2*(i+j) * PI / 7 + PI/2 + time*weight);
  //  }
  //  points.x[2]=epsilon;points.y[2]=epsilon;
  //  stroke(255,238,3);
  //  point3 temp = points;
  //  Triangle tri= new Triangle(points.x,points.y);
  //  tri.draw();

  //  drawChildTriangle(temp,count);
  //  time++;
  //}
  //mapX.clear();
  //mapY.clear();
  
}

void drawChildTriangle(point3 temp, int count){
  
  if(count == 0) return;
  boolean flag = true;
  for(int i=0;i<3;i++){
    //print(mapX.containsValue(Math.round( temp.x[i]* prescision) / prescision));
    flag&=mapX.containsKey(Math.round( temp.x[i]* prescision) / prescision);
    flag&=mapY.containsKey(Math.round( temp.y[i]* prescision) / prescision);
    
    //flag &= mapX.containsKey(temp.x[i]);
    //flag &= mapX.containsKey(temp.y[i]);
  }
  if(flag){
    print("working");
    return;
  }
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
    for(int k=0;k<3;k++){
      float value1 = Math.round( temp.x[k]* prescision) / prescision;
      float value2 = Math.round( temp.y[k]* prescision) / prescision;
      
      //print(value1+ " " +value2+ "    ");
      mapX.put(value1,1.0);
      mapY.put(value2,1.0);
    }
    print("\n");
    drawChildTriangle(newPoints, count);
    count = t;
    
  }
}
