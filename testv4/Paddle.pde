class Paddle {
  //Variables
  color colour, white=#FFFFFF;
  int paddleXLeft, paddleXRight, paddleYLeft, paddleYRight, paddleWidth, paddleHeight;
  int yMove; //Possible Easteregg to move paddles differently requires two vars
boolean upLeft=false, downLeft=false, upRight=false, downRight=false;
  int leftScore=0, rightScore=0;
  float leftBoardX, leftBoardY, boardSide, rightBoardX, rightBoardY;
  String left, right;
  float textSize;
  
  //Constructor, populates the variables
  Paddle (float widthParameter, float heightParameter) { //Passsing Geometry
    this.colour = color (int(random(100, 255)), int(random(50, 255)), int(random(175, 255)));
    paddleWidth = int(heightParameter*1/80); //no "this" thus no change ever
    paddleXRight = int(widthParameter*39/40) - paddleWidth;
    paddleXLeft = int(widthParameter*1/40);
    paddleHeight = int(heightParameter*1/4);
    this.paddleYLeft = int(heightParameter*1/2) - paddleHeight*1/2;
    this.paddleYRight = paddleYLeft; 
    this.upLeft = false;
    this.downLeft = false;
    this.upRight = false;
    this.downRight = false;
    this.yMove = int( (heightParameter / heightParameter) * 5);
    boardSide = heightParameter*1/10;
    leftBoardX = paddleXLeft;
    leftBoardY = heightParameter*0;
    rightBoardX = paddleXRight-boardSide;
    rightBoardY = leftBoardY;
    textSize = width*1/10;
  }//End Constructor
  //
  void paddleDraw() {
    //Background here will cover each individual ball
    fill(colour);
    gamePlay(); //Arithmetic Code, Security Feature
    rect (paddleXLeft, paddleYLeft, paddleWidth, paddleHeight);
    rect (paddleXRight, paddleYRight, paddleWidth, paddleHeight);
    fill(0); //Reset fill
  }//End ballDraw
  //
  void gamePlay() {
    // Bouncing Off Left Paddle
    //
    // Bouncing off Right Paddle
    //
    // Moving Left Paddle
    // 
    if ( upLeft == true && downLeft == false) {
      paddleYLeft -= yMove;
      upLeft = false;
    }
    if (upLeft == false && downLeft == true) {
      paddleYLeft += yMove;
      downLeft = false;
    }
    //
    // Moving Right Paddle
    if ( upRight == true && downRight == false) {
      paddleYRight -= yMove;
      upRight = false;
    }
    if (upRight == false && downRight == true) {
      paddleYRight += yMove;
      downRight = false;
    }
    //
    // Redrawing Paddle if too High
    if ( paddleYLeft < height * 0) paddleYLeft = 0;
    if (paddleYLeft  > height - paddleHeight ) paddleYLeft = height - paddleHeight;
    //
    // Redrawing Paddle if too Low
    if ( paddleYRight < height * 0) paddleYRight = 0;
    if (paddleYRight > height - paddleHeight ) paddleYRight = height - paddleHeight;
    //
    //Printing the Scoreboard
    fill(white); //board background
    //rect(leftBoardX, leftBoardY, boardSide, boardSide);
    //rect(rightBoardX, rightBoardY, boardSide, boardSide);
    fill(colour); //reset
    //println(leftScore, rightScore);
    textSize(textSize); //Change value until it works //Algorithm should takes the smaller side
    //Note about: autosizing algorithm exists for in CS20 that could be explored here
    textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
    //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
    //See flatText (CS10) or dynamicText (CS20) or Processing.org for more text functions
    text(Integer.toString(leftScore), leftBoardX, leftBoardY, boardSide, boardSide);
    text(Integer.toString(rightScore), rightBoardX, rightBoardY, boardSide, boardSide);
  }//End gamePlay
  //
  // Getters and Setters
  void upLeftGetter() { //Get Keyboard input
    upLeft = true;
  }
  void downLeftGetter() { //Get Keyboard input
    downLeft = true;
  }
  void upRightGetter() { //Get Keyboard input
    upRight = true;
  }
  void downRightGetter() { //Get Keyboard input
    downRight = true;
  }
  int paddleXLeftGetter() {
    return paddleXLeft;
  }//End Paddle X Left Getter
  int paddleXRightGetter() {
    return paddleXRight;
  }//End Paddle X Left Getter
  void leftScoreSetter() { //Set Left Score Variable
    leftScore++;
  }
  void rightScoreSetter() { //Set Right Score Variable
    rightScore++;
  }
  int paddleWidthGetter() {
    return paddleWidth;
  }//End Paddle X Left Getter
  int paddleYLeftGetter() {
    return paddleYLeft;
  }//End Paddle X Left Getter
  int paddleYRightGetter() {
    return paddleYRight;
  }//End Paddle X Left Getter
  int paddleHeightGetter() {
    return paddleHeight;
  }//End paddleHeight Getter
  //
}//End Ball
