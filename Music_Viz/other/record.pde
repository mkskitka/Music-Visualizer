int si = 0;
float slow = 0;
void drawStereo() {
    
    strokeWeight(1);
    float x = width-170;
    float y = 140;
    int z = 0;
    rectMode(CENTER);
    pushMatrix();
    translate(x,y,z);
    stroke(255);
    fill(20);
    rect(0, 0, 300, 250);
    fill(0);
    rotate(radians(si%360)); 
    ellipse(0, 0, 195, 200);
    for(int i=0; i< 15; i++) {
      ellipse(0, 0, 193/3+(i*10), 200/3+(i*10));
    }
    stroke(0);
    fill(255, 0, 144);
    ellipse(0, 0, 193/3, 200/3);
    fill(20); 
    ellipse(0, 0, 193/20, 200/20);
    popMatrix();
    
    pushMatrix();
    rectMode(CORNER);
    stroke(255);
    noFill();
    fill(255);
    noFill();
    rect(width-50, 40, 15, 15);
    translate(x+126, y-80, z);  
    rotate(radians(round(si/1500)%45));
    //RECORD POINTER 
    rect(0, 0, 5, 140);
    stroke(225);
    star.getSgwiggle1(); 
    translate(5, 145); 
    //rotateY(slow); 
    stroke(225, 225, 153); 
    strokeWeight(3);
    int x1 = -2; 
    int y1 = 0;
    int x2 = -2; 
    int y2 = 14; 
    
    ////line(-2, 0, -2, 14);
    //line(4, 0, 8, 20);
    //line(-8, 0, -10, 16);
    
    float xt = lerp(x1, x2, slow/2%1);
    float yt = lerp(y1, y2, slow/2%1);
    line(x1, y1, xt, yt); 
    line(4, 0, lerp(4, 10, slow/3%1), lerp(0, 25, slow/3%1));
    line(-8, 0, lerp(-8, -14, slow/5%1), lerp(0, 22, slow/5%1));
    line(6, -2, lerp(6, 22, slow/4%1), lerp(-2, 1, slow/4%1));
    line(-10, -2, lerp(-10, -25, slow/3%1), lerp(-2, 1, slow/3%1)); 
    

    
    si = si+2;
    slow = slow+.1; 
    popMatrix();
}

void animateRecord() {
  
  if(round((si/500)%45) > 43) {
    playSong(); 
  }
  si+=150; 
}