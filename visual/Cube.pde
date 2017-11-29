class Cube {

  // Properties
  int w, h, d;
  int shiftX, shiftY, shiftZ;
  
  // Constructor
  Cube(int w, int h, int d, int shiftX, int shiftY, int shiftZ){
    this.w = w;
    this.h = h;
    this.d = d;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
  }

  // Main cube drawing method, which looks 
  // more confusing than it really is. It's 
  // just a bunch of rectangles drawn for 
  // each cube face
  void drawCube(float angleX,float angleY,float angleZ){
  //void drawCube(float angleX,float angleY,float angleZ,
  //              float scaleX,float scaleY,float scaleZ){
    //rotateY(radians(1));
    //rotateX(radians(1));
    //rotateZ(radians(1));
    
    pushMatrix();
    translate(shiftX,shiftY,shiftZ);
    //translate(scaleX,scaleY,scaleZ);
        
    rotateX(angleX);
    rotateY(angleY);
    rotateZ(angleZ);
    //angleX += 0.6;
    //angleY += 0.3;
    //angleZ += 0.2;
    
    beginShape(QUADS);
    // Front face
    vertex(-w/2 , -h/2 , -d/2 ); 
    vertex(w , -h/2 , -d/2 ); 
    vertex(w , h , -d/2 ); 
    vertex(-w/2 , h , -d/2); 

    // Back face
    vertex(-w/2 , -h/2 , d ); 
    vertex(w , -h/2 , d ); 
    vertex(w , h , d ); 
    vertex(-w/2 , h , d );

    // Left face
    vertex(-w/2 , -h/2 , -d/2 ); 
    vertex(-w/2 , -h/2 , d ); 
    vertex(-w/2 , h , d ); 
    vertex(-w/2 , h , -d/2 ); 

    // Right face
    vertex(w , -h/2 , -d/2 ); 
    vertex(w , -h/2 , d ); 
    vertex(w , h , d); 
    vertex(w , h , -d/2 ); 

    // Top face
    vertex(-w/2 , -h/2 , -d/2 ); 
    vertex(w , -h/2 , -d/2 ); 
    vertex(w , -h/2 , d ); 
    vertex(-w/2 , -h/2 , d ); 

    // Bottom face
    vertex(-w/2 , h , -d/2 ); 
    vertex(w , h , -d/2 ); 
    vertex(w , h , d ); 
    vertex(-w/2 , h , d ); 
    //=========================================================
    /*
    // Front face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Back face
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ);

    // Left face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Right face
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Top face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 

    // Bottom face
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 
    */
    //=========================================================
    endShape(); 
    popMatrix();

    // Add some rotation to each box for pizazz.
    // angle = angle+0.1;
    
  }
}