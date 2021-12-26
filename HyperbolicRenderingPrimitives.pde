void lineH(float u1, float u2, float v1, float v2) {
  HyperbolicGeodesicArc hgArc = getGeodesicSegmentThrough(u1, u2, v1, v2);
  
  stroke(0);
  strokeWeight(2);
  mArc(hgArc.cx, hgArc.cy, hgArc.r, hgArc.startAngle, hgArc.endAngle);
}
