public class Board{

  int wallWidth;
  int wallHeight;
  int wallLocationX;
  int topWallLocationY;
  int botWallLocationY;
  color backgroundC;
  
  Board(color _backgroundC){
    backgroundC = _backgroundC;
  }

  void displayBoard(){
    background(backgroundC);
    wallWidth = width - width/10;
    wallHeight = height/30;
    wallLocationX = width/2;
    topWallLocationY = 0 + wallHeight;
    botWallLocationY = height - wallHeight;
    rectMode(CENTER);
    fill(120);
    rect(wallLocationX, topWallLocationY, wallWidth, wallHeight, 30);
    rect(wallLocationX, botWallLocationY, wallWidth, wallHeight, 30);
  }
  
}
