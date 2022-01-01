import java.util.Map;

int count = 5;
float time = 0;
float weight = 0.00;
HashMap<Float, Float> mapX = new HashMap<Float, Float>();
HashMap<Float, Float> mapY = new HashMap<Float, Float>();

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
  
  
  float scale = 0.5;
  for(int j=0;j<7;j++){
    point3 points = new point3();
    for(int i=0;i<2;i++){
      points.x[i] = scale * cos(2*(i+j) * PI / 7 + PI/2 + time*weight);
      points.y[i] = scale * sin(2*(i+j) * PI / 7 + PI/2 + time*weight);
    }
    points.x[2]=0.001;points.y[2]=0.001;
    stroke(255,238,3);
    point3 temp = points;
    Triangle tri= new Triangle(points.x,points.y);
    tri.draw();

    drawChildTriangle(temp,count);
    time++;
  }
}

void drawChildTriangle(point3 temp, int count){
  
  if(count == 0) return;
  if(mapX.containsValue(temp.x[0]) && mapX.containsValue(temp.x[1]) && mapX.containsValue(temp.x[2])){
    print("Working");
    if(mapY.containsValue(temp.y[0]) && mapY.containsValue(temp.y[1]) && mapY.containsValue(temp.y[2])){
      print("working");
      return;
    }
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
      mapX.put(newPoints.x[k],1.0);
      mapY.put(newPoints.y[k],1.0);
    }
    drawChildTriangle(newPoints, count);
    count = t;
    
  }
}
