class PointObject {
  public static final float dt = 0.01;

  PVector pos, vel;

  public PointObject(PVector pos, PVector vel) {
    this.pos = pos;
    this.vel = vel;
  }

  public void update() {
    PVector origPos = pos.copy();
    pos.add(PVector.mult(vel, dt));

    float u1 = origPos.x; float v1 = pos.x;
    float u2 = origPos.y; float v2 = pos.y;

    HyperbolicGeodesicArc hgArc = getGeodesicSegmentThrough(u1, u2, v1, v2);
    
    stroke(0);
    strokeWeight(2);
    mArc(hgArc.cx, hgArc.cy, hgArc.r, hgArc.startAngle, hgArc.endAngle);

    float velMag = vel.mag();
    PVector dir = PVector.fromAngle(getAngle(hgArc.cx - pos.x, pos.y - hgArc.cy));
    vel.set(PVector.mult(dir, velMag));
  }

}