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
