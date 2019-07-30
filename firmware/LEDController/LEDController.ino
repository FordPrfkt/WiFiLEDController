#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266HTTPUpdateServer.h>
#include <DNSServer.h>
#include <ArduinoJson.h>
#include <PubSubClient.h>
#include <PubSubClientTools.h>
#include <TaskScheduler.h>
#include <FS.h>
#include <Arduino_DebugUtils.h>
#include "ConfigHandler.h"
#include "LEDHandler.h"

// -- Status indicator pin.
//      First it will light up (kept LOW), on Wifi connection it will blink,
//      when connected to the Wifi it will turn off (kept HIGH).
#define STATUS_PIN LED_BUILTIN

#define CONFIG_PIN 0

// -- Initial name of the Thing. Used e.g. as SSID of the own Access Point.
#define THING_NAME "LED Strip Controller"

// -- Initial password to connect to the Thing, when it creates an own Access Point.
#define INITIAL_PASSWORD "RGBControl"

#define SITE_DIR "/site/"

#define PIN_LED_ACTY 4
#define PIN_LED_MQTT 5

// -- Callback method declarations.
void wifiConnected();
void handleRoot();
void handleJson();
void getJSONStatus();
void fileindex();
void iro();
void jquery();
void popper();
void bootstrapmin();
void bootstrapmincss();
void icon();
void updateParameters(void);
void taskConnectCbk();
void taskStatusCbk();
void json_subscriber(String topic, String message);
void rgb_subscriber(String topic, String message);
void brt_subscriber(String topic, String message);
void power_subscriber(String topic, String message);

int processJSON(String json);

ESP8266WebServer server(80);
ESP8266HTTPUpdateServer httpUpdater;
WiFiUDP ntpUDP;
WiFiClient wifiClient;
DNSServer dnsServer;
Scheduler runner;
Task taskConnect(1000, TASK_FOREVER, &taskConnectCbk);
Task taskStatus(500, TASK_FOREVER, &taskStatusCbk);
PubSubClient client(wifiClient);
PubSubClientTools mqtt(client);
ConfigHandler configHandler(THING_NAME, INITIAL_PASSWORD, CONFIG_VERSION, dnsServer, server);
LEDHandler ledHandler(runner);

void setup()
{
  wdt_disable();
  wdt_enable(5000);

  randomSeed(micros());

  Serial.begin(115200);
  Debug.timestampOn();
  SPIFFS.begin();

  //Throw out some version and status information
  Serial.println();

  Debug.print(DBG_INFO, F("Start. CPU Info:\n"));
  Debug.print(DBG_INFO, "Chip-ID: %d\n", ESP.getChipId());
  Debug.print(DBG_INFO, "CPU Freq.: %d MHz\n", ESP.getCpuFreqMHz());
  Debug.print(DBG_INFO, "Core Version: %s\n", ESP.getCoreVersion().c_str());
  Debug.print(DBG_INFO, "SDK Version: %s\n", ESP.getSdkVersion());
  Debug.print(DBG_INFO, "------------------\n");
  Debug.print(DBG_INFO, "Sketch Size: %d Bytes\n", ESP.getSketchSize());
  Debug.print(DBG_INFO, "Remaining Sketch Space: %d Bytes\n", ESP.getFreeSketchSpace());
  Debug.print(DBG_INFO, "------------------\n");
  Debug.print(DBG_INFO, "Reset Reason: %s\n", ESP.getResetReason().c_str());
  Debug.print(DBG_INFO, "------------------\n");

  configHandler.setStatusPin(STATUS_PIN);
  configHandler.setConfigPin(CONFIG_PIN);
  configHandler.setWifiConnectionCallback(wifiConnected);
  configHandler.setConfigSavedCallback(updateParameters);
  configHandler.setupUpdateServer(&httpUpdater);
  configHandler.init();
  updateParameters();

  // Set up required URL handlers on the web server.
  server.on("/jsonctrl", handleJson);
  server.on("/jsonstatus", getJSONStatus);
  server.on("/config", [&]
  { configHandler.handleConfig(); });
  server.onNotFound([&]()
  {
    if (handleFileRequest() == false)
    {
      configHandler.handleNotFound();      
    }
  });

  ledHandler.Init();

  runner.init();
  runner.addTask(taskConnect);
  runner.addTask(taskStatus);

  Debug.print(DBG_INFO, "RGB Strip Controller started\n");
  Debug.print(DBG_INFO, "------------------\n\n");
}

void loop()
{
  // -- doLoop should be called as frequently as possible.
  configHandler.doLoop();
  client.loop();
  runner.execute();
}

void handleJson()
{
  if (server.hasArg("plain") == false)
  {
    PRINT(DBG_WARNING, "Json request without body");
    server.send(200, "text/plain", "Body not received");
    return;
  }

  if (processJSON(server.arg("plain")) == 0)
  {
    server.send(200, "application/json", server.arg("plain"));
    PRINT(DBG_DEBUG, "Json request served");
  }
  else
  {
    PRINT(DBG_WARNING, "Json request with invalid body");
    server.send(200, "text/plain", "Body invalid");
  }
}

void getJSONStatus()
{
  StaticJsonDocument <300> doc;

  doc["wifiName"] = "HalloWelt";
  doc["deviceName"] = "TestDevice";
  doc["ipAddress"] = "192.168.1.1";
  doc["enabled"] = true;
  doc["brightness"] = 100;
  JsonObject rgb = doc.createNestedObject("color");
  rgb["r"] = 20;
  rgb["g"] = 20;
  rgb["b"] = 20;
  doc["mqttBroker"] = "TestBroker";
  doc["uptime"] = "10:10:10";
  doc["temperature"] = 30;
  doc["voltage"] = 5.0;

  String output ="";
  serializeJson(doc, output);
  Serial.println(output);
  server.send(200, "application/json", output);
}

bool handleFileRead(String path)
{
  if (configHandler.handleCaptivePortal())
  {
    return true;
  }

  path += SITE_DIR;
  if (path.endsWith("/"))
  {
    path += "index.htm";
  }
      
  if (SPIFFS.exists(path+".gz") || SPIFFS.exists(path))
  {
    if (SPIFFS.exists(path+".gz"))
    {
      path += ".gz";
    }
    
    String contentType = getContentType(path);
    File file = SPIFFS.open(path, "r");
    server.streamFile(file, contentType);
    file.close();
    return true;
  }
  return false;
}

String getContentType(String filename) {
  
  if (server.hasArg("download")) {
    return "application/octet-stream";
  } else if (filename.endsWith(".htm")) {
    return "text/html";
  } else if (filename.endsWith(".html")) {
    return "text/html";
  } else if (filename.endsWith(".css")) {
    return "text/css";
  } else if (filename.endsWith(".js")) {
    return "application/javascript";
  } else if (filename.endsWith(".png")) {
    return "image/png";
  } else if (filename.endsWith(".gif")) {
    return "image/gif";
  } else if (filename.endsWith(".jpg")) {
    return "image/jpeg";
  } else if (filename.endsWith(".ico")) {
    return "image/x-icon";
  } else if (filename.endsWith(".xml")) {
    return "text/xml";
  } else if (filename.endsWith(".pdf")) {
    return "application/x-pdf";
  } else if (filename.endsWith(".zip")) {
    return "application/x-zip";
  } else if (filename.endsWith(".gz")) {
    return "application/x-gzip";
  } else if (filename.endsWith(".svg")) {
    return "image/svg+xml";
  }
  return "text/plain";
}

void wifiConnected()
{
  if (IOTWEBCONF_STATE_ONLINE == configHandler.getState())
  {
    PRINT(DBG_INFO, "Connected to WiFi");
    if (configHandler.GetMQTTEnabled() == true)
    {
      taskConnect.enable();
    }
  }
  else
  {
    PRINT(DBG_INFO, "Disconnected from WiFi");
    if (client.connected() == true)
    {
      client.disconnect();
    }
  }
}

void updateParameters(void)
{
  PRINT(DBG_DEBUG, "Updating Parameters");
  if (client.connected() == true)
  {
    client.disconnect();
  }

  if (configHandler.GetMQTTEnabled() == true)
  {
    client.setServer(configHandler.GetMQTTBroker(), configHandler.GetMQTTBrokerPort());

    if (IOTWEBCONF_STATE_ONLINE == configHandler.getState())
    {
      taskConnect.enable();
    }
  }
}

void taskStatusCbk()
{
  String topic = configHandler.GetMQTTTopic();
  //  mqtt.publish(topic + "/status/rgb", rgb_subscriber);
  //  mqtt.publish(topic + "/status/brightness", brt_subscriber);
  //  mqtt.publish(topic + "/status/power", power_subscriber);
}

void taskConnectCbk()
{
  // Connect to MQTT

  PRINT(DBG_DEBUG, "Connecting to MQTT broker: " + configHandler.GetMQTTBroker().toString() + " ... ");

  if (mqtt.connect(THING_NAME + String(random(0xffff), HEX)))
  {
    String topic = configHandler.GetMQTTTopic();

    mqtt.subscribe(topic + "/json", json_subscriber);
    mqtt.subscribe(topic + "/rgb", rgb_subscriber);
    mqtt.subscribe(topic + "/brightness", brt_subscriber);
    mqtt.subscribe(topic + "/power", power_subscriber);
    taskConnect.disable();
    Debug.print(DBG_DEBUG, "MQTT broker connected");
  }
  else
  {
    PRINT(DBG_WARNING, "Connecting to MQTT broker failed. State=" + client.state());
  }
}

void json_subscriber(String topic, String message)
{
  PRINT(DBG_INFO, "Message arrived in function json [" + topic + "] " + message);
}
void rgb_subscriber(String topic, String message)
{
  PRINT(DBG_INFO, "Message arrived in function rgb [" + topic + "] " + message);
}
void brt_subscriber(String topic, String message)
{
  PRINT(DBG_INFO, "Message arrived in function brt [" + topic + "] " + message);
}
void power_subscriber(String topic, String message)
{
  PRINT(DBG_INFO, "Message arrived in function power [" + topic + "] " + message);
}

int processJSON(String json)
{
  const size_t bufferSize = JSON_OBJECT_SIZE(3) + JSON_OBJECT_SIZE(4) + 70;

  DynamicJsonDocument root(bufferSize);
  DeserializationError error = deserializeJson(root, json);
  PRINT(DBG_DEBUG, "Deserializing JSON request");
  if (error)
  {
    Debug.print(DBG_WARNING, "JSON error: %s", error.c_str());
    return 1;
  }
  else
  {
    PRINT(DBG_DEBUG, "Successfully deserialized JSON request");
  }

  if (root.containsKey("enabled"))
  {
    ledHandler.SetEnabled(root["enabled"]);  
  }

  LEDHandler::RGB rgb = ledHandler.GetColor();
  byte brightness = ledHandler.GetBrightness();
  
  if (root.containsKey("color"))
  {
    JsonObject color = root["color"];
    rgb = {color["r"], color["g"], color["b"]};
  }

  if (root.containsKey("brightness"))
  {
    brightness = root["brightness"];
  }
  
  ledHandler.SetColor(rgb, brightness);  

  return 0;
}
