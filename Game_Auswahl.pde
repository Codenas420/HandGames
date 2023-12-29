
import javax.swing.JFrame;
import processing.awt.PSurfaceAWT;

boolean GameStart = false;

void GameSwitch() {
  switch(screen) {
    case "Auswahl":
    case "main":
    break;
    case("Auswahl 1"):
      if(GameStart==false){
      try {
          Runtime.getRuntime().exec("SpaceInvaders/windows-amd64/SpaceInvaders.exe", null, new File("SpaceInvaders/windows-amd64"));
          } catch (IOException e) {
              // Handle the exception here
              e.printStackTrace();
          }
      GameStart = true;
      delay(10000);
    }
    break;
    case "Auswahl 2" :
      if(GameStart==false){
    try {
        Runtime.getRuntime().exec("Labyrinth/windows-amd64/Labyrinth.exe", null, new File("Labyrinth/windows-amd64"));
        } catch (IOException e) {
            // Handle the exception here
            e.printStackTrace();
        }
      GameStart = true;
      delay(10000);
    }
    break;
    case "Auswahl 3" :
      if(GameStart==false){
    try {
        Runtime.getRuntime().exec("Snake/windows-amd64/Snake.exe", null, new File("Snake/windows-amd64"));
        } catch (IOException e) {
            // Handle the exception here
            e.printStackTrace();
        }
      GameStart = true;
      delay(10000);
    }
    break;
    case "Auswahl 4":
      if(GameStart==false){
    try {
        Runtime.getRuntime().exec("Tetris/windows-amd64/Tetris-master.exe", null, new File("Tetris/windows-amd64"));
        } catch (IOException e) {
            // Handle the exception here
            e.printStackTrace();
        }
      GameStart = true;
      delay(10000);
    }
    break;
    case "Auswahl 5":
      if(GameStart==false){
    try {
        Runtime.getRuntime().exec("Minesweeper/windows-amd64/Minesweeper.exe", null, new File("Minesweeper/windows-amd64"));
        } catch (IOException e) {
            // Handle the exception here
            e.printStackTrace();
        }
      GameStart = true;
      delay(10000);
    }
    break;
    case "Auswahl 6":
    minimizeWindow();
    break;
  }
}

void minimizeWindow() {
  JFrame frame = (JFrame)((PSurfaceAWT.SmoothCanvas)getSurface().getNative()).getFrame();
  frame.setState(JFrame.ICONIFIED);
}
