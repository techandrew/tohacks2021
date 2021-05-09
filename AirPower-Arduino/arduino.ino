#include <Ethernet2.h>
#include <EthernetClient.h>
#include <EthernetUdp2.h>
#include <util.h>
#include "ACS712.h"
#include <LiquidCrystal.h>
int sensorValue = 0;

IPAddress _ip(192, 168, 1, 12); // Client (Arduino) IP address
byte _mac[] = {0x90, 0xA2, 0xDA, 0x11, 0x3C, 0x69}; // Arduino mac address
char _server[] = "172.67.167.25"; // Server IP address
int _port = 9200; // Server port number
EthernetClient _client;

char watt[5];
ACS712 sensor(ACS712_30A, A0);
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  Serial.begin(115200);
  delay(1000);                
  Ethernet.begin(_mac, _ip);
  Serial.print("Local IP: ");
  Serial.println(Ethernet.localIP());

  if (_client.connect(_server, _port)) {
    Serial.println("SUCCESS: Connected to the server!");
  } else {
    Serial.println("ERROR: Connection failed to the server!");
    return;
  }
  delay(1000);
  sensor.calibrate();
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
}

void loop() {

  float V= 220;
  float I = sensor.getCurrentAC();
  float P = V * I;
  last_time = current_time;
  current_time = millis();    
  Wh = Wh+  P *(( current_time -last_time) /3600000.0) ; 
  dtostrf(Wh, 4, 2, watt);  //dtostrf(floatvar, StringLengthIncDecimalPoint, numVarsAfterDecimal, charbuf);
  Serial.write(watt);
  sensorValue = watt;
  lcd.setCursor(0, 0);
  // print out the value at LCD Display:
  lcd.print(sensorValue);
  // print out the value at Serial Monitor:

 String data = "{\"device_id\": 300824787},{\"current_read\":" + String(watt) + "}";

  String url = "/airwatt"; // API url hosted on the server

  // Finally, make an API call: POST request
  _client.print("POST " + url + " HTTP/1.1 \r\n" +
    "Content-Type: application/json \r\n" +
    "Content-Length: " + data.length() + " \r\n" +
    "\r\n" + data);

  delay(500); // Give the network some time

  // Read all the lines of the reply from server and 
  // print them to Serial to validate your API call
  while (_client.available()) {
    String reply = _client.readStringUntil('\r');
    Serial.print(reply);
  }



  
  lcd.clear();  
  delay(30000);
}