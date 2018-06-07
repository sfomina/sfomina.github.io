import java.util.Arrays;

public class Charge {
  
  private float _dx;
  private float _dy; 
  private float _xcor;
  private float _ycor;
  
  public Charge(float x, float y, float dx, float dy){
    _xcor = x;
    _ycor = y;
    _dx = dx;
    _dy = dy;
  }
  
  public float getX(){
    return _xcor;
  }
  
  public float getY(){
    return _ycor;
  }
  
  public void setSlope(float newDx, float newDy){
    _dx = newDx;
    _dy = newDy;
  }
  
  public void move(){
    _xcor += _dx; 
    _ycor += _dy;
  }
  
  public void draw(){
    float radius = 4; 
    noStroke();
    fill(255, 255, 0);
    ellipse(_xcor, _ycor, 2*radius, 2*radius);
    stroke(0);
  }
  
  public String toString(){
   float[] s = {_xcor,_ycor};
   return (Arrays.toString(s));
  }
  
  
}