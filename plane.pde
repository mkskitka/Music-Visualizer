 
void draw_() {
  pushMatrix();
  translate(width/2, height/2 - 25);
  rotateX(PI*.24);
  for (int i=0; i<N; i++) {
    x = map(i, 0, N-1, -l/2, l/2);
    strokeWeight(1.6);
    if(i==0 || i==N-1)
      strokeWeight(4);
    beginShape();
    for (int j=0; j<n; j++) {
      y = map(j, 0, n-1, -w/2-1, w/2+1);
      z = h*sin(TWO_PI*t - q*(x*x + y*y))*exp(-ll*(x*x + y*y));
      vertex(x, y+100, z);
    }
    endShape();
  }
  for (int i=0; i<M; i++) {
    y = map(i, 0, M-1, -w/2, w/2);
    strokeWeight(1.6);
    if(i==0 || i==M-1)
      strokeWeight(4);
    beginShape();
    for (int j=0; j<n; j++) {
      x = map(j, 0, n-1, -l/2-1, l/2+1);
      z = h*sin(TWO_PI*t - q*(x*x + y*y))*exp(-ll*(x*x + y*y));
      vertex(x, y+100, z);
    }
    endShape();
  }
  popMatrix();
}