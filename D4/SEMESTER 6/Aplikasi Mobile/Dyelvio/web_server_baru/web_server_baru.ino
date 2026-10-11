#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <ESP8266HTTPUpdateServer.h>
#ifndef STASSID
#define STASSID "asle"  //Update the wifi name here
#define STAPSK  "danikamaura"  //Update the wifi password here
#define SIGNAL_PIN A0
#endif
const char* host = "esp8266-webupdate";
const char* ssid = STASSID;
const char* password = STAPSK;
ESP8266WebServer httpServer(80);
ESP8266HTTPUpdateServer httpUpdater;
int value = 0;
void setup(void) {
  Serial.begin(115200);
  Serial.println();
  Serial.println("Booting Sketch...");
  WiFi.mode(WIFI_AP_STA);
  WiFi.begin(ssid, password);
  while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    WiFi.begin(ssid, password);
    Serial.println("WiFi failed, retrying.");
  }
  MDNS.begin(host);
  httpUpdater.setup(&httpServer);
  httpServer.begin();
  MDNS.addService("http", "tcp", 80);
  Serial.printf("HTTPUpdateServer ready! Open http://%s.local/update in your browser\n", host);
}
void loop(void) {
  httpServer.handleClient();
  MDNS.update();
  value = analogRead(SIGNAL_PIN); // read the analog value from sensor
  Serial.print("Sensor value: ");
  Serial.println(value);
  delay(3000);
}
