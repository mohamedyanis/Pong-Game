import processing.sound.*;

Puck puck;
Paddle left;
Paddle right;

SoundFile ding;
SoundFile hits;

int lscore = 0;
int rscore = 0;

float midc;
float a,b,c,d,e,f;

void setup() {
  size(1200, 500);
  textSize(32);
  
  ding = new SoundFile(this, "ding.mp3");  
  hits = new SoundFile(this, "hits.mp3");  

  left = new Paddle(true);
  right = new Paddle(false);
  puck = new Puck();
  
  midc = 4*height/10;
  a = width/2;
  b = height/10;
  c = height-height/10;
  d = height/2;
}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 's') {
    left.move(-10);
  } else if (key == 'w') {
    left.move(10);
  }
}

void draw() {
  background(51);
 
  strokeWeight(3.0);
  stroke(127);
  noFill();
  line(a, b, a, c);
  line(0,b,width, b);
  line(0,c,width, c);
  ellipse(a,d,midc,midc);
  
  fill(255);
  text(lscore, 32, 40);
  text(rscore, width-64, 40);

  puck.checkLeft(left);
  puck.checkRight(right);
  
  left.show();
  right.show();
  left.update();
  right.update();

  puck.update();
  puck.edges();
  puck.show();
}
