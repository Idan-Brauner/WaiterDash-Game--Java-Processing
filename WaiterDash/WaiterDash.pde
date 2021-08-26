PImage img;
String str = "Score: ";
String str2 = "    Game Over \nPress R for restart";
Music intro = new Music();
Music main = new Music();
Music success = new Music();
Music faild = new Music();
Rect rect2 = new Rect();
Rect rect1 = new Rect();
Ellipse ellipse = new Ellipse();
Image obj1 = new Image();
Image waiter = new Image();
Image start = new Image();
Image exit = new Image();
Text score = new Text();
Text text1 = new Text();
Text end = new Text();


SplashScreen scr = new SplashScreen();

int i,w,flag,x,z=0,a=0,count=0;


void setup() 
  {
    
    size(1280, 720);
  
    img = loadImage("diner.jpg");
    intro.load("Intro Screen.mp3");
    intro.play();
    main.load("main song.mp3");
    success.load("success.mp3");
    faild.load("failed.mp3");
    
    scr.gameName = "       Waiter Dash";
    scr.backgroundColor = color(0, 0, 255);
    scr.gameAuthor1 = "Idan Brauner";
    scr.gameAuthor2 = "Game Number 1";
    scr.imagePath = "waiter2.png";
    
 
    
    rect2.x=810;
    rect2.y=300;
    rect2.width=100;
    rect2.height=50;
    rect2.brush = color(255, 0, 0);
    rect2.pen = color(0, 255, 0);
    rect2.penThickness = 5;
    
    start.width=120;
    start.height=60;
    start.x = width/2-start.width;
    start.y = height/2;
    start.setImage("start.png");
    
    
    exit.width=95;
    exit.height=50;
    exit.x = width/2-start.width+15;
    exit.y = height/2+60;
    exit.setImage("exit.png");
    
    
    waiter.setImage("Waiter.png");
    waiter.width=150;
    waiter.height=150;
    waiter.x = width/2;
    waiter.y = height-waiter.height;
    w = waiter.width;
    
    
    rect1.width=60;
    rect1.height=3;
    rect1.x = width/2+waiter.width-50;
    rect1.y = height-waiter.height+36;
    
    rect1.brush = color(125,0,0);
    
    
    
    obj1.width=40;
    obj1.height=40;
    obj1.x = (int)random(waiter.width-rect1.width,width-obj1.width);
    obj1.y = 0;
    obj1.setImage("pasta.png");
    obj1.direction= Direction.DOWN;
    obj1.speed=4;
    
    
    score.x = 0;
    score.y = 25;
    score.brush = color(255,0,0);
    score.alpha = 255;
    score.text = str;
    score.textSize = 30;
    score.font = "Arial";
    
    
    text1.text = str(a);
    text1.x=100;
    text1.y=25;
    text1.textSize = 30;
    text1.brush=color(255, 0, 0);
    
    end.x = width/2-400;
    end.y = height/2;
    end.brush = color(255,0,0);
    end.alpha = 255;
    end.text = str2;
    end.textSize = 120;
    end.font = "Arial";

    
    flag = 0;
    a=0;
    x=4;
    
 
  }
void draw() 
{
  
 background(img);
  
  if (scr.show()==false)
  {
    
    exit.draw();
    start.draw();
    if( start.width == 0 && start.height == 0)
    {
    text1.draw();
    score.draw();
    waiter.draw();
    obj1.draw();
    rect1.draw();
    text1.text = str(a);
    if(x != 0)
    Heart(i);
   
    if(x !=0)
      fall();
      else
      { 
       Finish();
       count = -1;
      }
    println(x);
    println(a);
    }
    
  }
 
  
}


void keyPressed()
{
  if(keyCode==ESC)
  exit();
  
  if(keyCode==RIGHT)
  {
    if(waiter.x != width-w)
    {
    rect1.x = rect1.x+10;  
    waiter.x = waiter.x+10;
    }
    else
    {
    rect1.x = rect1.x;
    waiter.x = waiter.x;
    }
  }
  if(keyCode==LEFT)
  {
    if(waiter.x != 0)
    {
    rect1.x = rect1.x-10;  
    waiter.x = waiter.x-10;
    }
    else
    {
    rect1.x = rect1.x;
    waiter.x = waiter.x;
    }
  }
  if(key == 'r' || key == 'R')
    setup();
} 

void  mousePressed()
{
  
    if(start.pointInShape(mouseX,mouseY) && mouseButton==LEFT)
    {
      start.width=0;
      start.height=0;
      exit.width=0;
      exit.height=0;
      intro.stop();
      main.play();
    }
    if(exit.pointInShape(mouseX,mouseY) && mouseButton==LEFT)
    {
      exit();
    }
    
}

    
    
  void Heart(int i) //this function indicate how much lifes you have before loosing
  {
    for(i=x;i>0;i--)
    {
    Ellipse life = new Ellipse();
    life.x=waiter.x+i*30;
    life.y=waiter.y+110;
    life.radiusX=10;
    life.radiusY=10;
    life.brush = color(255, 0, 0);
    life.pen = color(255, 125, 0);
    life.penThickness = 2;
    life.draw();
    }
  }
  
  
  void object()  //this function random pick a dish picture from the data folder
  {
    z=0;
    obj1.x=(int)random(waiter.width-rect1.width,width-obj1.width);
    obj1.y = 0;
   
    
    
    
    if(count == 8)
    {
      flag = 1;
      obj1.setImage("heart.png");
      count = 0;
    }
    else
      {
        z = (int)random(1,5);
        if(z==1)
        {
        obj1.setImage("pizza.png");
        count++;
        }
        else if(z==2)
        {
        obj1.setImage("steak.png");
        count++;
        }
        else if(z==3)
        {
        obj1.setImage("pasta.png");
        count++;
        }
        else
        {
        obj1.setImage("noodles.png");
        count++;
        }
      }
    
  }
        
        
          
  void fall()  //this function counting the score and give you an extra heart if you catch hi,
  {
    if(obj1.y == height-obj1.height)
    {
      x--;
      object();
    }
    
    else if(rect1.pointInShape(obj1.x+obj1.width,obj1.y+obj1.height) || rect1.pointInShape(obj1.x,obj1.y+obj1.height))
    {
      if(flag == 1 && x < 4)
      {
      x++;
      success.play();
       
      flag =0;
      }
    a++;
    object();
    } 
   }
    
    void Finish() //close everything and print a massage 
    {
      end.draw();
      waiter.width=0;
      waiter.height=0;
      main.stop();
      if(count != -1)
      faild.play();
      rect1.width=0;
      rect1.height=0;
      obj1.width=0;
      obj1.height=0;
    }
      


  
 
    
