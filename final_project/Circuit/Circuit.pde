Wire _topWire;
Wire _leftWire;
Wire _botWire;
Wire _rightWire;
//Charge _Q; 

void setup() {
  size(500, 500);
  background(255, 255,255); 
  _topWire = new Wire(100, 125, 400, 125, true, _rightWire);
  _leftWire = new Wire(100, 325, 100, 125, true, _topWire);
  _botWire = new Wire(400, 325, 100,325, true, _leftWire);
  _rightWire = new Wire(400, 125, 400, 325, true, _botWire);
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
}