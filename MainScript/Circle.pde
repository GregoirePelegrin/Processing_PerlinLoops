class Circle {
  int nbrVertices;
  float initialRadius;
  FloatList xVertices;
  FloatList yVertices;

  float xOffset;
  float yOffset;
  float zOffset;
  
  float time;

  Circle(int v, float ir) {
    this.nbrVertices = v;
    this.initialRadius = ir;
    
    this.xOffset = random(10000);
    this.yOffset = random(10000);
    this.zOffset = random(10000);
    
    this.time = 0;

    this.update();
  }

  void update() {
    this.xVertices = new FloatList();
    this.yVertices = new FloatList();
    
    float incrAngle = 2*PI/this.nbrVertices;
    float currAngle;
    float currX;
    float currY;
    float diffRadius;
    float yCenter = 0.25*cos(this.time);
    float zCenter = 0.25*cos(this.time - PI/2);
    for (int i=0; i<this.nbrVertices; i++) {
      currAngle = incrAngle * i;
      currX = this.initialRadius * cos(currAngle);
      currY = this.initialRadius * sin(currAngle);
      diffRadius = map(noise(perlinCoeff*currX+xOffset, perlinCoeff*currY+yCenter+yOffset, zCenter+zOffset), 0, 1, -amplitude, amplitude);
      this.xVertices.append((this.initialRadius + diffRadius) * cos(currAngle));
      this.yVertices.append((this.initialRadius + diffRadius) * sin(currAngle));
    }
    
    this.time += perlinAnim;
    if(this.time >= TWO_PI) this.time = 0;
  }

  void display() {
    noFill();
    beginShape();
    for (int i=0; i<this.nbrVertices; i++) {
      vertex(this.xVertices.get(i), this.yVertices.get(i));
    }
    endShape(CLOSE);
  }
}
