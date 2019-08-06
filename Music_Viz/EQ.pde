int eqBottom = 395;
int eqLeft = 178;
void createEQ() {
  fft.analyze(spectrum); 
  for(int i = 0; i < bands; i++){
    float bar_height;
    if(i<= 16)
      bar_height = spectrum[i]*height; 
    else 
      bar_height = spectrum[i]*height * 2;
    if(bar_height >450) {
      bar_height = 450; 
    }
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    //(i+eqColorOffset)%
  strokeWeight(4); 
   tint(.2); 
    
    int bar_height1 = 10; 
    int bar_height2 = 30; 
    for(int y=0; y<round(bar_height/bar_height1); y++){
      int temp; 
      int temp2;

        temp = 10;
        temp2 = 5; 
     
     if(i<=9 || (i>16 && i < 27)) {
      pushMatrix();
      //translate(i%20+((i%20)*20)+eqLeft, height-(y*12+eqBottom), 0); 
      //rect(0, 0, temp, temp2);
     

        translate(eqLeft,height-eqBottom, 0);
        //rotateX(radians(160));
       if(i <=16) {
          noFill();
          stroke(255, 255, 255);
          rect(i%16+((i%16)*30), height-(y*16+height), temp, temp2);
        }
        else {
          stroke(255, 0, 0); 
          rect(i%16+((i%16)*30-30), height-(y*15+height)-30, 20, 30, .3);
        }
        rotateX(180);
        //rotateY(-3);
        if(i <=16) {
          rect(i%16+((i%16)*30), height-(y*16+height), temp, temp2); 
        }
        else {
           rect(i%16+((i%16)*30-30), height-(y*15+height)-50, 20, 30, .3); 
        }

      popMatrix();
     }
    }
  }
        noFill();
}