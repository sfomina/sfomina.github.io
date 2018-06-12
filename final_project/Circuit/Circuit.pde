Wire _topWire;
Wire _leftWireA;
Wire _leftWireB;
Wire _botWire;
Wire _rightWireA;
Wire _rightWireB;
Battery _battery; 
Capacitor _capa;
Resistor _res;

//5 volt battery, max voltage of capacitor
//100 ohm resistor 
//200 micro farad capacitor 
//RC = time constant = 2 * 10^-2 s
// I max = 0.05 Amps 
                                                                                                 
void setup() {
  size(500, 500);
  background(255, 255,255); 
  _topWire = new Wire(100, 125, 400, 125, true, _rightWireA);
  _leftWireB = new Wire(100, 190, 100, 125, true, _topWire);
  _leftWireA = new Wire(100, 325, 100, 210, true, _leftWireB);
  _botWire = new Wire(400, 325, 100,325, true, _leftWireA); 
  _rightWireB = new Wire(400, 220, 400, 325,true, _botWire);
  _rightWireA = new Wire(400,125, 400,190, true, _rightWireB);
  _topWire.setNext(_rightWireA);
  _battery = new Battery(10, 100, 210 , 190); 
  _capa = new Capacitor(370,200,60,10,20);
  _res = new Resistor(240,125, 100, 260, 140);
}


void draw() { 
  background(255,255,255);
  _topWire.drawWire();
  _rightWireA.drawWire(); 
  _rightWireB.drawWire();
  _botWire.drawWire();
  _leftWireA.drawWire();
   _leftWireB.drawWire();
 
   _res.draw();
  _capa.draw();
  _battery.drawBattery();
  _topWire.drawCharges();
  _rightWireA.drawCharges();
  _rightWireB.drawCharges();
  _botWire.drawCharges();
  _leftWireA.drawCharges();
  _leftWireB.drawCharges();
   
  //println(_rightWireA.getNumCharges());
  
  int m = millis();
  //fill(m % 255);
  //rect(25, 25, 50, 50);
  //attempt to graph
  ////Draw Axes
  //line(width/2 + 30,30, width/2 + 30, height/2);
  //line(width/2 + 30, height/2, width - 30, height/2);
  
  ////Labels
  //fill(255, 0, 0); 
  //text("Time", 3*width/4-30, height/2+25);
  //text("Capacity", width/2-75, height/4+25);
  ////HScrollbar hs = new HScrollbar(width/2+30, height/2+75, width/2-100, 16, 16);
  //float r = (width/2+30 - (width/2 + 30))/5; 
  ////Draw Graph
  //for (float i = 0; i < r; i += 0.2){
  // point(i * 5 + width/2 + 30, height/2 - graph(i) * 130000);
  //}
}