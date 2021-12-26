// drawing stuff
float SCALING_FACTOR = 100;

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