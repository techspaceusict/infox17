var grid = [];
var board = [];
var mines = [];
var checker = ["BinaryBlood"];
var mine_size = 15;
var k = 1;
var cnv;
var mode = 0;
var check;
var mineCount = mine_size;
var colors = [
  [0, 0, 0],
  [0, 0, 255],
  [0, 200, 0],
  [0, 200, 200],
  [80, 0, 0]
];
/*
    Mode 0 is for revealing
    Mode 1 is for flagging
    Mode 2 is for game Lost
    Mode 3 is for game WON
*/

function centerCanvas() 
{
  var x = (windowWidth - width) / 2;
  var y = 0;
  cnv.position(x, y);
}

function setup() 
{
  if (windowWidth < windowHeight) 
  {
    cnv = createCanvas(windowWidth, windowWidth);
    check = windowWidth;
  }
  else 
  {
    cnv = createCanvas(windowHeight, windowHeight);
    check = windowHeight;
  }
  cnv.parent("sketch-holder");
  centerCanvas();
  restartGame();
}

function windowResized() {
  //resizeCanvas(windowWidth, windowHeight);
  centerCanvas();
}

function wonGame()
{
  mode = 3;
  noStroke();
  fill(0, 0, 0, 180);
  rect(0, 0, width, height);
  fill(255);
  //stroke(255);
  textAlign(CENTER, CENTER);
  text("YOU WON!\nCLICK TO RESTART GAME :D", width/2, height/2);
  noLoop();
}

function lostGame()
{
  console.log("LOST CALLED");
  noStroke();
  fill(0, 0, 0, 180);
  rect(0, 0, width, height);
  fill(255);
  //stroke(255);
  textAlign(CENTER, CENTER);
  text("SHUCKS! CAUGHT A MINE!\nCLICK TO RESTART GAME :D", width/2, height/2);
  noLoop();
}

function restartGame()
{
  document.getElementById("stats").innerHTML = mine_size;
  mineCount = mine_size;
  drawGrid();
  setMines(15);
  setValuesOfGrid();
}

function draw() {
  if (checker.length == 0 && mineCount == 0)
  {
    wonGame();
  }
  if (mouseIsPressed && k == 1 && mode != 2 && mode != 3)
  {
    if (mouseButton == RIGHT)
    {
      k = 0;
      //var size = 10;
      tryToFlag();
    }
  }
}

function mouseReleased()
{
  if (mode != 2 && mode != 3) {
  k = 1;
  displayGrid();
  }
}

function setMines(mineSize) {
  mines = [];
  while (mineSize > 0) {
    var flag = 0;
    var temp = [];
    temp[0] = Math.floor(random(10));
    temp[1] = Math.floor(random(10));
    for (var x = 0; x < mines.length; x++) {
      if (mines[x][0] == temp[0] && mines[x][1] == temp[1]) {
        flag = 1
        break;
      }
    }
    if (flag == 0) {
      mines.push(temp);
      grid[temp[0]][temp[1]].val = -1;
      mineSize--;
    }
  }
  checker = mines;
  console.log(checker);
}

function drawGrid() {
  var size = 10;
  for (var i = 0; i < size; i++) {
    grid[i] = [];
    board[i] = [];
    for (var j = 0; j < size; j++) {
      grid[i][j] = new Cell(i, j, size);
      //grid[i][j].drawCell();
    }
  }
  displayGrid();
}

function displayGrid() {
  background(255);
  var size = 10;
  for (var i = 0; i < size; i++) {
    for (var j = 0; j < size; j++) {
      grid[i][j].drawCell();
    }
  }
  fill(0);
  stroke(255, 0, 0);
  //rectMode(CENTER);
}

function setValuesOfGrid() {
  for (var i = 0; i < 15; i++) {
    var x = mines[i][0];
    var y = mines[i][1];
    for (var a = -1; a < 2; a++) {
      for (var b = -1; b < 2; b++) {
        if (a == 0 && b == 0) continue;
        else {
          if ((x + a) >= 0 &&  (x + a) <= 9 && (y + b) >= 0 && (y + b) <= 9) {
            if (grid[x + a][y + b].val != -1)
              grid[x + a][y + b].increaseCellVal();
          }
        }
      }
    }
  }
  displayGrid();
}

function Cell(a, b, c) {
  this.scale = check / (c+2);
  //console.log(this.scale);
  if (this.scale > 42) this.scale = 42;
  this.x = a;
  this.y = b;
  this.revealed = false;
  this.flagged = false;
  this.val = 0;

  this.drawCell = function() {
    if (this.flagged == false && this.revealed == false) {
      stroke(0);
      fill(255);
      rect(this.scale + this.scale * this.x, this.scale + this.scale * this.y, this.scale, this.scale);
    }

    if (this.flagged == true) {
      stroke(0);
      fill(255, 0, 0);
      rect(this.scale + this.scale * this.x, this.scale + this.scale * this.y, this.scale, this.scale);
    }

    if (this.revealed == true) {
      stroke(0);
      fill(255);
      if (this.flagged == true) fill(255, 0, 0);
      if (this.val != -1 && this.val != 0) {
        fill(220);
        stroke(0);
        rect(this.scale + this.scale * this.x, this.scale + this.scale * this.y, this.scale, this.scale);
        fill(colors[this.val]);
        //stroke(0, 0, 255);
        noStroke();
          textAlign(CENTER, CENTER);
          textSize(this.scale * 0.8);
          text(this.val, this.scale*1.5 + this.scale * this.x, this.scale*1.5 + this.scale*this.y);
      }
      else if(this.val == 0)
      {
        fill(80);
        stroke(0);
        rect(this.scale + this.scale * this.x, this.scale + this.scale * this.y, this.scale, this.scale);
      }
      else {
        fill(220);
        stroke(0);
        rect(this.scale + this.scale * this.x, this.scale + this.scale * this.y, this.scale, this.scale);
        fill(255, 0, 0);
        //stroke(0);
        ellipse(this.scale*3/2 + this.scale*this.x,this.scale*3/2 + this.scale * this.y,
                this.scale*0.8, this.scale*0.8)
      }
    }
  }

  this.isTarget = function() {
    return (mouseX > this.x * this.scale + this.scale) && (mouseX < (this.scale * this.x + 2 * this.scale)) && (mouseY > this.y * this.scale + this.scale) && (mouseY < (this.scale * this.y + 2 * this.scale));
  }

  this.changeColor = function() {
    if (this.flagged == true) {
      fill(255, 0, 0);
    }
    else {
      fill(255);
    }
    rect(this.scale + this.scale * this.x, this.scale + this.scale * this.y, this.scale, this.scale);
  }

  this.increaseCellVal = function() {
    this.val += 1;
  }
}

function mouseClicked() {
  whenMouseClicked();
}

function checkForZeros(x, y) {
  for (var i = -1; i < 2; i += 1) {
    for (var j = -1; j < 2; j++) {
      if ((x + i) >= 0 &&  (x + i) <= 9 && (y + j) >= 0 && (y + j) <= 9)
      {
        if (grid[x+i][y+j].val == 0 && grid[x+i][y+j].revealed == false) {
          grid[x+i][y+j].revealed = true;
          checkForZeros(x+i, y+j);
        }
        else if (grid[x+i][y+j].val != 0 && grid[x+i][y+j].val != -1) {
          grid[x+i][y+j].revealed = true;
        }
      }
    }
  }
}

function mischiefManaged()
{
  for (var i = 0; i < 10; i++)
  {
    for (var j = 0; j < 10; j++)
    {
      if (grid[i][j].revealed != true && grid[i][j].val == -1)
      {
        grid[i][j].revealed = true;
        grid[i][j].drawCell();
      }
    }
  }
  mode = 2;
}

function whenMouseClicked()
{
  var size = 10;
  if (mode == 0) {
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        if (grid[i][j].isTarget() == true) {
          if (grid[i][j].revealed == false && grid[i][j].flagged == false) {
            if (grid[i][j].val == -1) {
              mischiefManaged();
              //alert("Shucks it was a mine! Restart Game.")
            }
            else if (grid[i][j].val == 0) {
              checkForZeros(i, j);
            }
            grid[i][j].revealed= true;
          }
          break;
        }
      }
    }
    displayGrid();
    if (mode == 2) lostGame();
  }
  else if (mode == 1){
    tryToFlag();
  }
  else if (mode == 2 || mode == 3)
  {
    loop();
    restartGame();
    mode = 0;
  }
}

function tryToFlag()
{
  var size = 10;
  var index;
  for (var i = 0; i < size; i++) {
    for (var j = 0; j < size; j++) {
      if (grid[i][j].isTarget() == true) {
        if (grid[i][j].flagged== false && grid[i][j].revealed == false)  {
          grid[i][j].flagged = true;
          var arr = [i, j];
          console.log(arr);
          for (var a = 0; a < checker.length; a++)
          {
            if (checker[a] == arr) 
            {
              index = a;
              break;
            }
          }
          console.log(index);
          if (index != -1) checker.splice(index, 1);
          mineCount--;
          document.getElementById("stats").innerHTML = mineCount;
        }
        else if (grid[i][j].flagged== true && grid[i][j].revealed == false)
        {
          mineCount++;
          document.getElementById("stats").innerHTML = mineCount;
          grid[i][j].flagged = false;
        }
        break;
      }
    }
  }
  console.log(checker);
  displayGrid();
}
