import java.util.Calendar;
import java.util.Date;
//9:00am - 3:40pm
//15:40 - 9 = 6:40

int totalTime = 400; //6*60+40(in mins)

int offset = 500;

//subject/break

int xPad = 200;


float scaleX = width/600;

Time[] times = {
  new Time(9, 10), 
  new Time(10, 10), 
  new Time(10, 15), 
  new Time(11, 15), 
  new Time(11, 40), 
  new Time(12, 40), 
  new Time(13, 45), 
  new Time(14, 45), 
  new Time(14, 50), 
  new Time(15, 50)
};

class Time {
  public int hours, mins;
  public Time(int hours, int mins) {
    this.mins = mins;
    this.hours = hours;
  }  
  int getTotalMins() {
    return (60*hours+mins)-offset;//shift to left to fit on screen
  }
}

void setup() {
// size(1000, 500);
 //size(displayWidth, displayHeight);
size(window.innerWidth, window.innerHeight); 
}

void draw() {
  println(width);
  
 // Calendar rightNow = Calendar.getInstance();
 // Time now = new Time(rightNow.get(Calendar.HOUR_OF_DAY), //rightNow.get(Calendar.MINUTE)); 
  //int nowMins = now.getTotalMins();
 // println(hour());
  int nowMins = (hour()*60)+minute()-offset;
  stroke(0);
  for (int i = 0; i < times.length-1; i ++ ) {
    int mins = times[i].getTotalMins();
    int mins2 = times[i+1].getTotalMins()-mins;

    if (i % 2 == 0 ) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    rect(mins*scaleX, 0, mins2*scaleX, height);
    text(times[i].hours+":"+times[i].mins,mins*scaleX,50);
  }
  fill(0, 0, 255);
  stroke(0, 0, 255);
  rect(nowMins*scaleX, 0, 1*scaleX, height);
 // println("as");
  //try {
  //  Thread.sleep(1000);                 //1000 milliseconds is one second.
  //} 
  //catch(InterruptedException ex) {
  //  Thread.currentThread().interrupt();
  //}
}
