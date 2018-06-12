public class Resistor {
    private double _resistance; 
    private float _botxcor;
    private float _botycor;
    private float _xcor;
    private float _ycor;
  
    public Resistor(float x, float y, double resistance, float botxcor, float botycor){
      _xcor = x;
      _ycor = y;
      _botxcor = botxcor;
      _botycor = botycor;
      _resistance = resistance;
    }
  
    public float getX(){
      return _xcor;
    }
  
    public float getY(){
      return _ycor;
    }

    public void draw(){
    noStroke();
    fill(255,255,255);
    rect(_xcor, _ycor - 10, 4 * (_botxcor - _xcor), (_botycor - _ycor)); 
    float xPosition= _xcor;
    float yPosition= _ycor; // Set the "old" Y position as it's the base of your first calculation in the for loop
    stroke(8);
    fill(0,0,0);
    float newXPosition=0;
    float newYPosition=0; // Don't set the new Y position, it'll get overridden in the loop's first calculation anyway
    
    float theDistance= _botxcor - _xcor;
    float theRange= 2 * (_botycor - _ycor); // The range has to be doubled for our calculation
    for(int i=0; i<4; i++){
      //Defining the new positions
      newXPosition = xPosition + theDistance;
      newYPosition = yPosition + theRange / 2 - (i % 2) * theRange;
      // The above line takes our current Y position and adds half of the range to it, then we subtract the full range every odd iteration.
      // 1. loop: 100 + 200 - 0 = 300
      // 2. loop: 300 + 200 - 400 = 100
      // 3. loop: 100 + 200 - 0 = 300
      // ...
    
      //Draw the xig-zag
      line(xPosition,yPosition,newXPosition,newYPosition);
      xPosition = newXPosition;
      yPosition = newYPosition; // Don't forget to save the Y position      
      //println("line("+
      //int(xPosition)+","+
      //int(yPosition)+","+
      //int(newXPosition)+","+
      //int(newYPosition)+")");
}
    }
    public String toString(){
     float[] s = {_xcor,_ycor};
     return (Arrays.toString(s));
    }
}