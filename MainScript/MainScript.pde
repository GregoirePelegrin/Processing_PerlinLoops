float amplitude;
float perlinAnim;
float perlinCoeff;

Circle circle;

void setup() {
  size(600, 600);
  frameRate(50);
  background(255);
  stroke(0, 5);
  
  amplitude = 100;
  perlinAnim = 0.05;
  perlinCoeff = 0.01;
  
  circle = new Circle(50000, 150);
}

void draw() {
  translate(width/2, height/2);
  
  circle.update();
  /*if(circle.time == 0){
    stroke(0);
    background(255);
  } else {
    stroke(255);
    background(0);
  }*/
  circle.display();
}
