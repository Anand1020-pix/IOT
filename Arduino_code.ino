#include <OneWire.h>
#include <DallasTemperature.h>

// Constants
const int TDS_PIN = A0;
const int FLOW_PIN = 2;
const int FLOW_PIN1 = 8;
const int FLOW_PIN2 = 10;

// Objects
OneWire oneWire(3);
DallasTemperature sensors(&oneWire);

// Variables
float temperature;
int tdsValue;
int flowValue, flowValue1, flowValue2;

void setup() {
  // Start serial communication
  Serial.begin(9600);

  // Initialize sensors
  sensors.begin();
}

void loop() {
  // Read temperature
  sensors.requestTemperatures();
  temperature = sensors.getTempCByIndex(0);

  // Read TDS value
  tdsValue = analogRead(TDS_PIN);

  // Read flow value
  flowValue = pulseIn(FLOW_PIN, HIGH);
  flowValue1 = pulseIn(FLOW_PIN1, HIGH);
  flowValue2 = pulseIn(FLOW_PIN2, HIGH);

  // Create a comma-separated string of sensor readings
  String sensorData = String(temperature) + "," + String(tdsValue) + "," + String(flowValue) + "," +
                      String(flowValue1) + "," + String(flowValue2);

  // Send sensor data over serial
  Serial.println(sensorData);

  // Delay before the next reading
  delay(1000);
}
