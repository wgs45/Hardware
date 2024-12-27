#include "ld3320.h"
#include <Servo.h>

VoiceRecognition Voice;
Servo my_servo;

void setup() 
{
    my_servo.attach(8);                                                                         
    Serial.begin(9600);          
    Serial.println("Program initialized!");  
    Voice.init();               
    Voice.addCommand("kai deng", 0);
    Voice.addCommand("guan deng", 1);                         
    Voice.start();                
    Serial.println("Start a keyword: ");
}
                 
void loop() {                   
  int command = Voice.read();  
  Serial.print("Command: ");   
  Serial.println(command);

  switch (command) {
    case 0:
        Serial.println("Command recognized!");
        Serial.println("Open");
        my_servo.write(90);
        break;
    case 1:
        Serial.println("Command recognized!");
        Serial.println("Close");
        my_servo.write(0);
        break;
    default:
        Serial.println("No command recognized!");
        break;
  }
  delay(1000);
}
