public class Player1 {

  String playerName;
  char moveUp1;
  char moveDown1;
  char moveUp2;
  char moveDown2;
  int paddleHeight;
  int paddleWidth;
  int paddleStartPos = 300;
  float movementSpeed;

  Player1(String _playerName, char _moveUp1, char _moveDown1, char _moveUp2, char _moveDown2) {
    moveUp1 = _moveUp1;
    moveDown1 = _moveDown1;
    moveUp2 = _moveUp2;
    moveDown2 = _moveDown2;
    playerName = _playerName;
  }

  int displayPaddle() {
    fill(120);
    paddleHeight = height/6;
    paddleWidth = width/100;
    rectMode(CORNER);
    rect(0 + width/10, paddleStartPos, paddleWidth, paddleHeight, 30);
    //println(paddleStartPos);
    return paddleHeight;
  }

  int move() {
    movementSpeed = 2.5;
    int topEdge = 0 + height/30 + height/60;
    int botEdge = height - paddleHeight - height/30 - height/60;
    int output = 0;
    boolean[] keys = new boolean[4];
    for (int i = 0; i < keys.length; i++) {
      keys[i] = false;
    }

    if (key == moveUp1) {
      keys[0] = true;
    } else if (key == moveDown1) {
      keys[1] = true;
    } else if (key == moveUp2) {
      keys[2] = true;
    } else if (key == moveDown2) {
      keys[3] = true;
    }

    if (keyPressed) {
      if (keys[0] && paddleStartPos > topEdge) {
        paddleStartPos -= movementSpeed;
      } else if (keys[0] && keys[2] && paddleStartPos > topEdge) {
        paddleStartPos -= movementSpeed;
      } else if (keys[0] && keys[3] && paddleStartPos > topEdge) {
        paddleStartPos -= movementSpeed;
      } else if (keys[1] && keys[2] && paddleStartPos < botEdge) {
        paddleStartPos += movementSpeed;
      } else if (keys[1] && keys[3] && paddleStartPos < botEdge) {
        paddleStartPos += movementSpeed;
      } else if (keys[1] && paddleStartPos < botEdge) {
        paddleStartPos += movementSpeed;
      }
      return paddleStartPos;
    }
    return paddleStartPos;
  }
}
