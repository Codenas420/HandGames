int xKord;
int yKord;

Robot robot;

boolean leftClickPressed = false;
boolean rightClickPressed = false;

void MouseSwitch(String screen) {
  try {
    robot = new Robot();
  }
  catch (Exception e) {
    println("Robot class not supported by your system!");
    exit();
  }
  switch(screen) {
    case("Auswahl"):
    case("main"):
    if (x == 1 && xKord < 1920) {
      xKord = xKord + 3;
    } else if (x == -1 && xKord > 0) {
      xKord = xKord - 3;
    }

    if (y == 1 && yKord > 0) {
      yKord = yKord - 3;
    } else if (y == -1 && yKord < 1080) {
      yKord = yKord + 3;
    }

    robot.mouseMove(xKord, yKord);

    if (fsrReading1 == true && !leftClickPressed) {
      System.out.println("Linksklick ausgelöst");
      robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    } else {
      robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
    }

    if (fsrReading2 == true) {
      System.out.println("Rechtsklick ausgelöst");
      robot.mousePress(InputEvent.BUTTON3_DOWN_MASK);
    } else if (fsrReading2 == false) {
      robot.mouseRelease(InputEvent.BUTTON3_DOWN_MASK);
    }
    break;
    
    //Space Invaders
    case("Auswahl 1"):
    if (x == 1 && xKord < 1920) {
      robot.keyPress(KeyEvent.VK_RIGHT);
    } else if (x == -1 && xKord > 0) {
      robot.keyPress(KeyEvent.VK_LEFT);
    }

    if (y == 1 && yKord > 0) {
      robot.keyPress(KeyEvent.VK_UP);
    } else if (y == -1 && yKord < 1080) {
      robot.keyPress(KeyEvent.VK_DOWN);
    }

    if (fsrReading1 == true && !leftClickPressed) {
      robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    } else if (fsrReading1 == false) {
      robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
    }
    
    if (fsrReading2 == true) {
      robot.mousePress(InputEvent.BUTTON3_DOWN_MASK);
    } else if (fsrReading2 == false) {
      robot.mouseRelease(InputEvent.BUTTON3_DOWN_MASK);
    }
    break;
    
    //Labyrinth
    case("Auswahl 2"):
    if (x == 1 && xKord < 1920) {
      xKord = xKord + 3;
    } else if (x == -1 && xKord > 0) {
      xKord = xKord - 3;
    }

    if (y == 1 && yKord > 0) {
      yKord = yKord - 3;
    } else if (y == -1 && yKord < 1080) {
      yKord = yKord + 3;
    }
    
    robot.mouseMove(xKord, yKord);

    if (fsrReading1 == true && !leftClickPressed) {
      robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    } else if (fsrReading1 == false) {
      robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
    }
    
    if (fsrReading2 == true) {
      robot.mousePress(InputEvent.BUTTON3_DOWN_MASK);
    } else if (fsrReading2 == false) {
      robot.mouseRelease(InputEvent.BUTTON3_DOWN_MASK);
    }
    break;
    
    //Snake
    case("Auswahl 3"):
    if (x == 1 && xKord < 1920) {
      robot.keyPress(KeyEvent.VK_RIGHT);
    } else if (x == -1 && xKord > 0) {
      robot.keyPress(KeyEvent.VK_LEFT);
    }

    if (y == 1 && yKord > 0) {
      robot.keyPress(KeyEvent.VK_UP);
    } else if (y == -1 && yKord < 1080) {
      robot.keyPress(KeyEvent.VK_DOWN);
    }

    if (fsrReading1 == true && !leftClickPressed) {
      robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    } else if (fsrReading1 == false) {
      robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
    }
    
    if (fsrReading2 == true) {
      robot.mousePress(InputEvent.BUTTON3_DOWN_MASK);
    } else if (fsrReading2 == false) {
      robot.mouseRelease(InputEvent.BUTTON3_DOWN_MASK);
    }
    break;
    
    //Tetris
    case("Auswahl 4"):
    if (x == 1 && xKord < 1920) {
      robot.keyPress(KeyEvent.VK_D);
    } else if (x == -1 && xKord > 0) {
      robot.keyPress(KeyEvent.VK_A);
    }

    if (y == 1 && yKord > 0) {
      robot.keyPress(KeyEvent.VK_RIGHT);
    } else if (y == -1 && yKord < 1080) {
      robot.keyPress(KeyEvent.VK_LEFT);
    }

    if (fsrReading1 == true && !leftClickPressed) {
      robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    } else if (fsrReading1 == false) {
      robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
    }

    if (fsrReading2 == true) {
      robot.mousePress(InputEvent.BUTTON3_DOWN_MASK);
    } else if (fsrReading2 == false) {
      robot.mouseRelease(InputEvent.BUTTON3_DOWN_MASK);
    }
    break;
    
    //Minesweeper
    case("Auswahl 5"):
    if (x == 1 && xKord < 1920) {
      xKord = xKord + 3;
    } else if (x == -1 && xKord > 0) {
      xKord = xKord - 3;
    }

    if (y == 1 && yKord > 0) {
      yKord = yKord - 3;
    } else if (y == -1 && yKord < 1080) {
      yKord = yKord + 3;
    }

    robot.mouseMove(xKord, yKord);

    if (fsrReading1 == true) {
      robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    } else if (fsrReading1 == false) {
      robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
    }

    if (fsrReading2 == true && !leftClickPressed) {
      robot.mousePress(InputEvent.BUTTON3_DOWN_MASK);
    } else if (fsrReading2 == false) {
      robot.mouseRelease(InputEvent.BUTTON3_DOWN_MASK);
    }
    break;
    
    //Desktop
    case("Auswahl 6"):
    if (x == 1 && xKord < 1920) {
      xKord = xKord + 3;
    } else if (x == -1 && xKord > 0) {
      xKord = xKord - 3;
    }

    if (y == 1 && yKord > 0) {
      yKord = yKord - 3;
    } else if (y == -1 && yKord < 1080) {
      yKord = yKord + 3;
    }

    robot.mouseMove(xKord, yKord);

    if (fsrReading1 == true && !leftClickPressed) {
      robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    } else if (fsrReading1 == false) {
      robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
    }

    if (fsrReading2 == true) {
      robot.mousePress(InputEvent.BUTTON3_DOWN_MASK);
    } else if (fsrReading2 == false) {
      robot.mouseRelease(InputEvent.BUTTON3_DOWN_MASK);
    }
    break;
  }
}
