import java.util.ArrayList; 

public class Wire {
  private float _startX;
  private float _startY;
  private float _endX;
  private float _endY;
  private boolean _hasCurrent; 
  private Wire _next;
  private float _Qdensity;
  private ArrayList<Charge> _charges;
  //private Battery _bNext;
  private Capacitor _cNext;
  private Resistor _rNext;
  
  //Constructors 
  public Wire(float startX, float startY, float endX, float endY, boolean hasCurrent, Wire next){
    _startX = startX;
    _startY = startY;
    _endX = endX;
    _endY = endY;
    _hasCurrent = hasCurrent;
    _next = next;
    _Qdensity = 0.02;
    //_bNext = bnext;
    _cNext = null;
    _rNext = null;
    _charges = new ArrayList<Charge>(); 
    int numCharges = (int) Math.round(lineLen() * _Qdensity);
    int spaces = (int)(lineLen()/numCharges); 
    for (int x = 0; x < numCharges; x += 1){
      int dx;
      int dy;
      if (_startX == _endX){
        dx = 0;
        dy = 1;
        if (_startY > _endY){
          _charges.add(new Charge(_startX,_startY - spaces*x, dx, -1*dy)); 
        }
        else {
          _charges.add(new Charge(_startX,_startY + spaces*x, dx, dy)); 
        }

      }
      else {
        dx = 1;
        dy = 0;
        if (_startX > _endX){
          _charges.add(new Charge(_startX - spaces*x,_startY, -1* dx, dy)); 
        }
        else{
          _charges.add(new Charge(_startX + spaces*x,_startY, dx, dy)); 
        }
        
      } 
    }
  }
  
  public void drawWire(){
    strokeWeight(8);
    line(_startX, _startY, _endX, _endY); 
  }
  
  public void drawCharges(){
    for (int x = 0; x < _charges.size(); x+= 1){
      Charge q = _charges.get(x);
      q.draw();
      if (_hasCurrent){
        q.move();
        checkNext();
      }
    }
  }
  
  public void checkNext(){
   //println(_charges); 
   for (int x = 0; x < _charges.size(); x+= 1){
     if (_charges.get(x).getX() == _endX && _charges.get(x).getY() == _endY){
       //println(_next);
       _charges.remove(x);
       //delay(20);
       //println ("WOW");
       _next.addCharge(_endX, _endY);
       x-=1;
     }
   }
  }

  public double lineLen(){
    //println("length: " + 
    return Math.sqrt(Math.pow(_endX-_startX,2) + Math.pow(_endY-_startY,2));
  }
  
  public float calcVoltage(){
    return 0; 
  }
  
  public void setNext(Wire newNext){
    _next = newNext; 
  }
  
  //Accessors
  public boolean gethasCurrent(){
    return _hasCurrent; 
  }
  
  public ArrayList<Charge> getCharges(){
    return _charges; 
  }
  
  
 
  public void addCharge(float x,float y){
    int dx;
    int dy;
    if (_startX == _endX){
      dx = 0;
      dy = 1;
      if (_startY > _endY){
        _charges.add(new Charge(x,y, dx, -1*dy)); 
      }
      else {
        _charges.add(new Charge(x,y, dx, dy)); 
      }

    }
    else {
      dx = 1;
      dy = 0;
      if (_startX > _endX){
        _charges.add(new Charge(x,y, -1* dx, dy)); 
      }
      else{
        _charges.add(new Charge(x,y, dx, dy)); 
      }
      
    }

  }

  
  
  
  
}