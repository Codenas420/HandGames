/* MINESWEEPER */

// Game width/height
int gameWidth = 30;
int gameHeight = 16;
int cellSize = 60;
int textSize = 30;

/* How the array is going to work
 * This array is going to hold the value of the cell.
 * If it's a -1, then it's a shroaded cell and you don't know what's on it.
 * If it's a 0, then it's a blank cell without a number nor a mine or flag.
 * Any number 1-8 will represent the number of mines around it.
 * 9 represents a mine.
 * 10 represents a flag that is actually on top of a mine.
 * 11 represents a flag that is NOT on top of a mine.
 */
int[][] gameBoard = new int[gameWidth][gameHeight];

// This is a percentage array to reveal the percentage chance of something being a mine.
float[][] percentageBoard = new float[gameWidth][gameHeight];

// This represents the percentage chance that a given tile rolls as a mine.
// In a regular expert 30x16 map with 99 mines, the probability that any given cell is a mine is 20.625%.
// Adjust this variable to adjust difficulty. 0.05 is pretty easy. 0.1 is roughly medium. 0.2 is hard.
float mineDensity = 0.20625;

// Tracks the number of remaining mines on the map to test for game completion
int totalMines;

// This variable ensures that your first play will not hit a mine.
boolean firstPlay;

// This variable becomes true when you win the game to prevent you from continuing any mouse input after winning.
boolean gameWin;

// These variables attempt to hold the "Losing Cell X and Losing Cell Y" values when you lose.
// We track the cell that lost you the game so that it can be colored purple on the lose screen.
int lcx, lcy;

void setup()
{
    fullScreen();
    //size(600,360);
    ellipseMode(CENTER);
    rectMode(CORNER);
    textSize(textSize);
    firstPlay = true;
    totalMines = 0;
    lcx = -1;
    lcy = -1;
    gameWin = false;
    
    // initiate the board by rolling the mines randomly.
    for (int i = 0; i < gameWidth; i++)
    {
        for (int j = 0; j < gameHeight; j++)
        {
            if (random(0,1) < mineDensity)
            {
                gameBoard[i][j] = 9;
                totalMines++;
            }
            else
            {
                gameBoard[i][j] = -1;
            }
        }
    }
}

void draw()
{
    background(60);
    
    // Display the remaining mines at the top of the screen
    fill(0,178,238);
    text("Verbleibende Minen: "+totalMines + " (Mit Linksklick setzen)",15,30);
    text("Exit (Rechtsklick)", width-300, 30);
    
    // Draw the Board
    stroke(0);
    for (int i = 0; i < gameWidth; i++)
    {
        for (int j = 0; j < gameHeight; j++)
        {
            // If it's not a mine, draw the number with the corresponding color
            if (gameBoard[i][j] >= 0 && gameBoard[i][j] <= 8)
            {
                // background color of the square
                fill(120);
                rect(i*cellSize,40+(j*cellSize),cellSize,cellSize);
                
                // select a color based on the number
                switch (gameBoard[i][j])
                {
                    case 0: fill(250); break;
                    case 1: fill(0,0,190); break;
                    case 2: fill(0,190,190); break;
                    case 3: fill(190,0,0); break;
                    case 4: fill(190,0,190); break;
                    case 5: fill(190,190,0); break;
                    case 6: fill(0,190,0); break;
                    case 7: fill(150,110,90); break;
                    case 8: fill(150); break;
                    default: fill(120); break;
                }
                
                // Display the number if it isn't 0. 0 means there's no nearby mines
                // and we don't have to put a number there. Just leave it blank.
                if (gameBoard[i][j] != 0)
                {
                    text(gameBoard[i][j],(i*cellSize+textSize),40+(j*cellSize+textSize));
                    
                    // This bit here automatically plays obvious moves for you to make
                    // the game go faster. However, it will cause you to lose the game
                    // if it believes an incorrect move is obvious due to your incorrectly
                    // placed flag. So be careful placing flags incorrectly.
                    if (countNearbyFlags(i,j) == gameBoard[i][j])
                    {
                        openNearbySafeSpaces(i,j);
                    }
                }
            }
            // This draws the flags as red circles, whether they're correctly placed or not
            else if (gameBoard[i][j] == 10 || gameBoard[i][j] == 11)
            {
                fill(190,0,0);
                ellipse(0.5*cellSize+i*cellSize,40+0.5*cellSize+(j*cellSize),cellSize,cellSize);
            }
            // This part draws the spaces you haven't dug into yet as darker spaces.
            else
            {
                fill(60);
                rect(i*cellSize,40+(j*cellSize),cellSize,cellSize);
            }
        }
    }
    
    // If you've lost the game
    if (lcx != -1)
    {
        // This shows all of the mines.
        for (int i = 0; i < gameWidth; i++)
        {
            for (int j = 0; j < gameHeight; j++)
            {
                if (gameBoard[i][j] == 9)
                {
                    fill(190,0,0);
                    ellipse(0.5*cellSize+(i*cellSize),40+0.5*cellSize+(j*cellSize),cellSize,cellSize);
                }
            }
        }
        
        // Displays the game losing move in purple and also the "Try again" text at the top
        fill(255,64,64);
        text("Drücke Linksklick für einen Neustart!",700,30);
        ellipse(0.5*cellSize+(lcx*cellSize),40+0.5*cellSize+(lcy*cellSize),cellSize,cellSize);
    }
    
    // Test to see if you've won the game.
    if (totalMines == 0)
    {
        // If you have any false flags, you haven't won yet.
        int falseFlags = 0;
        for (int i = 0; i < gameWidth; i++)
        {
            for (int j = 0; j < gameHeight; j++)
            {
                if (gameBoard[i][j] == 11)
                {
                    falseFlags++;
                }
            }
        }
        
        // If none of the flags are falsely placed and no mines are left, you win.
        if (falseFlags == 0)
        {
            fill(190,0,190);
            text("Gewonnen! Drücke Linksklick für einen Neustart!",200,25);
            gameWin = true;
        }
    }
}

void mousePressed()
{
    // 'ENTER' restarts the game only if you've won or lost the game.
    if(mouseButton == LEFT && (lcx != -1 || gameWin)){setup();}
    // This if statement on the outside prevents mouse input if the game is won or lost.
    if (lcx == -1 && !gameWin)
    {
        // To make calculation easier, I use mx and my as variables that replace mouseX and
        // mouseY that will basically exactly equal the cell that your mouse is pointing at
        // within the gameBoard array. Basically, your mouse is always pointing to gameBoard[mx][my].
        // Without this, I'd have to write out gameBoard[floor(mouseX/20),floor((mouseY-40)/20)] every time.
        int mx = floor(mouseX / cellSize);
        int my = floor((mouseY-40) / cellSize);
        
        // This first if statement prevents you from hitting a mine on your first move, and actually
        // opens the board up in that space so that you always have a reasonable start to your game.
        if (firstPlay && mouseButton == LEFT)
        {
            createSafeZone(mx,my);
            openSpace(mx,my);
            firstPlay = false;
        }
        // After the first play has been made, you are now allowed to lose the game.
        
        // This is what happens when you flag a cell, and the game won't let you flag anything
        // until you've made your first move, because that wouldn't make sense.
        else if(!firstPlay && mouseButton == LEFT)
        {
            // If you flag a mine, that cell becomes a correctly flagged cell.
            if (gameBoard[mx][my] == 9)
            {
                gameBoard[mx][my] = 10;
                totalMines--;
            }
            // If you flag a cell that is not a mine, it becomes an incorrectly flagged cell.
            else if (gameBoard[mx][my] == -1)
            {
                gameBoard[mx][my] = 11;
                totalMines--;
            }
            // If you unflag a correctly flagged cell, remove the flag and put a mine back inside.
            else if (gameBoard[mx][my] == 10)
            {
                gameBoard[mx][my] = 9;
                totalMines++;
            }
            // If you unflag an incorrectly flagged cell, remove the flag and put a -1 back inside it,
            // which represents that the cell is back to being open and available to dig into.
            else if (gameBoard[mx][my] == 11)
            {
                gameBoard[mx][my] = -1;
                totalMines++;
            }
        }
    }
    if(mouseButton == RIGHT){
       exit(); 
    }
}

// This is the function that creates a safe zone around your first play so that you never hit a mine
// on your first move, because no one has time for that. It also clears mines from the 8 cells around
// your first move too so that you get at least some decent opening to work with and not just one cell
// opened with one single number.
void createSafeZone(int x, int y)
{
    // This double for-loop is a part of a technique I'm using to look at all cells around a given cell.
    // By using this double for-loop, I can use an x-input of x+i-1, and a y-input of y+j-1, and as you
    // cycle through x and y being 0, 1, and, 2, those inputs will look at all surrounding cells.
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            // This if-statement prevents the formula below from using inputs outside of the bounds of
            // the gameBoard array to avoid ArrayOutOfBounds exceptions.
            if ((x+i-1) < 0 || (y+j-1) < 0 || (x+i-1) >= 30 || (y+j-1) >= 16)
            {
                continue;
            }
            else
            {
                // Update the total number of mines if any were cleared during this process.
                if (gameBoard[x+i-1][y+j-1] == 9)
                {
                    totalMines--;
                }
                // Sets the cleared space to space that's ready to be opened.
                gameBoard[x+i-1][y+j-1] = -1;
            }
        }
    }
}

// This is the function that I use to dig into a space and see what's there.
void openSpace(int x, int y)
{
    // Yo, you hit a mine.
    if (gameBoard[x][y] == 9)
    {
        gameLoss(x,y);
    }
    
    // If you didn't lose from the above if-statement, then fill in the cell with the number of
    // surrounding mines using the countNearbyMines() function.
    gameBoard[x][y] = countNearbyMines(x,y);
    
    // This is the magic sauce that continues to open more space when it makes sense to do so, and turns this
    // into a recursive algorithm. If one of the surrounding cells is a zero, then automatically dig into
    // that space and all surrounding spaces to that space, recursively.
    if (countNearbyMines(x,y) == 0)
    {
        // quick algorithm for examining all surrounding cells, as before.
        for (int i = 0; i < 3; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                // Check if out of bounds of game board, as before.
                if ((x+i-1) < 0 || (y+j-1) < 0 || (x+i-1) >= 30 || (y+j-1) >= 16)
                {
                    continue;
                }
                // If a surrounding nearby cell that could be dug into doesn't have a mine and
                // there's no mines around it, dig into that one too automatically through recursion.
                else if (gameBoard[x+i-1][y+j-1] == -1 && countNearbyMines(x+i-1,y+j-1) == 0)
                {
                    gameBoard[x+i-1][y+j-1] = countNearbyMines(x+i-1,y+j-1);
                    openSpace(x+i-1,y+j-1);
                }
                // This bit ends this leg of recursion when it finds a cell that has nearby mines.
                else
                {
                    gameBoard[x+i-1][y+j-1] = countNearbyMines(x+i-1,y+j-1);
                }
            }
        }
    }
}

// This function simply returns the number of nearby mines to a cell.
int countNearbyMines(int x, int y)
{
    int mineCount = 0;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if ((x+i-1) < 0 || (y+j-1) < 0 || (x+i-1) >= 30 || (y+j-1) >= 16)
            {
                continue;
            }
            else
            {
                if (gameBoard[x+i-1][y+j-1] == 9 || gameBoard[x+i-1][y+j-1] == 10)
                {
                    mineCount++;
                }
            }
        }
    }
    return mineCount;
}

// This function counts the number of nearby flags to a cell, and is important for
// making the automatic obvious moves.
int countNearbyFlags(int x, int y)
{
    int flagCount = 0;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if ((x+i-1) < 0 || (y+j-1) < 0 || (x+i-1) >= 30 || (y+j-1) >= 16)
            {
                continue;
            }
            else
            {
                if (gameBoard[x+i-1][y+j-1] == 10 || gameBoard[x+i-1][y+j-1] == 11)
                {
                    flagCount++;
                }
            }
        }
    }
    return flagCount;
}

// This is the function that the game runs to automatically fill in redundant moves, but will
// cause a game loss if the reduntant move was based on the incorrect assumption that your flag
// was properly placed.
void openNearbySafeSpaces(int x, int y)
{
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if ((x+i-1) < 0 || (y+j-1) < 0 || (x+i-1) >= 30 || (y+j-1) >= 16)
            {
                continue;
            }
            else
            {
                // This is what happens when the automatic move is successul.
                if (gameBoard[x+i-1][y+j-1] == -1)
                {
                    openSpace(x+i-1,y+j-1);
                }
                // But sometimes it makes you lose because it assumes your incorrectly placed flag
                // was a correctly placed flag.
                else if (gameBoard[x+i-1][y+j-1] == 9)
                {
                    gameLoss(x+i-1,y+j-1);
                }
            }
        }
    }
}

// Function that retains the cell that caused you to lose the game so that it can be separately colored.
void gameLoss(int x, int y)
{
    lcx = x;
    lcy = y;
} 
