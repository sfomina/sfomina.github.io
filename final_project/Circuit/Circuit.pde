Wire _topWire;
Wire _leftWire;
Wire _botWire;
Wire _rightWire;
Capacitor _capa;
//Charge _Q; 

void setup() {
  size(500, 500);
  background(255, 255,255); 
  _capa = new Capacitor(373,200,60,10,20);
  _topWire = new Wire(100, 125, 400, 125, null, true, _rightWire);
  _leftWire = new Wire(100, 325, 100, 125, null, true, _topWire);
  _botWire = new Wire(400, 325, 100,325, null, true, _leftWire);
  _rightWire = new Wire(400, 125, 400, 325, _capa, true, _botWire);
  _topWire.setNext(_rightWire);
}


void draw() { 
  background(255,255,255);
  _topWire.drawWire();
  _rightWire.drawWire();
  _botWire.drawWire();
  _leftWire.drawWire();
  _topWire.drawCharges();
  _rightWire.drawCharges();
  _botWire.drawCharges();
  _leftWire.drawCharges();
  _rightWire.drawCapacitor();
  int m = millis();
  //fill(m % 255);
  //rect(25, 25, 50, 50);
}
