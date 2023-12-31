class MainMenu{
  
  
  MainMenu(){
  }
  
  //Draw the main menu
  void display(){
    background(0);
    fill(255);
    rect(0,0,SCREENX,30);
    textFont(gameFont,70);
    textAlign(CENTER);
    fill(255);
    stroke(255);
    text("Willkommen",SCREENX/2,SCREENY/4);
    textFont(gameFont,40);
    text("zu Space Invaders",SCREENX/2,SCREENY/3);
    text("1 Spieler",SCREENX/2,SCREENY/2);
    text("Wie gespielt wird",SCREENX/2,2*SCREENY/3);
    text("Exit",SCREENX/2,SCREENY-SCREENY/6);
    fill(255,0,0);
    noStroke();
    if(selection1 == true && frameCount%20<10){
      text("1 Spieler",SCREENX/2,SCREENY/2);
    }
    else if(selection2 == true && frameCount%20<10){
      text("Wie gespielt wird",SCREENX/2,2*SCREENY/3);
    }
    else if(selection3 == true && frameCount%20<10){
      text("Exit",SCREENX/2,SCREENY-SCREENY/6);
    }
    stroke(255);
    line(0,0,0,SCREENY);
    line(1,0,1,SCREENY);
    line(SCREENX-1,0,SCREENX-1,SCREENY);
    line(SCREENX-2,0,SCREENX-2,SCREENY);
    line(0,SCREENY-1,SCREENX,SCREENY-1);
    line(0,SCREENY-2,SCREENX,SCREENY-2);
    if(abs(currentSelection)%3==2){
      selection1 = true;
      selection2 = false;
      selection3 = false;
    }
      if(abs(currentSelection)%3==1){
      selection1 = false;
      selection2 = true;
      selection3 = false;
    }
      if(abs(currentSelection)%3==0){
      selection1 = false;
      selection2 = false;
      selection3 = true;
    }
  }
 
 //Display each element on the how-to page
 void displayHowTo(){
   background(0);
   
   //General drawing
   fill(255);
   stroke(255);
   line(0,0,0,SCREENY);
   line(1,0,1,SCREENY);
   line(SCREENX-1,0,SCREENX-1,SCREENY);
   line(SCREENX-2,0,SCREENX-2,SCREENY);
   line(0,SCREENY-1,SCREENX,SCREENY-1);
   line(0,SCREENY-2,SCREENX,SCREENY-2);
   rect(0,0,SCREENX,30);
   textAlign(CENTER);
   textFont(gameFont,30);
   text("Zurück (Links)",SCREENX/2-10,2*SCREENY/16-60);
   textFont(gameFont,60);
   text("Was du wissen solltest:",SCREENX/2-10,2*SCREENY/16+4);
    
   //Draw an invader_1 
   noStroke();
   rect(2*SCREENX/8-.5*INVADER1_WIDTH,3*SCREENY/16-.1*INVADER1_HEIGHT,1*INVADER1_WIDTH,.2*INVADER1_HEIGHT);
   rect(2*SCREENX/8-.4*INVADER1_WIDTH,3*SCREENY/16-.2*INVADER1_HEIGHT,.8*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   rect(2*SCREENX/8-.3*INVADER1_WIDTH,3*SCREENY/16-.3*INVADER1_HEIGHT,.6*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   rect(2*SCREENX/8-.2*INVADER1_WIDTH,3*SCREENY/16-.4*INVADER1_HEIGHT,.4*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   rect(2*SCREENX/8-.1*INVADER1_WIDTH,3*SCREENY/16-.5*INVADER1_HEIGHT,.2*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   fill(255,0,0);
   rect(2*SCREENX/8-.2*INVADER1_WIDTH,3*SCREENY/16-.2*INVADER1_HEIGHT,.1*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   rect(2*SCREENX/8+.1*INVADER1_WIDTH,3*SCREENY/16-.2*INVADER1_HEIGHT,.1*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   fill(255);
   rect(2*SCREENX/8-.3*INVADER1_WIDTH,3*SCREENY/16+.1*INVADER1_HEIGHT,.15*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   rect(2*SCREENX/8+.15*INVADER1_WIDTH,3*SCREENY/16+.1*INVADER1_HEIGHT,.15*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
     
   rect(2*SCREENX/8-.4*INVADER1_WIDTH,3*SCREENY/16+.2*INVADER1_HEIGHT,.1*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   rect(2*SCREENX/8-.15*INVADER1_WIDTH,3*SCREENY/16+.2*INVADER1_HEIGHT,.3*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
   rect(2*SCREENX/8+.3*INVADER1_WIDTH,3*SCREENY/16+.2*INVADER1_HEIGHT,.1*INVADER1_WIDTH,.1*INVADER1_HEIGHT);
 
   rect(2*SCREENX/8-.5*INVADER1_WIDTH,3*SCREENY/16+.3*INVADER1_HEIGHT,.1*INVADER1_WIDTH,.2*INVADER1_HEIGHT);
   rect(2*SCREENX/8-.3*INVADER1_WIDTH,3*SCREENY/16+.3*INVADER1_HEIGHT,.15*INVADER1_WIDTH,.2*INVADER1_HEIGHT);
   rect(2*SCREENX/8+.15*INVADER1_WIDTH,3*SCREENY/16+.3*INVADER1_HEIGHT,.15*INVADER1_WIDTH,.2*INVADER1_HEIGHT);
   rect(2*SCREENX/8+.4*INVADER1_WIDTH,3*SCREENY/16+.3*INVADER1_HEIGHT,.1*INVADER1_WIDTH,.2*INVADER1_HEIGHT);

    //Draw an invader_2
    fill(255);
    noStroke();
       
    rect(2*SCREENX/8-0.344*INVADER2_WIDTH,4*SCREENY/16-5,0.729*INVADER2_WIDTH,0.5833*INVADER2_HEIGHT);
    rect(2*SCREENX/8-0.3958*INVADER2_WIDTH,4*SCREENY/16-5+0.2166*INVADER2_HEIGHT,0.833*INVADER2_WIDTH,0.25*INVADER2_HEIGHT);
    rect(2*SCREENX/8-0.2396*INVADER2_WIDTH,4*SCREENY/16-5-0.0833*INVADER2_HEIGHT,0.5208*INVADER2_WIDTH,0.2166*INVADER2_HEIGHT);
      
    rect(2*SCREENX/8-0.135*INVADER2_WIDTH,4*SCREENY/16-5-0.166*INVADER2_HEIGHT,0.1042*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);
    rect(2*SCREENX/8+0.073*INVADER2_WIDTH,4*SCREENY/16-5-0.166*INVADER2_HEIGHT,0.1042*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);
    rect(2*SCREENX/8-0.2396*INVADER2_WIDTH,4*SCREENY/16-5-0.25*INVADER2_HEIGHT,0.1042*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);
    rect(2*SCREENX/8+0.177*INVADER2_WIDTH,4*SCREENY/16-5-0.25*INVADER2_HEIGHT,0.1042*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);
       
    rect(2*SCREENX/8-0.1875*INVADER2_WIDTH,4*SCREENY/16-5+0.5833*INVADER2_HEIGHT,0.1042*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);
    rect(2*SCREENX/8+0.125*INVADER2_WIDTH,4*SCREENY/16-5+0.5833*INVADER2_HEIGHT,0.1042*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);

    rect(2*SCREENX/8-0.4792*INVADER2_WIDTH,4*SCREENY/16-5-0.0833*INVADER2_HEIGHT,0.0833*INVADER2_WIDTH,0.4166*INVADER2_HEIGHT);
    rect(2*SCREENX/8+0.4375*INVADER2_WIDTH,4*SCREENY/16-5-0.0833*INVADER2_HEIGHT,0.0833*INVADER2_WIDTH,0.4166*INVADER2_HEIGHT);
    rect(2*SCREENX/8-0.271*INVADER2_WIDTH,4*SCREENY/16-5+0.6666*INVADER2_HEIGHT,0.0833*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);
    rect(2*SCREENX/8+0.229*INVADER2_WIDTH,4*SCREENY/16-5+0.6666*INVADER2_HEIGHT,0.0833*INVADER2_WIDTH,0.0833*INVADER2_HEIGHT);
    fill(255,0,0);
    rect(2*SCREENX/8-0.2396*INVADER2_WIDTH,4*SCREENY/16-5+0.166*INVADER2_HEIGHT,0.0833*INVADER2_WIDTH,0.1333*INVADER2_HEIGHT);
    rect(2*SCREENX/8+0.198*INVADER2_WIDTH,4*SCREENY/16-5+0.166*INVADER2_HEIGHT,0.0833*INVADER2_WIDTH,0.1333*INVADER2_HEIGHT);
         
    //Draw an invader 3
    noStroke();
    fill(255);

    rect(2*SCREENX/8-.15*INVADER3_WIDTH,5*SCREENY/16-.45*INVADER3_HEIGHT,.3*INVADER3_WIDTH,.15*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.10*INVADER3_WIDTH,5*SCREENY/16-.50*INVADER3_HEIGHT,.05*INVADER3_WIDTH,.05*INVADER3_HEIGHT);
    rect(2*SCREENX/8+.05*INVADER3_WIDTH,5*SCREENY/16-.50*INVADER3_HEIGHT,.05*INVADER3_WIDTH,.05*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.25*INVADER3_WIDTH,5*SCREENY/16-.30*INVADER3_HEIGHT,.5*INVADER3_WIDTH,.1*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.15*INVADER3_WIDTH,5*SCREENY/16-.20*INVADER3_HEIGHT,.3*INVADER3_WIDTH,.1*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.05*INVADER3_WIDTH,5*SCREENY/16-.10*INVADER3_HEIGHT,.1*INVADER3_WIDTH,.1*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.15*INVADER3_WIDTH,5*SCREENY/16,.30*INVADER3_HEIGHT,.1*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.25*INVADER3_WIDTH,5*SCREENY/16+.10*INVADER3_HEIGHT,.5*INVADER3_WIDTH,.1*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.15*INVADER3_WIDTH,5*SCREENY/16+.20*INVADER3_HEIGHT,.3*INVADER3_WIDTH,.1*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.15*INVADER3_WIDTH,5*SCREENY/16+.30*INVADER3_HEIGHT,.05*INVADER3_WIDTH,.2*INVADER3_HEIGHT);
    rect(2*SCREENX/8-.02*INVADER3_WIDTH,5*SCREENY/16+.30*INVADER3_HEIGHT,.05*INVADER3_WIDTH,.2*INVADER3_HEIGHT);
    rect(2*SCREENX/8+.10*INVADER3_WIDTH,5*SCREENY/16+.30*INVADER3_HEIGHT,.05*INVADER3_WIDTH,.2*INVADER3_HEIGHT);

    fill(255,0,0);
    rect(2*SCREENX/8-.10*INVADER3_WIDTH,5*SCREENY/16-.42*INVADER3_HEIGHT,.05*INVADER3_WIDTH,.05*INVADER3_HEIGHT);
    rect(2*SCREENX/8+.05*INVADER3_WIDTH,5*SCREENY/16-.42*INVADER3_HEIGHT,.05*INVADER3_WIDTH,.05*INVADER3_HEIGHT);
   
   
    //Draw the power ups
    noStroke();
    fill(255);    
    rect(2*SCREENX/8-.5*POWER_UP_WIDTH,6*SCREENY/16-.1*POWER_UP_HEIGHT,POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,6*SCREENY/16-.3*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,6*SCREENY/16+.1*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,6*SCREENY/16-.2*POWER_UP_HEIGHT,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,6*SCREENY/16,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,6*SCREENY/16-.4*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,6*SCREENY/16+.2*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.1*POWER_UP_WIDTH,6*SCREENY/16-.5*POWER_UP_HEIGHT,.2*POWER_UP_WIDTH,POWER_UP_HEIGHT);
    fill(255,0,0);
    textAlign(CENTER);
    triangle(2*SCREENX/8,6*SCREENY/16-.3*POWER_UP_HEIGHT,2*SCREENX/8,6*SCREENY/16,2*SCREENX/8-.2*POWER_UP_WIDTH,6*SCREENY/16);
    triangle(2*SCREENX/8,6*SCREENY/16+.3*POWER_UP_HEIGHT,2*SCREENX/8,6*SCREENY/16,2*SCREENX/8+.2*POWER_UP_WIDTH,6*SCREENY/16);
      
    noStroke();
    fill(255);    
    rect(2*SCREENX/8-.5*POWER_UP_WIDTH,7*SCREENY/16-.1*POWER_UP_HEIGHT,POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,7*SCREENY/16-.3*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,7*SCREENY/16+.1*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,7*SCREENY/16-.2*POWER_UP_HEIGHT,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,7*SCREENY/16,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,7*SCREENY/16-.4*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,7*SCREENY/16+.2*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.1*POWER_UP_WIDTH,7*SCREENY/16-.5*POWER_UP_HEIGHT,.2*POWER_UP_WIDTH,POWER_UP_HEIGHT);
    fill(255,0,0);
    textAlign(CENTER);
    ellipse(2*SCREENX/8,7*SCREENY/16,.2*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
      
    noStroke();
    fill(255);    
    rect(2*SCREENX/8-.5*POWER_UP_WIDTH,8*SCREENY/16-.1*POWER_UP_HEIGHT,POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,8*SCREENY/16-.3*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,8*SCREENY/16+.1*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,8*SCREENY/16-.2*POWER_UP_HEIGHT,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,8*SCREENY/16,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,8*SCREENY/16-.4*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,8*SCREENY/16+.2*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.1*POWER_UP_WIDTH,8*SCREENY/16-.5*POWER_UP_HEIGHT,.2*POWER_UP_WIDTH,POWER_UP_HEIGHT);
    fill(255,0,0);
    textAlign(CENTER);
    textFont(gameFont,25);
    text("3",2*SCREENX/8,8*SCREENY/16+10);
      
    noStroke();
    fill(255);    
    rect(2*SCREENX/8-.5*POWER_UP_WIDTH,9*SCREENY/16-.1*POWER_UP_HEIGHT,POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,9*SCREENY/16-.3*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.3*POWER_UP_WIDTH,9*SCREENY/16+.1*POWER_UP_HEIGHT,.6*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,9*SCREENY/16-.2*POWER_UP_HEIGHT,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.4*POWER_UP_WIDTH,9*SCREENY/16,.8*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,9*SCREENY/16-.4*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,9*SCREENY/16+.2*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.2*POWER_UP_HEIGHT);
    rect(2*SCREENX/8-.1*POWER_UP_WIDTH,9*SCREENY/16-.5*POWER_UP_HEIGHT,.2*POWER_UP_WIDTH,POWER_UP_HEIGHT);
    fill(255,0,0);
    textAlign(CENTER);
    rect(2*SCREENX/8-.2*POWER_UP_WIDTH,9*SCREENY/16-.2*POWER_UP_HEIGHT,.4*POWER_UP_WIDTH,.4*POWER_UP_HEIGHT);
      
    //Draw the buttons to press for controls
    fill(255);
    rect(2*SCREENX/8-POWER_UP_WIDTH/2,11*SCREENY/16-POWER_UP_HEIGHT/2,POWER_UP_WIDTH,POWER_UP_HEIGHT);
    rect(2*SCREENX/8-POWER_UP_WIDTH/2,12*SCREENY/16-5,POWER_UP_WIDTH,POWER_UP_HEIGHT/2);
    rect(2*SCREENX/8-POWER_UP_WIDTH/2,13*SCREENY/16-POWER_UP_HEIGHT/2,POWER_UP_WIDTH,POWER_UP_HEIGHT);
    rect(2*SCREENX/8-POWER_UP_WIDTH/2,14*SCREENY/16-POWER_UP_HEIGHT/2,POWER_UP_WIDTH,POWER_UP_HEIGHT);
    rect(2*SCREENX/8-POWER_UP_WIDTH/2,15*SCREENY/16-POWER_UP_HEIGHT/2,POWER_UP_WIDTH,POWER_UP_HEIGHT);
    fill(255,0,0);
    textFont(gameFont,14);
    text("Space",2*SCREENX/8,12*SCREENY/16+6);
    textFont(gameFont,25);
    triangle(2*SCREENX/8-10,13*SCREENY/16-10,2*SCREENX/8+POWER_UP_HEIGHT/2-5,13*SCREENY/16,2*SCREENX/8-10,13*SCREENY/16+10);
    triangle(2*SCREENX/8+POWER_UP_HEIGHT/2-5,14*SCREENY/16-10,2*SCREENX/8-10,14*SCREENY/16,2*SCREENX/8+POWER_UP_HEIGHT/2-5,14*SCREENY/16+10);
    text("P",2*SCREENX/8,15*SCREENY/16+10);
    text("X",2*SCREENX/8,11*SCREENY/16+10);
      
      
    //Equals signs  
    text("=",3*SCREENX/8,3*SCREENY/16+10);
    text("=",3*SCREENX/8,4*SCREENY/16+10);
    text("=",3*SCREENX/8,5*SCREENY/16+10);
    text("=",3*SCREENX/8,6*SCREENY/16+10);
    text("=",3*SCREENX/8,7*SCREENY/16+10);
    text("=",3*SCREENX/8,8*SCREENY/16+10);
    text("=",3*SCREENX/8,9*SCREENY/16+10);
    text("=",3*SCREENX/8,11*SCREENY/16+10);
    text("=",3*SCREENX/8,12*SCREENY/16+10);
    text("=",3*SCREENX/8,13*SCREENY/16+10);
    text("=",3*SCREENX/8,14*SCREENY/16+10);
    text("=",3*SCREENX/8,15*SCREENY/16+10);
      
    //Information
    textAlign(LEFT);
    fill(255);
    text("30 points",4*SCREENX/8,3*SCREENY/16+10);
    text("40 points",4*SCREENX/8,4*SCREENY/16+10);
    text("50 points",4*SCREENX/8,5*SCREENY/16+10);
    text("Speed Up",4*SCREENX/8,6*SCREENY/16+10);
    text("FireRate up",4*SCREENX/8,7*SCREENY/16+10);
    text("Spray",4*SCREENX/8,8*SCREENY/16+10);
    text("Strong Bullets",4*SCREENX/8,9*SCREENY/16+10);
    text("Activate Power Up",4*SCREENX/8,11*SCREENY/16+10);
    text("Shoot",4*SCREENX/8,12*SCREENY/16+10);
    text("Move Right",4*SCREENX/8,13*SCREENY/16+10);
    text("Move Left",4*SCREENX/8,14*SCREENY/16+10);
    text("Pause",4*SCREENX/8,15*SCREENY/16+10);
 }
}
