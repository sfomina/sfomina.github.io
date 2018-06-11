import java.util.Arrays;

public class Capacitor {
  private double _capacitance; 
  private float _area;
  private float _width;
  private float _height;
  private float _distance;
  private float _xcor;
  private float _ycor;
  
  public Capacitor(float x, float y, float cwidth, float cheight, float distance){
    _xcor = x;
    _ycor = y;
    _width = cwidth;
    _height = cheight;
    _area = cwidth * cheight;
    _distance = distance;
    double permitConst = 8.85 * Math.pow(10,-12);
    double constant = 1/(4 * Math.PI * permitConst); 
    _capacitance = (constant * permitConst * _area)/(_distance);
  }
  
  public float getX(){
    return _xcor;
  }
  
  public float getY(){
    return _ycor;
  }

  public void draw(){
    float radius = _distance/2; 
    noStroke();
    fill(104,162,255);
    rect(_xcor, _ycor + radius, _width, _height);
    fill(104,162,255);
    rect(_xcor, _ycor - radius, _width, _height);
    stroke(0);
    //println (_ycor + radius);
    //println (_ycor - radius);
    //fill(255, 255, 0);
    //ellipse(_xcor, _ycor, 2*radius, 2*radius);
    //stroke(0);
  }
  public String toString(){
   float[] s = {_xcor,_ycor};
   return (Arrays.toString(s));
  }
}