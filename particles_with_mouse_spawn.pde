class dots {
  PVector location, velocity, acc;
  
dots(){
   location = new PVector(random(width), random(height));
   velocity = new PVector();
   acc = new PVector();
}
dots(int x, int y){
   location = new PVector(x, y);
   velocity = new PVector();
   acc = new PVector();
}

void render(){
  fill(0);
  noStroke();
  rect(location.x,location.y,10,10);
}

void update(){
  acc = new PVector(540 - location.x, 540 - location.y);

  acc.limit(.5);
  //Best is .5
  velocity.add(acc);
  //Add acc to the veloicty
  velocity.limit(10);
  //Limit veloicty to 10
  location.add(velocity);
  //add velocity to location
}
}

int number = 0;
//dots [] dot = new dots[number];
ArrayList<dots> dot = new ArrayList<dots>(); 

void setup(){
  size(1080,1080);
  background(255);
  for(int i = 0; i < number;i++){
    //dot[i] = new dots();
    dot.add(new dots());
  }
}

void draw(){
  fill(255,255,255,30);
  rect(0,0,1080,1080);
  for(int i = 0; i < dot.size(); i++){
    dot.get(i).update();
    dot.get(i).render();
    //dot[i].update();
    //dot[i].render();
  }
}
void mouseDragged(){
    dot.add(new dots(mouseX,mouseY));
    
}
