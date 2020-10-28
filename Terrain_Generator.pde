import g4p_controls.*;

Terrain terrain;

void setup() {
    size(600, 600, P3D);
    createGUI();
    terrain = new Terrain(PI/3, 0, 0);
    frameRate(1000);
    PJOGL pgl = (PJOGL)beginPGL();
    pgl.gl.setSwapInterval(1);
    endPGL();

    noiseDetail(4);
}

void draw() {
    // Position canvas accordingly  
    background(0);
    noFill();
    translate(width/2, height/2+50);
    rotateX(terrain.xRotation);
    rotateY(terrain.yRotation);
    rotateZ(terrain.zRotation);
    translate(-width/2-25, -(height/2+100));
    strokeCap(PROJECT); //Increases performance greatly by making points square instead of round

    // Check if mouse has stopped
    if (mouseX == pmouseX && mouseY == pmouseY){
        terrain.scrollSpeed = new PVector(0,0);
}

    terrain.display();
}

// Controls zoom
void mouseWheel(MouseEvent event) {
    // Clamp zoom between 0.01 and 0.03, clamps detail between 4 and 8
    if (event.getCount() == 1) { // Scroll down; zoom out
        terrain.zoom += terrain.zoom>=0.03?0:0.0005;
        terrain.detail -= terrain.detail<=4?0:1;
    } else { // Scroll up; zoom in
        terrain.zoom -= terrain.zoom<=0.01?0:0.0005;
        terrain.detail += terrain.detail>=8?0:1;
    }
    noiseDetail(terrain.detail);
}

void mouseDragged() {
    float xDiff = map(pmouseX - mouseX, 0, 500, 0, 0.1);
    float yDiff = map(pmouseY - mouseY, 0, 500, 0, 0.1);
    
    // Controls scroll
    if (mouseButton == LEFT) {
        terrain.scrollSpeed = new PVector(-xDiff, -yDiff);
    }
}

void mouseReleased() {
    // Stops scroll
    if (mouseButton == LEFT) {
        terrain.scrollSpeed = new PVector(0, 0);
    }
}
