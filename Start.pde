ArrayList xCoords; 
ArrayList yCoords;
int rotateCoff = 0;
float xBlah = width-170;
float yBlah = 140;
int animateT = 1; 
class Star {
  Star(){
    xCoords = new ArrayList();
    yCoords =  new ArrayList();
  }

void renderStarCursor() {
  pushMatrix();
    translate(mouseX, mouseY);
    fill(102);
    stroke(255);
    strokeWeight(2);
    beginShape();
    float coff = .2;
    getStar(coff);
    popMatrix();
}
void getStar(float coff) {
    vertex(0* coff, -50 * coff);
    vertex(14 * coff, -20 * coff);
    vertex(47 * coff, -15 * coff);
    vertex(23 * coff, 7 * coff);
    vertex(29 * coff, 40 * coff);
    vertex(0* coff, 25 * coff);
    vertex(-29 * coff, 40 * coff);
    vertex(-23 * coff, 7 * coff);
    vertex(-47 * coff, -15* coff);
    vertex(-14* coff, -20 * coff);
    endShape(CLOSE);
}
void getSgwiggle1() {
  smooth();
  beginShape();
  curveVertex(0, 0); // the first control point
  curveVertex(5, 4); // is also the start point of curve
  curveVertex(-13, 11);
  curveVertex(20, 25);
  curveVertex(0, 35);
  curveVertex(-10, 37); // the last point of curve
  curveVertex(-10, 37); // is also the last control point
  endShape();
}
void getSgwiggle2() {
  beginShape();
    curveVertex(0, 0); // the first control point
    curveVertex(3, 4); // is also the start point of curve
    curveVertex(-4, 11);
    curveVertex(6, 25);
     curveVertex(0, 35);
    curveVertex(-3, 37); // the last point of curve
    curveVertex(-3, 37); // is also the last control point

  animateT = animateT+1 % 4;
  endShape();
}
void addXY(float x, float y) {
  if(xCoords.size() == 10) {
    xCoords.remove(xCoords.get(0)); 
    yCoords.remove(yCoords.get(0)); 
  }
  xCoords.add(x);
  yCoords.add(y); 
}
void renderStars() {
  
  for(int i=xCoords.size()-1; i>= 0; i--) {
    pushMatrix();
    
    //colorMode(HSB, 100);
    fill(255, 0, 144);
    //translate(xBlah, yBlah, 0);
    translate((float) xCoords.get(i), (float) yCoords.get(i), 0); 
      rotate(radians(rotateCoff)); 
    getStar(.2); 
 
    popMatrix();
  }
  
  rotateCoff+=2; 
  colorMode(RGB, 255); 
}

}

void mouseClicked() {
       //triangle(20, 100, 20, 140, 60, 120);
       //rect(80, 100, 5, 40);
       //rect(100, 100, 5, 40); 
   
   if(mouseX < 60 && mouseX > 20 && mouseY < 140 && mouseY > 100) {
      song.play(); 
      file1.play();
    }
    else if(mouseX < 105 && mouseX > 80 && mouseY < 140 && mouseY > 100) {
      song.pause(); 
      file1.pause();
    }
    else {
       star.addXY(mouseX, mouseY);
    }
}