//The colors of the rainbow will be defined not in a RGB scale, but in a HSB color system. This will allow me to create a single array for the colors of each arc within the rainbow, as opposed to 3 which would be required in a RGB scale.
int[] rainbowColors = new int[]{77, 70, 50, 30, 17, 10, 0};

/*
The initialFlowerPos represents the x position of the central circle of the first flower. 
Every flower will be positioned according to the first flower, which is why I have declared this variable. I don't need a y value, because it will remain the same for all flowers.
*/
int initialFlowerPos = 100;


/*
The flowerXPositions array contains the x position of each flower. It will be accessed in a for loop further below
*/
int[] flowerXPositions = new int[]{initialFlowerPos, initialFlowerPos + 200, initialFlowerPos + 300, initialFlowerPos + 400, initialFlowerPos + 500, initialFlowerPos + 700, initialFlowerPos + 800, initialFlowerPos + 900, initialFlowerPos + 1000};


/*
The following 3 arrays contain the red, green and blue values of each flower. The first index of each array, when combined, form the color of the pedals of the first flower, for example. 
These arrays will be accessed in a for loop further below
*/
int[] flowerRcolors = new int[]{31, 227, 227, 255, 255, 31, 0, 255, 255};
int[] flowerGcolors = new int[]{66, 144, 144, 255, 255, 66, 144, 255, 222};
int[] flowerBcolors = new int[]{117, 201, 201, 255, 255, 117, 204, 255, 0};


//The RainDrop class contains the shapes, colors and behavior of a single rain drop. I have created an array of 20 raindrops
RainDrop[] rainDrops = new RainDrop[20];


//This is the RaindDrop class, the factors and methods of which are specified below
class RainDrop{
  
  /*
    xPos = the x position of an instantiated raindrop, which will be set to random everytime the program starts or the raindrop reaches the bottom of the screen
    yPos = the y position of an instantiated raindrop, which will be set to random everytime the program starts. This number will be set to at least 0, once the raindrop reaches the bottom of the screen
    speed = the velocity at which the raindrop will fall.
  */
  int xPos, yPos, speed;
  
  
  //In the following line, I will be specifying the parameters for the class RainDrop, and through encapsulation, set the values for xPos, yPos and speed.
  RainDrop(int tempxPos, int tempyPos, int tempspeed){
    xPos = tempxPos;
    yPos = tempyPos;
    speed = tempspeed;
  }
  
  
  //The RainDrop object will have a draw function of its own, which will cause the raindrop to be constantly behaving as specified in the following methods
  void draw(){
   
    Fall();
    DrawDrop();
  }
  
  
  //This method is responsible for making the raindrop "fall"
  void Fall(){
    
    //Every frame, the yposition of the raindrop will increase by the specified speed, causing it to be drawn a "speed quantity" of units below the previous frame.
    yPos += speed;
    
    //if yPos >= bottom of the screen
    if(yPos >= 800){
      
      //the y position will be set to a number from -10 to 0. This will make the pattern formed by the rain less predictable
      yPos = (0 - (int(random(10))));
      
      //meanwhile, the x position will be set to a random position across the screen
      xPos = int(random(1400));
    }
  }
  
  //After the position has been set, an ellipse will be drawn, representing the raindrop
  void DrawDrop(){
    fill(68, 223, 246);
    ellipse(xPos, yPos, 10,30);
  }
}

//This class will contain every part of the girl drawing
class Girl{
  
    //this array will define the skin color of the girl.
    int[] skinTone = new int[]{245, 225, 199};
    
    //Similarly, this array contains the RGB color code for the girl's hair
    int[] hairColor = new int[]{245, 213, 66};
    
    //Finally, the dressColor array contains the RGB color code for the girl's dress
    int[] dressColor = new int[]{245,66, 108};
    
    /*
      xHeadPos = the x position of the girl's head.
      yHeadPos = the y position of the girl's head.
      headRadius = the radius of the girl's head
      
      Nearly every other body part will be adjusted according to the position and size of the girl's head
    */
    int xHeadPos, yHeadPos, headRadius;
    
    
    //These will be the parameters of the Girl class
    Girl(int tempXPos, int tempYPos, int tempRadius){
      
      //Similarily to the previous classes, I'm using encapsulation to pass down the values of the girl's head
      xHeadPos = tempXPos;
      yHeadPos = tempYPos;
      headRadius = tempRadius;
      
      //Each function will draw a different body part.
      DrawHair();
      DrawDress();
      DrawHead();
    }
    
    //This function will draw the head of the girl
    void DrawHead(){
      
      //The following two lines will draw and color the actual head
      fill(skinTone[0], skinTone[1], skinTone[2]);
      circle(xHeadPos, yHeadPos, headRadius);
      
      /*
      Lines 127 - 135 will draw the eyes. "fill(0,0,0)/arc(xHeadPos - 25, yHeadPos, 30, 30, PI, 2*PI)" will draw a black half circle. However, because I want to draw her eyes closed, I add 
      another half circle at "fill(skinTone[0], skinTone[1], skinTone[2])/arc(xHeadPos - 25, yHeadPos, 20, 20, PI, 2*PI);", this time coloring as the same RGB code as her skin.
      
      This process is repeated from lines 135 - 138
      */
      fill(0,0,0);
      arc(xHeadPos - 25, yHeadPos, 30, 30, PI, 2*PI);      
      fill(skinTone[0], skinTone[1], skinTone[2]);
      arc(xHeadPos - 25, yHeadPos, 20, 20, PI, 2*PI);
      
      fill(0,0,0);
      arc(xHeadPos + 25, yHeadPos, 30, 30, PI, 2*PI);      
      fill(skinTone[0], skinTone[1], skinTone[2]);
      arc(xHeadPos + 25, yHeadPos, 20, 20, PI, 2*PI);
      
      
      
      //These two lines will draw the girl's mouth. I simply add half a circle, and paint it red
      fill(246, 68, 81);
      arc(xHeadPos, yHeadPos + 20, 40, 30, 0, PI);
      
      
      
    }
    
    void DrawHair(){
      //I will insert the RGB color code in the fill parameters in order to color the girl's hair
      fill(hairColor[0], hairColor[1], hairColor[2]);
      
      //In order to make it look like the circle and rectangle are one shape, I temporarily remove the black outlines with noStroke()
      noStroke();
      
      //This line will draw the upper part of the girl's hair. Essentially, this part is just a circle with a slightly larger radius than the girl's head
      circle(xHeadPos, yHeadPos, headRadius + 20);     
      
      /*This will be the lower part of the girls hair, which will be a rectangle. The rectangle has to have the same width as the upper part's radius in order to make the shapes look 
      like a single one, which is why I'm inputting the headRadius in these parameters
      */
      quad(xHeadPos - (headRadius - 40), yHeadPos, xHeadPos + (headRadius - 40), yHeadPos,  xHeadPos + (headRadius - 40), yHeadPos + 100, xHeadPos - (headRadius - 40), yHeadPos + 100);
     
      //Finally, I will add outlines once again with stroke()
      stroke(0,0,0);
    }
  
    void DrawDress(){
      
      //The next two lines will color and draw the upper part of the girl's dress. This will simply be a rectangle.
      fill(dressColor[0], dressColor[1], dressColor[2]);
      quad(xHeadPos - (headRadius - 60), yHeadPos + 40, xHeadPos + (headRadius - 60), yHeadPos + 40,  xHeadPos + (headRadius - 60), yHeadPos + 200, xHeadPos - (headRadius - 60), yHeadPos + 200);
      
      /*
        The first fill() and tringle() functions (lines 181 and 182)  will draw the girl's right arm, which is why the colors are set to the RGB code of her skin.
        The second fill() and triangle(184, 185) functions will draw the girl's right sleeve, which is why the triangle fill color is the same as the dress.
        
        This process is repeated for lines 187 - 191
      */
      fill(skinTone[0], skinTone[1], skinTone[2]);
      triangle(xHeadPos - (headRadius - 45), yHeadPos + 80, xHeadPos - (headRadius - 60), yHeadPos + 80,  xHeadPos - (headRadius - 60), yHeadPos + 180);
      
      fill(dressColor[0], dressColor[1], dressColor[2]);
      triangle(xHeadPos - (headRadius - 60), yHeadPos + 40,xHeadPos - (headRadius - 60), yHeadPos + 80, xHeadPos - (headRadius - 20), yHeadPos + 80); 
      
      fill(skinTone[0], skinTone[1], skinTone[2]);
      triangle(xHeadPos + (headRadius - 45), yHeadPos + 80, xHeadPos + (headRadius - 60), yHeadPos + 80,  xHeadPos + (headRadius - 60), yHeadPos + 180);
      
      fill(dressColor[0], dressColor[1], dressColor[2]);
      triangle(xHeadPos + (headRadius - 60), yHeadPos + 40,xHeadPos + (headRadius - 60), yHeadPos + 80, xHeadPos + (headRadius - 20), yHeadPos + 80); 
      
      
      
      //This will be the lower part of the dress, which will be an isosceles trapezoid.
      quad(xHeadPos - (headRadius - 60), yHeadPos + 100, xHeadPos + (headRadius - 60), yHeadPos + 100,  xHeadPos + (headRadius - 20), yHeadPos + 400, xHeadPos - (headRadius - 20), yHeadPos + 400);
     
  }
}


//This class contains the factors and methods of a flower
class Flower{
  
    //This is going to represent the angle from the center of the flower at which the next petal will be drawn.
    float angle = 0;
    
    //Everytime a petal is drawn, the angle adds + (360/7) to itself, so that the next petal is drawn on the next point within the generated circumference
    float additionalAngle = 360/7;
    
    
    //This function will ONLY draw a single petal. It doesn't make any calculations or anything else.
    void drawPetal(float xPos, float YPos, int radius, int r, int g, int b){
        fill(r, g, b);
        circle(xPos, YPos, radius);
    }
    
    //Similarly, this funciton only draws the stem (caule) of the flower
    void drawStem(int firstX, int firstY, int secondX, int secondY){
        
        //final variables are constants
        final int yadditioner = 300;
      
        //The two bottom y points of the stem will be the same as the upper ones, but an additional value of 300 will be added to them
        fill(134, 231, 101);
        quad(firstX, firstY, secondX, secondY, secondX, (secondY + yadditioner), firstX, (firstY + yadditioner));
    }
    
    //These are the parameters of the Flower
    //(central circle X position, central circle Y position, radius of the central circle, Red value of the petals, Green value of the petals and Blue value of the pedals)
    Flower(int centralXPoint, int centralYPoint, int centralRadius, int tempR, int tempG, int tempB){
      
      drawStem(centralXPoint + 5, centralYPoint, centralXPoint - 5, centralYPoint);
      
      //Seven petals will be drawn
      for(int i = 0; i < 7; i++){
          float tempYPos, tempXPos;
          //print("flower");
          /*
          During each loop, the application will calculate the y and x points of the next petal by adding the sin of the "angle" variable to the y position, and 
          the cos of the "angle" variable to the x position of the central circle
          */
          tempYPos = centralYPoint + centralRadius*sin((angle*(PI/180)));
          tempXPos = centralXPoint + centralRadius*cos(angle*(PI/180));
          
          //finally, after the x and y coordinates have been calculated, the drawpetal method will be called, drawing a single petal
          drawPetal(tempXPos, tempYPos, 40, tempR, tempG, tempB);
          
          //The angle variable will increase so that the next petal is drawn in a different point within the circumference around the 
          angle += additionalAngle;
          
      }
      
      //This will be the central circle, which will always be colored yellow
      drawPetal(centralXPoint, centralYPoint, centralRadius + 15, 255, 222, 0);
    }
    
    
}

void setup(){
  
  //As the application starts, 20 raindrops are added to the rainDrop array
  for(int i = 0; i < 20; i++){
    rainDrops[i] = new RainDrop(int(random(1400)), int(random(800)), 30);
  }
  
  background(255, 255, 255);
  
  //the window size is set to 1400 by 800
  size(1400, 800);
}

void draw(){
  //The background will be drawn every frame, erasing the frame before as the current one is drawn
   background(255, 255, 255);
 
 //These are functions which aren't as complex or frequent as the flower, raindrops or girl, thus I decided not to include them as classes
  DrawSun();
  DrawRainbow();
  DrawRainDrops();
  
  Girl girl = new Girl(310, 500, 100);
  
   DrawFlowers();
  
  
}

//This simple function draws a yellow circle at the top left corner to the screen, representing the sun
void DrawSun(){
  
  fill(255,252,0);
  circle(0,0, 300);
}

//This function will be calling the draw function of all 20 raindrops every frame, making it look like they are falling
void DrawRainDrops(){
 for(int i = 0; i <20; i++){
    rainDrops[i].draw();
  }
  
}


//This will draw 9 flowers by initiating a new class for every flower
void DrawFlowers(){
  for(int i = 0; i < 9; i++){
    Flower flowey = new Flower(flowerXPositions[i], 700, 30, flowerRcolors[i], flowerGcolors[i], flowerBcolors[i]);
  }
}


//This function will draw the raibow
void DrawRainbow(){
  
  //The first thing to be defined si the colorMode, which will be HSB unlike most elements in this application
  colorMode(HSB, 100);
  
  //this currentFactor variable is what's going to represent the size of every new arc that is drawn to the rainbow
  int currentFactor = 800;
  
  //With every new arc drawn, the proceeding arc will be 50 units smaller in width and height, because of the subtractor variable
  int subtractor = 50;
  for(int i = 6; i > -1; i --){
    
    //Now that I'm using HSB, I can use a single color array in this loop, as opposed to 3. The color array is called rainbowColors
    fill(rainbowColors[i], 100, 100);
    
    //Every arc will be located at the same central point (700,400), the difference being that the currentFactor (which sets the arc height and width) will be decreased by 50 everytime
    arc(700, 400, currentFactor + 100, currentFactor, PI, 2*PI);
    currentFactor -= subtractor;
  }
  
  //Once every arc is drawn, the colorMode is set back to RGB (to avoid coloring problems)
  colorMode(RGB, 255);
  
  //One last arc is drawn and colored as the same color as the background, making it look like the rainbow is made out of bows instead of semi circles
  fill(255, 255, 255);
  arc(700, 400, currentFactor + 100, currentFactor, PI, 2*PI); 
}
