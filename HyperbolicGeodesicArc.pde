class HyperbolicGeodesicArc {
  float cx, cy, r, startAngle, endAngle;

  public HyperbolicGeodesicArc(float cx, float cy, float r, float startAngle, float endAngle) {
    this.cx = cx;
    this.cy = cy;
    this.r = r;
    this.startAngle = startAngle;
    this.endAngle = endAngle;
  }
}

HyperbolicGeodesicArc getGeodesicSegmentThrough(float u1, float u2, float v1, float v2) {
  float cx = (-0.5) * ((u2 * (v1 * v1 + v2 * v2 + 1) - v2 * (u1 * u1 + u2 * u2 + 1)) / (u1 * v2 - u2 * v1));
  float cy = (-0.5) * ((v1 * (u1 * u1 + u2 * u2 + 1) - u1 * (v1 * v1 + v2 * v2 + 1)) / (u1 * v2 - u2 * v1));

  float r =  sqrt(cx * cx + cy * cy - 1);

  float angle1 = getAngle((u2-cy), (u1-cx));
  float angle2 = getAngle((v2-cy), (v1-cx));

  float startAngle = min(angle1, angle2);
  float endAngle = max(angle1, angle2);

  if ((endAngle - startAngle) > PI) {
    float temp = endAngle;
    endAngle = startAngle;
    startAngle = temp - 2*PI;
  }

  return new HyperbolicGeodesicArc(cx, cy, r, startAngle, endAngle);
}