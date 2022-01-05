PVector position0;
PVector position1;

int renderSpeed = 15;
float webbingSpeed = 1;
float colIncrement = 0.02;

int movingState = 0;
float col = 0;

void setup() {
  size(800, 600);
  
  colorMode(HSB);
  
  position0 = new PVector(0, 0);
  position1 = new PVector(width, height);
  
  background(0);
  stroke(255);
}

void draw() {
  for (int i = 0; i < renderSpeed; i++) {
    move();
    
    col = col > 255 ? 0 : col + colIncrement * webbingSpeed;
    stroke(col, 255, 255);
    
    line(position0.x, position0.y, position1.x, position1.y);
  }
}

void move() {
  switch(movingState) {
    case 0:
      position0.add(webbingSpeed, 0);
      movingState = position0.x >= width ? 1 : movingState;
      
      break;
    case 1:
      position1.add(-webbingSpeed, 0);
      movingState = position1.x <= 0 ? 2 : movingState;
      
      break;
    case 2:
      position0.add(0, webbingSpeed);
      movingState = position0.y >= height ? 3 : movingState;
      
      break;
    case 3:
      position1.add(0, -webbingSpeed);
      movingState = position1.y <= 0 ? 4 : movingState;
      
      break;
    case 4:
      position0.add(-webbingSpeed, 0);
      movingState = position0.x <= 0 ? 5 : movingState;
      
      break;
    case 5:
      position1.add(webbingSpeed, 0);
      movingState = position1.x >= width ? 6 : movingState;
      
      break;
    case 6:
      position0.add(0, -webbingSpeed);
      movingState = position0.y <= 0 ? 7 : movingState;
      
      break;
    case 7:
      position1.add(0, webbingSpeed);
      movingState = position1.y >= height ? 0 : movingState;
      
      break;
  }
}
