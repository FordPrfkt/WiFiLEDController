#include <Arduino.h>
#include <TaskSchedulerDeclarations.h>
#include "LEDHandler.h"

LEDHandler::LEDHandler(Scheduler &scheduler) : taskScheduler(scheduler), taskFade(100, TASK_FOREVER, (void(*)())&LEDHandler::taskFadeCbk)
{
    this->rgbCurrent.r = this->rgbCurrent.g = this->rgbCurrent.b = 0;
    this->rgbTarget.r = this->rgbTarget.g = this->rgbTarget.b = 0;
    this->brtCurrent = 0;
    this->brtTarget = 0;
    this->fadeSpeed = 100;
    this->enabled = false;
}

void LEDHandler::Init()
{
    taskScheduler.addTask(taskFade);
    analogWriteRange(255);
    analogWrite(PIN_RED, 0);
    analogWrite(PIN_GREEN, 0);
    analogWrite(PIN_BLUE, 0); 
}

byte LEDHandler::fade(byte current, byte target)
{
  byte result;

  if (abs((int)target - (int)current) > 1)
  {
    if (target > current)
    {
      result = current + 1;        
    }
    else
    {
      result = current - 1;
    }
  }
  else
  {
    result = target;  
  }  
  
  return result;
}

void LEDHandler::taskFadeCbk()
{
  bool changed = false;
    
  if (this->brtCurrent != this->brtTarget)
  {
    this->brtCurrent = fade(this->brtCurrent, this->brtTarget);
    changed = true;
  }

  if (this->rgbCurrent.r != this->rgbTarget.r)
  {
    this->rgbCurrent.r = fade(this->rgbCurrent.r, this->rgbTarget.r);
    changed = true;
  }

  if (this->rgbCurrent.g != this->rgbTarget.g)
  {
    this->rgbCurrent.g = fade(this->rgbCurrent.g, this->rgbTarget.g);
    changed = true;
  }

  if (this->rgbCurrent.b != this->rgbTarget.b)
  {
    this->rgbCurrent.b = fade(this->rgbCurrent.b, this->rgbTarget.b);
    changed = true;
  }

  if (changed == true)
  {
    setOutput(this->rgbCurrent, this->brtCurrent);
    changed == false;
  }
  else
  {
    taskFade.disable();
  }
}

void LEDHandler::SetEnabled(bool enabled)
{
  if (enabled == false)
  {
    taskFade.disable();
    RGB rgb = {0,0,0};
    setOutput(rgb, 0);
  }
  else
  {
    setOutput(rgbCurrent, brtCurrent);
  }
}

void LEDHandler::SetColor(RGB& color)
{
    this->rgbTarget.r = color.r;
    this->rgbTarget.g = color.g;
    this->rgbTarget.b = color.b;
    taskFade.enableIfNot();
}

void LEDHandler::SetColor(RGB& color, byte brightness)
{
    this->brtTarget = brightness;
    this->rgbTarget.r = color.r;
    this->rgbTarget.g = color.g;
    this->rgbTarget.b = color.b;
    taskFade.enableIfNot();
}

void LEDHandler::SetColor(RGB& color, byte brightness, byte fadeSpeed)
{
    this->fadeSpeed = fadeSpeed;
    this->brtTarget = brightness;
    this->rgbTarget.r = color.r;
    this->rgbTarget.g = color.g;
    this->rgbTarget.b = color.b;
    taskFade.enableIfNot();
}

void LEDHandler::SetBrightness(byte brightness)
{
  this->brtTarget = brightness;
  taskFade.enableIfNot();
}

void LEDHandler::SetFadeSpeed(unsigned short fadespeed)
{
  this->fadeSpeed = fadeSpeed;
  taskFade.setInterval(fadeSpeed);
}

byte LEDHandler::GetBrightness()
{
  return this->brtTarget;  
}

LEDHandler::RGB& LEDHandler::GetColor()
{
  return this->rgbTarget;
}

byte LEDHandler::GetFadeSpeed()
{
  return this->fadeSpeed;
}

void LEDHandler::setOutput(RGB& output, byte brightness)
{
    byte mappedRed = map(output.r, 0, 100, 0, brightness);
    byte mappedGreen = map(output.g, 0, 100, 0, brightness);
    byte mappedBlue = map(output.b, 0, 100, 0, brightness);
    
    analogWrite(PIN_RED, mappedRed);
    analogWrite(PIN_GREEN, mappedGreen);
    analogWrite(PIN_BLUE, mappedBlue);  
}
