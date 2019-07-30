#ifndef CONFIGDATA_H
#define CONFIGDATA_H

#define STRING_LEN 40
#define NUMBER_LEN 32
#define CHCKBOX_LEN 4

// -- Configuration specific key. The value should be modified if config structure was changed.
#define CONFIG_VERSION "LEDControlV1"


#include <IotWebConf.h>

class ConfigHandler : IotWebConf
{
  public:
    ConfigHandler(const char *thingName, const char *wifiInitialApPassword, const char *Version, DNSServer &dnsServer, WebServer &server);
    using IotWebConf::init;
    using IotWebConf::doLoop;
    using IotWebConf::getState;
    using IotWebConf::setWifiConnectionCallback;
    using IotWebConf::setConfigSavedCallback;
    using IotWebConf::handleCaptivePortal;
    using IotWebConf::handleConfig;
    using IotWebConf::handleNotFound;
    using IotWebConf::setStatusPin;
    using IotWebConf::setConfigPin;
    using IotWebConf::setupUpdateServer;
    bool GetMQTTEnabled();
    IPAddress GetMQTTBroker();
    int GetMQTTBrokerPort();
    String GetMQTTTopic();
    
  private:
    WebServer &server;
    char mqttBroker[STRING_LEN];
    char mqttBrokerPort[NUMBER_LEN];
    char mqttTopic[STRING_LEN];
    char mqttEnabled[CHCKBOX_LEN];
    IotWebConfParameter mqttBrokerParam;
    IotWebConfParameter mqttBrokerPortParam;
    IotWebConfParameter mqttTopicParam;
    IotWebConfParameter mqttEnabledParam;
    boolean formValidator(void);
};

#endif
