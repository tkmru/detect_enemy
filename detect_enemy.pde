import processing.serial.*;

Serial port; 
int inByte;

int[] graph = {};

void setup(){
  size(500, 500);
  println(Serial.list());
  String arduinoPort = Serial.list()[5];
  port = new Serial(this, arduinoPort, 9600);  // Arduino
}

void draw(){
  delay(1000);
  background(245, 255, 250);
  fill(0, 102, 153);
  graph = append(graph, int(inByte));
  stroke(0, 102, 153); 
  strokeWeight(5);
  int length = graph.length;
  if(length > 100){
    length = 100;
  }
  if(inByte < 15){
    textSize(40);
    background(178, 34, 34);
    text("enemy found", 120, 250);
  }
  for(int i = 0; i<graph.length; i++){
    point(500-(graph.length-i)*5, 500-graph[i]);
  }
  textSize(20); 
  text(inByte, 100, 100);
}

void serialEvent(Serial p){
  delay(100);
  inByte=port.read();
}
