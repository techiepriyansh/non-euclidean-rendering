// drawing stuff
float SCALING_FACTOR = 400;

void mCircle(float cx, float cy, float r) {
  circle(cx*SCALING_FACTOR, cy*SCALING_FACTOR, 2*r*SCALING_FACTOR);
}

void mArc(float cx, float cy, float r, float angle1, float angle2) {
  noFill();
  
  float startAngle = min(angle1, angle2);
  float endAngle = max(angle1, angle2);
  
  if((endAngle - startAngle) > PI) {
    float temp = endAngle;
    endAngle = startAngle;
    startAngle = temp - 2*PI;
  }
  
  arc(cx*SCALING_FACTOR, cy*SCALING_FACTOR, 2*r*SCALING_FACTOR, 2*r*SCALING_FACTOR, startAngle, endAngle);
}

// maths stuff
float getAngle(float y, float x) {
  float angle = atan(y / x);
  if (x < 0) return angle + PI;
  if (y < 0) return angle + 2*PI;
  return angle;
}

// important class
class point4{
  public float[] x = new float[4];
  public float[] y = new float[4];
}
class point5{
  public float[] x = new float[5];
  public float[] y = new float[5];
}

class point7{
  public float[] x = new float[7];
  public float[] y = new float[7];
}


PVector inverse(PVector center, PVector point, float r){
  float a = r*r/(pow((point.x - center.x), 2) + pow((point.y - center.y),2));
  PVector ans = new PVector(); 
  ans.x = a*(point.x - center.x) + center.x;
  ans.y = a*(point.y-center.y) + center.y;
  return ans;
}

PVector inverse(PVector center, float x, float y, float r){
  float a = r*r/(pow((x - center.x), 2) + pow((y - center.y),2));
  PVector ans = new PVector(); 
  ans.x = a*(x - center.x) + center.x;
  ans.y = a*(y-center.y) + center.y;
  return ans;
}



PVector center(float u1, float u2, float v1, float v2){
  PVector cen = new PVector();
  cen.x = (-0.5) * ((u2 * (v1 * v1 + v2 * v2 + 1) - v2 * (u1 * u1 + u2 * u2 + 1)) / (u1 * v2 - u2 * v1));
  cen.y = (-0.5) * ((v1 * (u1 * u1 + u2 * u2 + 1) - u1 * (v1 * v1 + v2 * v2 + 1)) / (u1 * v2 - u2 * v1));
  cen.z = sqrt(cen.x * cen.x + cen.y * cen.y - 1);
  return cen;
}

PVector center(PVector U, PVector V){
  float u1 = U.x, u2 = U.y, v1 = V.x, v2 = V.y;
  PVector cen = new PVector();
  cen.x = (-0.5) * ((u2 * (v1 * v1 + v2 * v2 + 1) - v2 * (u1 * u1 + u2 * u2 + 1)) / (u1 * v2 - u2 * v1));
  cen.y = (-0.5) * ((v1 * (u1 * u1 + u2 * u2 + 1) - u1 * (v1 * v1 + v2 * v2 + 1)) / (u1 * v2 - u2 * v1));
  
  cen.z = sqrt(cen.x * cen.x + cen.y * cen.y - 1);
  return cen;
}
