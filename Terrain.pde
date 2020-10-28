class Terrain {
    float amplitude = 100; // Amplification of terrain
    int waterLevel = -20; // What level will water start
    PVector scrollSpeed = new PVector(0, 0); // What speed to scroll at
    PVector scroll = new PVector(0, 0);
    float zoom = 0.02;
    int detail = 6;

    float zoff=0;
    float playSpeed = 0;

    float xRotation;
    float yRotation;
    float zRotation;

    Terrain(float xRot, float yRot, float zRot) {
        this.xRotation = xRot;
        this.yRotation = yRot;
        this.zRotation = zRot;
    }

    void display() {
        float yoff = this.scroll.y;

        this.zoff += 0.001*this.playSpeed;
        for (int y = 0; y < height/2; y++) {
            float xoff = this.scroll.x;
            this.scroll.x -= this.scrollSpeed.x;
            this.scroll.y -= this.scrollSpeed.y;
            beginShape();
            for (int x = 0; x < width/2; x++) {
                float noise = map(noise(xoff, yoff, zoff), 0, 1, -this.amplitude, this.amplitude);

                // If land
                if (noise > this.waterLevel) {
                    stroke(0, 255, 0);
                    vertex(x*2.2, y*2.2, noise);
                }
                // If water
                else {
                    // First point is the water surface (flat)
                    stroke(0, 150, 255, 50);
                    vertex(x*2.2, y*2.2, this.waterLevel);
                    // Second point is the ocean bed (you can still see the ocean bed under the water)
                    stroke(0, 0, 255);
                    vertex(x*2.2, y*2.2, noise);
                }     
                xoff += zoom;
            }
            yoff += zoom;
            endShape();
        }
    }
}
