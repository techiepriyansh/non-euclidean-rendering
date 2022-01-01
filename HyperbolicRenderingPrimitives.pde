void lineH(float u1, float u2, float v1, float v2) {
  HyperbolicGeodesicArc hgArc = getGeodesicSegmentThrough(u1, u2, v1, v2);

  strokeWeight(2);
  mArc(hgArc.cx, hgArc.cy, hgArc.r, hgArc.startAngle, hgArc.endAngle);
}


class square{
  float[] x=new float[4];
  float[] y=new float[4];
  float scale;
  square(){
    scale=0.5;
    for(int i=0;i<4;i++){
      x[i] = (i==0 || i==3) ? scale : -scale;
    }
    for(int i=0;i<4;i++){
      y[i] = i>=2 ? scale : -scale;
    }
  }
  square(float s){
    scale=s;
    for(int i=0;i<4;i++){
      x[i] = (i==0 || i==3) ? scale : -scale;
    }
    for(int i=0;i<4;i++){
      y[i] = i>=2 ? scale : -scale;
    }
  }
  square(float[] a,float[] b){
    for(int i=0;i<4;i++){
      x[i]=a[i];
    }
    for(int i=0;i<4;i++){
      y[i]=b[i];
    }
  }
  
  square(PVector a,PVector b, PVector c,PVector d){
    x[0]=a.x;x[1]=b.x;x[2]=c.x;x[3]=d.x;
    y[0]=a.y;y[1]=b.y;y[2]=c.y;y[3]=d.y;
  }
  square(PVector[] a){
    for(int i=0;i<4;i++){
      x[i]=a[i].x;
    }
    for(int i=0;i<4;i++){
      y[i]=a[i].y;
    }
  }
  public void draw(){
    for(int i=0;i<4;i++){
        lineH(x[i],y[i],x[(i+1)%4],y[(i+1)%4]);
    }
  }
  
};

class Pentagon{
  float[] x = new float[5];
  float[] y = new float[5];
  float scale;
  Pentagon(){
    scale=0.5;
    for(int i=0;i<5;i++){
      x[i] = scale * cos(2 * i * PI / 5 + PI /2);
      y[i] = scale * sin(2 * i * PI / 5 + PI/ 2);
    }
  }
  Pentagon(PVector a,PVector b, PVector c,PVector d,PVector e){
    x[0]=a.x;x[1]=b.x;x[2]=c.x;x[3]=d.x;x[4]=e.x;
    y[0]=a.y;y[1]=b.y;y[2]=c.y;y[3]=d.y;y[4]=e.y;
  }
  
  Pentagon(float[] a,float[] b){
    for(int i=0;i<5;i++){
      x[i]=a[i];
    }
    for(int i=0;i<5;i++){
      y[i]=b[i];
    }
  }
  public void draw(){
    for(int i=0;i<5;i++){
        lineH(x[i],y[i],x[(i+1)%5],y[(i+1)%5]);
    }
  }
};


class Heptagon{
  float[] x = new float[7];
  float[] y = new float[7];
  float scale;
  Heptagon(){
    scale=0.5;
    for(int i=0;i<5;i++){
      x[i] = scale * cos(2 * i * PI / 7 + PI /2);
      y[i] = scale * sin(2 * i * PI / 7 + PI/ 2);
    }
  }
  
  Heptagon(float[] a,float[] b){
    for(int i=0;i<7;i++){
      x[i]=a[i];
    }
    for(int i=0;i<7;i++){
      y[i]=b[i];
    }
  }
  public void draw(){
    for(int i=0;i<7;i++){
        lineH(x[i],y[i],x[(i+1)%7],y[(i+1)%7]);
    }
  }
};
