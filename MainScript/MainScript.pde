float amplitude;
float perlinAnim;
float perlinCoeff;

Circle circle;

void setup() {
  size(600, 600);
  frameRate(30);
  
  amplitude = 100;
  perlinAnim = 0.05;
  perlinCoeff = 0.01;
  
  circle = new Circle(10000, 150);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  circle.update();
  circle.display();
}
