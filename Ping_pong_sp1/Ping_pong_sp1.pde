char player1ControlUp = 'w';
char player1ControlDown = 's';
char player2ControlUp = 'o';
char player2ControlDown = 'l';

Board board = new Board(color(random(100, 255), random(100, 255), random(100, 255)));
Player1 player1 = new Player1("Nicolai", player1ControlUp, player1ControlDown, player2ControlUp, player2ControlDown);
Player2 player2 = new Player2("Luna", player1ControlUp, player1ControlDown, player2ControlUp, player2ControlDown);
Ball ball = new Ball(player1.move(), player2.move());

void setup() {
  size(1000, 600);
}

void draw() {
  board.displayBoard();
  player1.displayPaddle();
  player1.move();
  player2.displayPaddle();
  player2.move();
  ball.displayBall();
  ball.ballMovement(player1.move(), player1.displayPaddle(), player2.move());
  
}
