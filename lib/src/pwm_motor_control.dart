// import 'dart:io';

import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class PwmMotorControl {
  //GPIO 18: level=0 alt=5 func=PWM0_0 pull=DOWN
  //18: a5    pd | lo // GPIO18 = PWM0_0
  /*
  PWM PWM(int chip, int channel)
  0,0 works - GPIO18
  0,1 works - GPIO19
  */
  /*
  https://librpip.frasersdev.net/peripheral-config/pwm0and1/

  PWM     GPIO Pin      Func (alternative function code)
  0       12            4
  0       18            2
  1       13            4
  1       19            2

  example for config.txt: dtoverlay=pwm,pin=18,func=2
  example for config.txt: dtoverlay=pwm-2chan,pin=12,func=4,pin2=13,func2=4

  This is all documented in /boot/overlays/README.
  */
  // ignore: prefer_typing_uninitialized_variables
  var pwm;

  void initializePwm() {
    pwm = PWM(2, 0); // chip, channel
    debugPrint('PWM Info: ${pwm.getPWMinfo()}');
  }

  void setPwmMotorDutyCycle(int pwmDutyCycle) {
    pwm.setPeriodNs(
        10000000); // Sets the period in [nanoseconds] of the PWM. 10000000nS is 100Hz
    pwm.setDutyCycleNs(
        pwmDutyCycle); // Sets the duty cycle in [nanoseconds] of the PWM.
    debugPrint(pwm.getPeriodNs().toString());
    pwm.enable();
    // debugPrint("Wait 20 seconds");
    // sleep(const Duration(seconds: 20));
    // pwm.disable();
  }

  void disposePwm() {
    pwm.dispose();
  }
}
