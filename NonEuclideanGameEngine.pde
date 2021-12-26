float SCALING_FACTOR = 100;

void setup() {
  size(800, 800);
  background(205);
}
void draw() {
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

  lineH(-0.5, 0.5, 0.5, 0.5);
}

void lineH(float u1, float u2, float v1, float v2) {
  float cx = (-0.5) * ((u2 * (v1 * v1 + v2 * v2 + 1) - v2 * (u1 * u1 + u2 * u2 + 1)) / (u1 * v2 - u2 * v1));
  float cy = (-0.5) * ((v1 * (u1 * u1 + u2 * u2 + 1) - u1 * (v1 * v1 + v2 * v2 + 1)) / (u1 * v2 - u2 * v1));
  
  float r =  sqrt(cx * cx + cy * cy - 1);

  float angle1 = getAngle((u2-cy), (u1-cx));
  float angle2 = getAngle((v2-cy), (v1-cx));

  noStroke();
  fill(205, 0, 0);

  stroke(0);
  strokeWeight(2);
  mArc(cx, cy, r, angle1, angle2);
}

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

float getAngle(float y, float x) {
  float angle = atan(y / x);
  if (x < 0) return angle + PI;
  if (y < 0) return angle + 2*PI;
  return angle;
}