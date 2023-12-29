import processing.video.*;
import gifAnimation.*;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.awt.event.InputEvent;
import processing.serial.*;


public PFont myFont;

public String screen = "main";

public int x;
public int y;

public boolean fsrReading1;
public boolean fsrReading2;

Serial myPort;

class Start {
}
boolean loading = true;
//boolean moviePlaying = true;
//boolean backgroundGifLoaded = false;

void setup() {
  fullScreen();
  frameRate(120);
  loadingScreenload();
  new Thread(new Runnable() {
    public void run() {
      myFont = createFont("Space Age", 32);
      textFont(myFont);
      loadimage();
      loading = false;
    }
  }
  ).start();
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
}

/*
void movieEvent(Movie m) {
 m.read();
 if (m.time() == m.duration()) {
 m.stop();
 moviePlaying = false;
 if (backgroundGifLoaded == false) {
 backgroundGif.loop();
 backgroundGifLoaded = true;
 }
 }
 }
 */

void draw() {
  if (!loading) {
    //tint(255, 50);
    //image(backgroundGif, 0, 0, width, height);
    background(0);
    while (myPort.available() > 0) {
      String sensorReading = myPort.readStringUntil('\n');
      if (sensorReading != null) {
        String[] values = split(sensorReading, '\t');
        if (values.length == 5) {
          x = int(values[0]);
          y = int(values[1]);
          fsrReading1 = boolean(values[2]);
          //fsrReading2 = boolean(values[3]);
          MouseSwitch(screen);
        }
      }
    }
    
    switch (screen) {
    case "main":
      rectMode(CORNER);
      mainRectangle.display();
      creditsRectangle.display();
      exitRectangle.display();
      break;
    case "Auswahl":
      rectMode(CORNER);
      backRectangle.display();
      for (Rectangle rectangle : selectionRectangles) {
        rectangle.display();
      }
      break;
    case "Credits":
      background(0);
      PImage CreditsList = loadImage("Bilder/CreditsList.png");
      image(CreditsList, 0, 0, width, height);
      backRectangle.display();
    break;
    default:
      backRectangle.display();
      break;
    }
  }
  /*else {
   tint(255, 50);
   if (moviePlaying) {
   image(backgroundVideo, 0, 0, width, height);
   } else if (backgroundGifLoaded) {
   image(backgroundGif, 0, 0, width, height);
   }*/
  else {
    background(0);
    image(loadingGif, 0, 0, width, height);
  }
}


void  mousePressed() {
  if (loading) {
  } else {
    switch (screen) {
    case "main":
      if (mainRectangle.isClicked()) {
        screen = "Auswahl";
      }
      else if(creditsRectangle.isClicked()){
         screen = "Credits"; 
      }
      else if(exitRectangle.isClicked()){
         exit();
      }
      break;
    case "Auswahl":
      for (Rectangle rectangle : selectionRectangles) {
        if (rectangle.isClicked()) {
          screen = rectangle.ScreenName;
        } else if (backRectangle.isClicked()) {
          screen = "main";
        }
      }
      break;
    case "Credits":
      if (backRectangle.isClicked()) {
        screen = "main";
      }
      break;
    default:
      if (backRectangle.isClicked()) {
        screen = "Auswahl";
      }
      break;
    }
  }
  GameSwitch();
}
