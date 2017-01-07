PImage img;

void settings() {
  int img_scale = 1;
  img = loadImage("data/image.jpg");
  size(img.width/img_scale, img.height/img_scale);
  img.resize(img.width/img_scale, img.width/img_scale);
}

void setup() {
  background(0);
  noLoop();
  blendMode(SCREEN);
}

void draw() {
  loadPixels();
  img.loadPixels();
  
  float xm1 = 0;
  float ym1_r = 0;
  float ym1_g = 0;
  float ym1_b = 0;
  float ym1_avg = 0;
  
  
  for (int y = 0; y < height; y = y + 2) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;
      
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      float avg = (r + b + g);
      
      float scale = 0.13; //ideal for graph
      
      //stroke(r,0,0);
      //line(xm1, ym1_r, x, y - (r*scale)); // - (r * scale)
      //stroke(0,g,0);
      //line(xm1, ym1_g, x, y - (g*scale));
      //stroke(0,0,b);
      //line(xm1, ym1_b, x, y - (b*scale));
      stroke(avg);
      line(xm1, ym1_avg, x, y - (avg * scale));
      
      //float scale = 0.2; //ideal for vertical lines
      //stroke(r,0,0);
      //line(x, y, x, y - (r*scale)); // - (r * scale)
      //stroke(0,g,0);
      //line(x, y, x, y - (g*scale));
      //stroke(0,0,b);
      //line(x, y, x, y - (b*scale));
      ////stroke(avg);
      ////line(x, y, x, y - (avg*scale));
      
      if (x != (width - 1)) {
        xm1 = x;
        ym1_r = y - (r * scale);
        ym1_g = y - (g * scale);
        ym1_b = y - (b * scale);
        ym1_avg = y - (avg * scale);
      } else {
        xm1 = 0;  
      }
    }
  }
  save("data/output.jpg");
}

//loadPixels();
//for (int x = 0; x < width; x++) {
//  for (int y = 0; y < height; y++) {
//    int loc = x + y * width;
//    if (x % 2 == 0) {
//      pixels[loc] = color(255); 
//    } else {
//      pixels[loc] = color(0); 
//    }
//  }
//}

//updatePixels();