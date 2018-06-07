Wire _topWire;
Wire _leftWireA;
Wire _leftWireB;
Wire _botWire;
Wire _rightWireA;
Wire _rightWireB;
Battery _battery; 
Capacitor _capa;


void setup() {
  size(500, 500);
  background(255, 255,255); 
  _topWire = new Wire(100, 125, 400, 125, true, _rightWireA);
  _leftWireB = new Wire(100, 190, 100, 125, true, _topWire);
  _leftWireA = new Wire(100, 325, 100, 210, true, _leftWireB);
  _botWire = new Wire(400, 325, 100,325, true, _leftWireA); 
  _rightWireB = new Wire(400, 220, 400, 325, true, _botWire);
  _rightWireA = new Wire(400,125, 400,190, true, _rightWireB);
  _topWire.setNext(_rightWireA);
  _battery = new Battery(10, 100, 210 , 190); 
  _capa = new Capacitor(370,200,60,10,20);
}


void draw() { 
  background(255,255,255);
  _topWire.drawWire();
  _rightWireA.drawWire();
  _rightWireB.drawWire();
  _botWire.drawWire();
  _leftWireA.drawWire();
   _leftWireB.drawWire();
  _battery.drawBattery();
  _capa.draw();
  _topWire.drawCharges();
  _rightWireA.drawCharges();
  _rightWireB.drawCharges();
  _botWire.drawCharges();
  _leftWireA.drawCharges();
  _leftWireB.drawCharges();
  
  int m = millis();
  //fill(m % 255);
  //rect(25, 25, 50, 50);
}