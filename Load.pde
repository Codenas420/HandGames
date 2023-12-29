
//import processing.video.*;
//import gifAnimation.*;

public PImage PlayButton, Back, Credits, Exit;
public PImage[] Auswahl;

//Movie backgroundVideo;
//Gif backgroundGif;

int Gameanzahl = 6;

public String GameName;

public Rectangle mainRectangle, creditsRectangle, exitRectangle;
public Rectangle[] selectionRectangles = new Rectangle[Gameanzahl];
public Rectangle backRectangle;

public boolean loadimage() {

  //backgroundVideo = new Movie(this, "C:\\Users\\Niklas\\Desktop\\img\\Background.mp4");
  //backgroundVideo.play();

  //backgroundGif = new Gif(this, "C:\\Users\\Niklas\\Desktop\\img\\Background.gif");
  //backgroundGif.loop();
  
  Credits = loadImage("Bilder/Credits.png"); //credits
  creditsRectangle = new Rectangle(width-280, 30, 250, 250, "main", Credits, " ");
  
  Exit = loadImage("Bilder/Exit.png"); //exit
  exitRectangle = new Rectangle(30, 30, 250, 250, "main", Exit, " ");

  PlayButton = loadImage("Bilder/Play.png");
  int size = min(width, height) / 4;
  int xPos = (width - size) / 2;
  int yPos = (height - size) / 2;
  mainRectangle = new Rectangle(width/2-250, height/2-250, 500, 500, "main", PlayButton, " ");

  Back = loadImage("Bilder/Zuruck.png");
  int centerX = width / 2;
  int centerY = height / 2;
  int offsetX = (size + 180) * 3 / 2;
  int offsetY = (size + 180) * 2 / 2;
  backRectangle = new Rectangle(width/21, height - 120, 300, 100, "Auswahl", Back, " ");

  Auswahl = new PImage[Gameanzahl];

  for (int i = 0; i < Gameanzahl; i++) {
    GameName = setGameTexts(i);
    Auswahl[i] = loadImage("Bilder/Auswahl" + i + ".png");
    if (Auswahl[i] != null) {
      xPos = centerX - offsetX + (i % 3) * (size + 200);
      yPos = centerY - offsetY + (i / 3) * (size + 150);
      // Verwende den entsprechenden Text aus gameTexts anstatt GameName
      selectionRectangles[i] = new Rectangle(xPos, yPos, 300, 300, "Auswahl " + (i + 1), Auswahl[i], GameName);
    } else {
      println("Bild konnte nicht geladen werden: " + "Bilder/Auswahl" + i + ".png");
    }
  }
  return true;
}

/*
public void loadgif() {
  System.out.println("starte");
  backgroundGif = new Gif(this, "C:\\Users\\Niklas\\Desktop\\img\\Background.gif");
  backgroundGif.pause();
  System.out.println("fertig");
}
*/

public String setGameTexts(int i) {
  // Erstelle ein Array von Strings für die Texte
  String[] textArray = new String[Gameanzahl];
  textArray[0] = "Space Invaders";
  textArray[1] = "Labyrinth";
  textArray[2] = "Snake";
  textArray[3] = "Tetris";
  textArray[4] = "Minesweepers";
  textArray[5] = "Desktop";

  GameName = textArray[i];

  return GameName;
}
