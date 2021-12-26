float SCALING_FACTOR  = 100;

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
  circle(0, 0, 2*SCALING_FACTOR);

  // axes
  line(0, height/2, 0, -height/2);
  line(width/2, 0, -width/2, 0);

  lineH(0.5, 0, 0, 0.5);

//   ellipse(0.5*SCALING_FACTOR, 0, 10, 10);
//   ellipse(0, 0.5 * SCALING_FACTOR, 10, 10);

//   noFill();
//   arc(200, 200, 200, 200, 0, PI);
}

void lineH(float u1, float u2, float v1, float v2) {
  float cx = ( -0.5) * ((u2 * (v1 * v1 + v2 * v2 + 1) - v2 * (u1 * u1 + u2 * u2 + 1) / (u1 * v2 - u2 * v1)));
  float cy = ( -0.5) * ((v1 * (u1 * u1 + u2 * u2 + 1) - u1 * (v1 * v1 + v2 * v2 + 1) / (u1 * v2 - u2 * v1)));
  
  float r =  sqrt(cx * cx + cy * cy - 1);

  float angle1 = (float)Math.atan((u2-cy)/(u1-cx));
  float angle2 = (float)Math.atan((v2-cy)/(v1-cx));

  stroke(0);
  mArc(cx, cy, r, angle1, angle2);
}

void mArc(float cx, float cy, float r, float angle1, float angle2) {
  noFill();

  float startAngle = min(angle1, angle2);
  float endAngle = max(angle1, angle2);
  
  arc(cx*SCALING_FACTOR, cy*SCALING_FACTOR, 2*r*SCALING_FACTOR, 2*r*SCALING_FACTOR, startAngle + PI, endAngle + PI);
}
