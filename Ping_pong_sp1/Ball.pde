public class Ball {

  int ballWidth = 20;
  float movementSpeedX = random(-2, -3);
  float movementSpeedY = random(-3, 3);
  int ballPosX = 500;
  int ballPosY = 300;
  int player1PaddlePos;
  int player2PaddlePos;
  color c = color(random(255), random(255), random(255));

  Ball(int _player1PaddlePos, int _player2PaddlePos) {
    player1PaddlePos = _player1PaddlePos;
    player2PaddlePos = _player2PaddlePos;
  }

  void displayBall() {
    fill(c);
    ellipse(ballPosX, ballPosY, ballWidth, ballWidth);
  }

  void ballMovement(int _paddlePosition, int _paddleHeight, int _paddlePositionRight) {
    int paddlePosition = _paddlePosition;
    int paddleHeight = _paddleHeight;
    int paddlePositionRight = _paddlePositionRight;
    this.ballPosX = ballPosX + (int) movementSpeedX;
    this.ballPosY = ballPosY + (int) movementSpeedY;

    ifHitWall();

    ifScore();
    
    ifHitPaddleLeft(paddleHeight, paddlePosition);
    
    ifHitPaddleRight(paddleHeight, paddlePositionRight);
    
  }

  private void resetBall() {
    ballPosY = height/2;
    ballPosX = width/2;
  }

  private void hitWall() {
    movementSpeedY *= -1;
  }

  private void hitPaddle() {
    movementSpeedX *= -1;
  }

  private void ifHitWall() {
    int topEdge = 0 + ballWidth + height/30;
    int botEdge = height - ballWidth - height/30;

    if (ballPosY < topEdge) {
      hitWall();
    } else if (ballPosY > botEdge) {
      hitWall();
    }
  }

  private void ifScore() {
    if (ballPosX <= 0) {
      resetBall();
    } else if (ballPosX >= width) {
      resetBall();
    }
  }
  
  private void ifHitPaddleLeft(int paddleHeight, int paddlePosition){
      int[] paddleBoundary = new int[paddleHeight];
    for (int i = 0; i < paddleBoundary.length; i++) {
      paddleBoundary[i] = paddlePosition + i;
    }

    if (this.ballPosX == width/10) {
      for (int i = 0; i < paddleBoundary.length; i++) {
        if (ballPosY == paddleBoundary[i]) {
          hitPaddle();
          //increaseSpeed();
        }
      }
    }
  }
  
  private void ifHitPaddleRight(int paddleHeight, int paddlePositionRight){
          int[] paddleBoundary = new int[paddleHeight];
    for (int i = 0; i < paddleBoundary.length; i++) {
      paddleBoundary[i] = paddlePositionRight + i;
    }
    
    if (this.ballPosX == width - width/10) {
      for (int i = 0; i < paddleBoundary.length; i++) {
        if (ballPosY == paddleBoundary[i]) {
          hitPaddle();
          //increaseSpeed();
        }
      }
    }
  }
  
  /*private void increaseSpeed(){
    movementSpeedX = movementSpeedX * 1.4;
  }
  */
}
