
ConfigHandler::ConfigHandler(const char *thingName, const char *wifiInitialApPassword, const char *Version, DNSServer &dnsServer,
        WebServer &webserver) :
        IotWebConf(thingName, &dnsServer, &webserver, wifiInitialApPassword, Version),
        server(webserver),
        mqttBrokerParam(IotWebConfParameter("MQTT Broker", "mqttBrokerParam", this->mqttBroker, STRING_LEN, "text", "MQTT Broker", "192.168.1.1")),
		    mqttBrokerPortParam(IotWebConfParameter("MQTT Port", "mqttBrokerPortParam", this->mqttBrokerPort, NUMBER_LEN, "number", "MQTT Port", "1883")),
		    mqttTopicParam(IotWebConfParameter("MQTT Topic", "mqttTopicParam", this->mqttTopic, STRING_LEN, "text", "MQTT Topic", "/home/rgbstrip")),
        mqttEnabledParam(IotWebConfParameter("Use MQTT", "mqttEnabledParam", this->mqttEnabled, CHCKBOX_LEN, "checkbox", "Use MQTT", "1"))
{
    snprintf(mqttBroker, STRING_LEN, "%s", "192.168.1.16");
    snprintf(mqttBrokerPort, NUMBER_LEN, "%s", "1883");
    snprintf(mqttTopic, STRING_LEN, "%s", "/home/rgbstrip/");
    snprintf(mqttEnabled, CHCKBOX_LEN, "%s", "1");
    
    addParameter(&mqttEnabledParam);
    addParameter(&mqttBrokerParam);
    addParameter(&mqttBrokerPortParam);
    addParameter(&mqttTopicParam);
    setFormValidator(std::bind(&ConfigHandler::formValidator, this));
}

bool ConfigHandler::GetMQTTEnabled()
{
    if (strcmp(mqttEnabled, "1") == 0)
    {
        return true;
    }
    else
    {
        return false;
    } 
}

IPAddress ConfigHandler::GetMQTTBroker()
{
  IPAddress ipAddress;
  ipAddress.fromString(String(mqttBroker));

  return ipAddress;
}

int ConfigHandler::GetMQTTBrokerPort()
{
    return atoi(mqttBrokerPort);
}

String ConfigHandler::GetMQTTTopic()
{
    return String(mqttTopic);
}

boolean ConfigHandler::formValidator(void)
{
    Serial.println("Validating form.");
    char charBuf[5];

    boolean valid = true;
    int brokerPort = 0;

    server.arg(mqttBrokerPortParam.getId()).toCharArray(charBuf, 5);
    brokerPort = atoi(charBuf);
    if ((brokerPort > 65535) || (brokerPort < 1))
    {
        mqttBrokerPortParam.errorMessage = "Please provide a value between 1 and 65535";
        valid = false;
    }

    int l = server.arg(mqttBrokerParam.getId()).length();
    if (l < 7)
    {
        mqttBrokerParam.errorMessage = "Please provide at least 7 characters";
        valid = false;
    }

    l = server.arg(mqttTopicParam.getId()).length();
    if (l < 3)
    {
        mqttTopicParam.errorMessage = "Please provide at least 3 characters";
        valid = false;
    }

    return valid;
}
