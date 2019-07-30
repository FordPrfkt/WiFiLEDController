#ifndef LEDHANDLER_H
#define LEDHANDLER_H

#define PIN_RED 12
#define PIN_GREEN 15
#define PIN_BLUE 13

typedef unsigned char byte;

class LEDHandler
{
  public:
    struct RGB
    {
      byte r;
      byte g;
      byte b;
    };

    LEDHandler(Scheduler &scheduler);
    void Init();
    void SetEnabled(bool enabled);
    void SetColor(RGB& color);
    void SetColor(RGB& color, byte brightness);
    void SetColor(RGB& color, byte brightness, byte fadeSpeed);
    void SetBrightness(byte brightness);
    void SetFadeSpeed(unsigned short fadespeed); 
    byte GetBrightness();
    LEDHandler::RGB& GetColor();
    byte GetFadeSpeed();
    
  private:
    Scheduler &taskScheduler;
    Task taskFade;
    RGB rgbCurrent;
    RGB rgbTarget;
    byte brtCurrent;
    byte brtTarget;
    unsigned short fadeSpeed;
    bool enabled;
    void setOutput(RGB& output, byte brightness);
    void taskFadeCbk();
    byte fade(byte current, byte target);
};

#endif
