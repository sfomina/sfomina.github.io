import java.util.Arrays;

public static double MAXI = 0.05; 
public static double TIMECONSTANT = 0.02;


public class Charge {
  
  private float time = 0; 
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
    
    if (_dx == 0 && _dy > 0 ){
      _dy = 100 *calcCurrent();
      //println(_dy);
      //exit();
      
    }
    else if (_dx == 0 && _dy < 0 ){
      _dy = -100 * calcCurrent();
    }
    else if (_dy == 0 && _dx > 0){
      _dx = 100 * calcCurrent();; 
    }
    else {
      _dx = -100 * calcCurrent();
    }
    
    time += 0.001; 
  }
  
  public float calcCurrent(){
    
    //println( MAXI*exp( -1 * time/TIMECONSTANT));
    return (float)(MAXI * Math.pow(Math.E, -1 * time/TIMECONSTANT));
    //return (float)(MAXI*exp((float)(-1 * time/TIMECONSTANT)));
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