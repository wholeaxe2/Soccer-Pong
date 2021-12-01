class Ball {
  //Variables
  int ballX, ballY, ballMoveX, ballMoveY, directionX=0, directionY=0;
  int ballSpeedX, ballSpeedY;
  int ballStartX, ballStartY, ballDiameter; //Will be final variables
  color colour;
  int scorePlayer1, scorePlayer2;
  Boolean ballXLeftGoal=false, ballXRightGoal=false;
  //
  //int ballCount = 5; //requires pure java class for true static varaibles
  //needs to be coded first in Processing
  //
  //Constructor, populates the variables
  Ball(float widthParameter, float heightParameter) { //Passsing Geometry
    ballStartX = int(widthParameter/2); //will begin as one varaible, but might change b/c easter egg
    ballStartY = int(heightParameter/2); //see above
    this.ballX = ballStartX; //ALways starts in middle
    this.ballY = ballStartY;
    this.ballXLeftGoal = false;
    this.ballXRightGoal = false;
    ballDiameter = int(widthParameter/70); //Will soon need a procedure for this or a choice of code'
    ballSpeedX = int( random (1, 5) ); //Not best practice to repeat code, but OK
    ballSpeedY = int( random (1, 5) ); //Here b/c "next line"
    colour = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    //gameStart() now in constructor
    while ( directionX == 0 ) {
      directionX = int (random (-2, 2) );
    }//End WHILE
    while ( directionY == 0 ) {
      directionY = int (random (-2, 2) );
    }//End WHILE
  }//End Constructor
  //
  void ballDraw() {
    //Background here will cover each individual ball
    gamePlay();
    fill(colour);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
    fill(0); //Reset fill
  }//End ballDraw
  //
  void gamePlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if ( ballX < (width*0)+ballDiameter || ballX > width - ballDiameter) { //Net Detection
      ballXLeftGoal = true;
      if (ballX < (width*0)+ballDiameter ) { //Goal for left player
        ballX = (width*0)+(ballDiameter/4);
        ballY = ballY; //Variable becomes "final" here
      }
      if ( ballX > width - ballDiameter ) { //Goal for right player
      ballXRightGoal = true;
        ballX = (width)-(ballDiameter/4);
        ballY = ballY; //Variable becomes "final" here
      }
    } //End Net Detection
     println("1.", ballXLeftGoal, "\t2.", ballXRightGoal);
    //
    //Top and Bottom Boundary Bounce, accounting for increased ball movement per "step"
    // Bounce of Top and Bottom: bounce is a range and we move the ball if out-of-bounds
    if ( (ballY >= height*0 && ballY <= height*0+ballDiameter) || ( ballY <= height && ballY >= height-ballDiameter ) ) directionY =  directionY * (-1);
    if ( ballY < 0 || ballY > height ) {
      directionY =  directionY * (-1);
      if (ballY < 0) ballY = height*0 - (ballDiameter/2);
      if (ballY > height) ballY = height - (ballDiameter/2);
    }
    //
    //Ball "Step"
    if (ballXLeftGoal == true || ballXRightGoal == true) { //EMPTY IF to skip ball arithmetic, when score happens
    } else {
      ballMoveX = ballSpeedX*directionX;
      ballMoveY = ballSpeedY*directionY;
      ballX += ballMoveX;
      ballY += ballMoveY;
    }
    //
    //Bouncing off Left and Right Paddle
    //See directionYSetter that runs in main program
    //
    //
  }//End gamePlay
  //
  //Getters & Setters
  Boolean ballLeftGoalGetter() { //Score Communication
    return ballXLeftGoal;
  }
  Boolean ballRightGoalGetter() { //Score Communication
    return ballXRightGoal;
  }
  int ballXGetter() {
    return ballX;
  }//End ballXGetter
  int ballYGetter() {
    return ballY;
  }//End ballYGetter
  int ballDiameterGetter() {
    return ballDiameter;
  }//End ballDiameterGetter
  void directionYSetter(int paddleXLeft, int paddleYLeft, int paddleXRight, int paddleYRight, int paddleWidth, int paddleHeight) {
    if ( (ballY >= paddleYLeft && ballY <= paddleYLeft+paddleHeight) || ( ballY >= paddleYRight && ballY <= paddleYRight+paddleHeight) ) {
      if (ballX <= paddleXLeft+paddleWidth+ballDiameter ) directionX = directionX * (-1);
      if (ballX >= paddleXRight - ballDiameter) directionX = directionX * (-1);
    }//End ballY IF
  }//End directionYSetter
}//End Ball
