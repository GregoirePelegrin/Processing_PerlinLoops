class Circle {
  int nbrVertices;
  float initialRadius;
  FloatList xVertices;
  FloatList yVertices;

  float xOffset;
  float yOffset;
  float zOffset;
  FloatList perlin;

  Circle(int v, float ir) {
    this.nbrVertices = v;
    this.initialRadius = ir;
    
    this.xOffset = random(10000);
    this.yOffset = random(10000);
    this.zOffset = random(10000);

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
    for (int i=0; i<this.nbrVertices; i++) {
      currAngle = incrAngle * i;
      currX = this.initialRadius * cos(currAngle);
      currY = this.initialRadius * sin(currAngle);
      diffRadius = map(noise(perlinCoeff*currX+xOffset, perlinCoeff*currY+yOffset, zOffset), 0, 1, -amplitude, amplitude);
      this.xVertices.append((this.initialRadius + diffRadius) * cos(currAngle));
      this.yVertices.append((this.initialRadius + diffRadius) * sin(currAngle));
    }
    
    zOffset += perlinAnim;
  }

  void display() {
    noFill();
    stroke(255);
    beginShape();
    for (int i=0; i<this.nbrVertices; i++) {
      vertex(this.xVertices.get(i), this.yVertices.get(i));
    }
    endShape(CLOSE);
  }
}
