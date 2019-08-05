            // by d whyte
 
int[][] result;
float t;
int bands = 32;
FFT fft = new FFT(this, bands);
int eqColorOffset = 0;
int backgroundFlash = 0; 
boolean playSong = false; 
int bgSqWidth = 50; 
import processing.sound.*; // import sound library
GlobalState gs; 
PImage musicIcon;
SoundFile file1; // choice 1
Amplitude amp; 
float x, y, z, tt;
int N = 24, M = 16;
float l = 520, w = 400;
int n = 120;
PFont f; 
float h = 30; //height 
float q = 0.00011; //frequency of sine was
float ll = .000035; //Is anythin else affected 
int samplesPerFrame = 1;
int numFrames = 20;        
float shutterAngle = .8;
int frameC = 0;
Star star;
AudioMetaData meta; 
boolean fileSelected = false; 
  
import ddf.minim.*;
import ddf.minim.analysis.BeatDetect;

Minim minim;
AudioPlayer song;
BeatDetect beat;
Sound s; 

float[] spectrum = new float[bands];
 
float ease(float p) {
  return 3*p*p - 2*p*p*p;
}
 
float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}
 
float mn = .5*sqrt(3);
 
void setup() {
    background(20);
    beat = new BeatDetect();
    musicIcon = loadImage("music.png"); 
    size(800, 600, P3D);
    smooth(100);
    f = loadFont("STHeitiTC-Medium-48.vlw");
    textFont(f, 28);
    result = new int[width*height][3];
    gs = new GlobalState(); 
    selectInput("Select a file to process:", "fileSelected");
    
      minim = new Minim(this);
 


    star = new Star(); 
}

void openFileChooser() {
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    println("selection" + selection); 
    song = minim.loadFile(selection.getName(), 2048);
    meta = song.getMetaData();
    file1 = new SoundFile(this, selection.getName()); // creates the sound file
    fileSelected = true; 
  }
}

void playSong() {
    song.play();
    file1.play();
    song.setVolume(0);
    fft.input(file1);
    s = new Sound(this);
    s.volume(0);
    playSong = true; 
}
 
void draw() {
  
    if(fileSelected == true && playSong == false) {
      animateRecord();
    }
      if(frameC <= numFrames*2) {
        frameC++;
      }

      float mover = map(frameCount, 0, numFrames, 0, 1); 
      t = map(frameC, 0, numFrames, 0, 1);
      
      background(20);
      if(playSong) {
        beat.detect(song.mix);
       if(beat.isOnset()) {
          text("BEAT!", width/2.2 , 100);
          frameC = 0;
        }
        //text( meta.author(), 5+mover, 5); 
        //text(meta.title(), 5+mover, mover);
      }
     // text("Length (in milliseconds): " + meta.length(), 5, mover);
     
      
      //star.renderStarCursor();
      star.renderStars();
      
   
        noFill();
        stroke(0); 
        h=30;
        if(frameC >= numFrames*2)
           h=0;
        draw_();
        stroke(0, 191, 255); 
        h=40;
        if(frameC >= numFrames*2)
           h=0;
        draw_();
        
     createEQ();
     drawStereo();
     if(playSong) {
       text(meta.fileName(), 10, 40+t);
      
       text(song.position()/1000 + "s /"+ song.length()/1000 + "s", 10, 70); 
       fill(255); 
       triangle(20, 100, 20, 140, 60, 120);
       rect(80, 100, 5, 40);
       rect(100, 100, 5, 40); 
       stroke(255);
       noFill();
       rect(50, height-80, 50, 50); 
        textFont(f, 14);
       text("LOAD", 55, height-60); 
       //text(song.length(), 20, 60); 
     }

}
 
//////////////////////////////////////////////////////////////////////////////

 