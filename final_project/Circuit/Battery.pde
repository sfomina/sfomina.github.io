public class Battery {
  private float _voltage; 
  private float _xcor;
  private float _botycor;
  private float _topycor;
  
  
  public Battery(float voltage, float xcor, float botycor, float topycor){
    _voltage = voltage; 
    _xcor = xcor;
    _topycor = topycor;
    _botycor = botycor;
  }
  
  public void drawBattery() {
    strokeWeight(8);
    line(_xcor - 30, _topycor, _xcor + 30 ,_topycor);
    line(_xcor - 20, _botycor, _xcor + 20 ,_botycor);
  }
  
}