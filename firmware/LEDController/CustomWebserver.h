#ifndef CUSTWEBSERVER_H
#define CUSTWEBSERVER_H

#include <ESP8266WebServer.h>

class CustomWebServer : ESP8266WebServer
{
  CustomWebServer(const char *directory,int port);
  
}

#endif CUSTWEBSERVER_H
